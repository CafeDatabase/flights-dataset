-- Minimal validator for the exploratory (random) dataset.
 -- States: OK / WARN / FAIL
 -- FAIL causes SQL*Plus to exit with non-zero status.
 
 set define off
 set feedback off
 set verify off
 set pagesize 0
 set linesize 200
 set trimspool on
 set serveroutput on size unlimited
 whenever sqlerror exit failure
 
 spool 04_validate.lst
 
 DECLARE
   v_flights        NUMBER;
   v_bookings       NUMBER;
   v_seats          NUMBER;
   v_ratio          NUMBER;
   v_bad_same       NUMBER;
   v_disabled_cons  NUMBER;
   v_air_active     NUMBER;
   v_ag_active      NUMBER;
   v_top_pct        NUMBER;
 
   v_status  VARCHAR2(10) := 'OK';
   v_msgs    CLOB := EMPTY_CLOB();
 
   -- thresholds (agreed)
   c_min_flights    CONSTANT NUMBER := 30000;
   c_warn_bookings  CONSTANT NUMBER := 90000;
   c_warn_seats     CONSTANT NUMBER := 1200000;
   c_fail_ratio_lo  CONSTANT NUMBER := 10;
   c_warn_ratio_lo  CONSTANT NUMBER := 30;
   c_warn_ratio_hi  CONSTANT NUMBER := 300;
   c_warn_active_air CONSTANT NUMBER := 10;
   c_warn_active_ag  CONSTANT NUMBER := 10;
 
   PROCEDURE add_msg(p_msg VARCHAR2) IS
   BEGIN
     v_msgs := v_msgs || p_msg || CHR(10);
   END;
 
   PROCEDURE set_warn(p_msg VARCHAR2) IS
   BEGIN
     IF v_status = 'OK' THEN
       v_status := 'WARN';
     END IF;
     add_msg('WARN: ' || p_msg);
   END;
 
   PROCEDURE set_fail(p_msg VARCHAR2) IS
   BEGIN
     v_status := 'FAIL';
     add_msg('FAIL: ' || p_msg);
   END;
 
 BEGIN
   SELECT COUNT(*) INTO v_flights   FROM FLIGHTS;
   SELECT COUNT(*) INTO v_bookings  FROM BOOKINGS;
   SELECT COUNT(*) INTO v_seats     FROM SEATS;
 
   IF v_flights = 0 THEN
     set_fail('No rows in FLIGHTS. Load failed or not run.');
   END IF;
 
   IF v_flights < c_min_flights THEN
     set_fail('FLIGHTS='||v_flights||' < '||c_min_flights||' (minimum).');
   END IF;
 
   IF v_bookings < c_warn_bookings THEN
     set_warn('BOOKINGS='||v_bookings||' < '||c_warn_bookings||' (low for some examples).');
   END IF;
 
   IF v_seats < c_warn_seats THEN
     set_warn('SEATS='||v_seats||' < '||c_warn_seats||' (low for some examples).');
   END IF;
 
   IF v_flights > 0 THEN
     v_ratio := v_seats / v_flights;
   ELSE
     v_ratio := NULL;
   END IF;
 
   IF v_ratio IS NOT NULL THEN
     IF v_ratio < c_fail_ratio_lo THEN
       set_fail('Ratio SEATS/FLIGHTS='||TO_CHAR(v_ratio,'FM9990D00')||' < '||c_fail_ratio_lo||' (incomplete load).');
     ELSIF v_ratio < c_warn_ratio_lo OR v_ratio > c_warn_ratio_hi THEN
       set_warn('Ratio SEATS/FLIGHTS='||TO_CHAR(v_ratio,'FM9990D00')||' out of typical range ['||c_warn_ratio_lo||','||c_warn_ratio_hi||'].');
     END IF;
   END IF;
 
   -- Semantics: origin != destination
   BEGIN
     SELECT COUNT(*) INTO v_bad_same
     FROM FLIGHTS
     WHERE AIRP_ID_AIRPORT_ORIGIN = AIRP_ID_AIRPORT_DEST;
   EXCEPTION
     WHEN OTHERS THEN
       v_bad_same := 0; 
   END;
 
   IF v_bad_same > 0 THEN
     set_fail('There are '||v_bad_same||' flights with ORIGIN=DEST (should be 0).');
   END IF;
 
   -- Constraints enabled (PK/FK)
   SELECT COUNT(*) INTO v_disabled_cons
   FROM user_constraints
   WHERE constraint_type IN ('P','R')
     AND status <> 'ENABLED';
 
   IF v_disabled_cons > 0 THEN
     set_fail('There are '||v_disabled_cons||' PK/FK constraints that are not ENABLED.');
   END IF;
 
   -- Activity breadth
   BEGIN
     SELECT COUNT(DISTINCT a) INTO v_air_active
     FROM (
       SELECT AIRP_ID_AIRPORT_ORIGIN a FROM FLIGHTS
       UNION ALL
       SELECT AIRP_ID_AIRPORT_DEST a FROM FLIGHTS
     );
   EXCEPTION
     WHEN OTHERS THEN
       v_air_active := NULL;
   END;
 
   IF v_air_active IS NOT NULL AND v_air_active < c_warn_active_air THEN
     set_warn('Active airports='||v_air_active||' < '||c_warn_active_air||' (poor distribution).');
   END IF;
 
   BEGIN
     SELECT COUNT(DISTINCT AGENCY_ID_AGENCY) INTO v_ag_active
     FROM BOOKINGS;
   EXCEPTION
     WHEN OTHERS THEN
       v_ag_active := NULL;
   END;
 
   IF v_ag_active IS NOT NULL AND v_ag_active < c_warn_active_ag THEN
     set_warn('Agencies with bookings='||v_ag_active||' < '||c_warn_active_ag||' (poor distribution).');
   END IF;
 
   -- Skew check: top origin airport %
   BEGIN
     SELECT MAX(pct) INTO v_top_pct
     FROM (
       SELECT AIRP_ID_AIRPORT_ORIGIN,
              COUNT(*) / NULLIF(SUM(COUNT(*)) OVER (),0) * 100 AS pct
       FROM FLIGHTS
       GROUP BY AIRP_ID_AIRPORT_ORIGIN
     );
   EXCEPTION
     WHEN OTHERS THEN
       v_top_pct := NULL;
   END;
 
   IF v_top_pct IS NOT NULL THEN
     IF v_top_pct < 1 THEN
       set_warn('Low skew: top origin airport='||TO_CHAR(v_top_pct,'FM9990D00')||'%.');
     ELSIF v_top_pct > 50 THEN
       set_warn('Extreme skew: top origin airport='||TO_CHAR(v_top_pct,'FM9990D00')||'%.');
     END IF;
   END IF;
 
   -- Print summary
   dbms_output.put_line('Status: '||v_status);
   dbms_output.put_line('Counts: FLIGHTS='||v_flights||', BOOKINGS='||v_bookings||', SEATS='||v_seats);
   IF v_ratio IS NOT NULL THEN
     dbms_output.put_line('Ratio SEATS/FLIGHTS: '||TO_CHAR(v_ratio,'FM9990D00'));
   END IF;
   IF v_air_active IS NOT NULL THEN
     dbms_output.put_line('Active airports: '||v_air_active);
   END IF;
   IF v_ag_active IS NOT NULL THEN
     dbms_output.put_line('Agencies with bookings: '||v_ag_active);
   END IF;
   IF v_top_pct IS NOT NULL THEN
     dbms_output.put_line('Skew (top origin %): '||TO_CHAR(v_top_pct,'FM9990D00'));
   END IF;
 
   IF v_msgs IS NOT NULL AND LENGTH(v_msgs) > 0 THEN
     dbms_output.put_line('----');
     dbms_output.put_line(v_msgs);
   END IF;
 
   if v_status = 'OK' then
     dbms_output.put_line('DATASET_OK');
   elsif v_status = 'WARN' then
     dbms_output.put_line('DATASET_WARN');
   else
     dbms_output.put_line('DATASET_FAIL');
     raise_application_error(-20001, 'Invalid Dataset (FAIL).');
   end if;
 
 END;
 /
 spool off
