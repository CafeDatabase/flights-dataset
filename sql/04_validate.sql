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
  v_vuelos        NUMBER;
  v_reservas      NUMBER;
  v_plazas        NUMBER;
  v_ratio         NUMBER;
  v_bad_same      NUMBER;
  v_disabled_cons NUMBER;
  v_air_active    NUMBER;
  v_ag_active     NUMBER;
  v_top_pct       NUMBER;

  v_status  VARCHAR2(10) := 'OK';
  v_msgs    CLOB := EMPTY_CLOB();

  -- thresholds (agreed)
  c_min_vuelos    CONSTANT NUMBER := 30000;
  c_warn_reservas CONSTANT NUMBER := 90000;
  c_warn_plazas   CONSTANT NUMBER := 1200000;
  c_fail_ratio_lo CONSTANT NUMBER := 10;
  c_warn_ratio_lo CONSTANT NUMBER := 30;
  c_warn_ratio_hi CONSTANT NUMBER := 300;
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
  SELECT COUNT(*) INTO v_vuelos   FROM vuelos;
  SELECT COUNT(*) INTO v_reservas FROM reservas;
  SELECT COUNT(*) INTO v_plazas   FROM plazas;

  IF v_vuelos = 0 THEN
    set_fail('No hay filas en VUELOS. La carga no se ha ejecutado.');
  END IF;

  IF v_vuelos < c_min_vuelos THEN
    set_fail('VUELOS='||v_vuelos||' < '||c_min_vuelos||' (mínimo).');
  END IF;

  IF v_reservas < c_warn_reservas THEN
    set_warn('RESERVAS='||v_reservas||' < '||c_warn_reservas||' (bajo para algunos ejemplos).');
  END IF;

  IF v_plazas < c_warn_plazas THEN
    set_warn('PLAZAS='||v_plazas||' < '||c_warn_plazas||' (bajo para algunos ejemplos).');
  END IF;

  IF v_vuelos > 0 THEN
    v_ratio := v_plazas / v_vuelos;
  ELSE
    v_ratio := NULL;
  END IF;

  IF v_ratio IS NOT NULL THEN
    IF v_ratio < c_fail_ratio_lo THEN
      set_fail('Ratio PLAZAS/VUELOS='||TO_CHAR(v_ratio,'FM9990D00')||' < '||c_fail_ratio_lo||' (carga incompleta).');
    ELSIF v_ratio < c_warn_ratio_lo OR v_ratio > c_warn_ratio_hi THEN
      set_warn('Ratio PLAZAS/VUELOS='||TO_CHAR(v_ratio,'FM9990D00')||' fuera de rango típico ['||c_warn_ratio_lo||','||c_warn_ratio_hi||'].');
    END IF;
  END IF;

  -- Semantics: origen != destino
  BEGIN
    SELECT COUNT(*) INTO v_bad_same
    FROM vuelos
    WHERE aer_id_aero = aer_id_aero_destino;
  EXCEPTION
    WHEN OTHERS THEN
      v_bad_same := 0; -- If columns differ in some installations, skip.
  END;

  IF v_bad_same > 0 THEN
    set_fail('Hay '||v_bad_same||' vuelos con ORIGEN=DESTINO (debería ser 0).');
  END IF;

  -- Constraints enabled (PK/FK)
  SELECT COUNT(*) INTO v_disabled_cons
  FROM user_constraints
  WHERE constraint_type IN ('P','R')
    AND status <> 'ENABLED';

  IF v_disabled_cons > 0 THEN
    set_fail('Hay '||v_disabled_cons||' constraints PK/FK que no están ENABLED.');
  END IF;

  -- Activity breadth
  BEGIN
    SELECT COUNT(DISTINCT a) INTO v_air_active
    FROM (
      SELECT aer_id_aero a FROM vuelos
      UNION ALL
      SELECT aer_id_aero_destino a FROM vuelos
    );
  EXCEPTION
    WHEN OTHERS THEN
      v_air_active := NULL;
  END;

  IF v_air_active IS NOT NULL AND v_air_active < c_warn_active_air THEN
    set_warn('Aeropuertos activos='||v_air_active||' < '||c_warn_active_air||' (distribución pobre).');
  END IF;

  BEGIN
    SELECT COUNT(DISTINCT age_id_agencia) INTO v_ag_active
    FROM reservas;
  EXCEPTION
    WHEN OTHERS THEN
      v_ag_active := NULL;
  END;

  IF v_ag_active IS NOT NULL AND v_ag_active < c_warn_active_ag THEN
    set_warn('Agencias con reservas='||v_ag_active||' < '||c_warn_active_ag||' (distribución pobre).');
  END IF;

  -- Skew check: top origin airport %
  BEGIN
    SELECT MAX(pct) INTO v_top_pct
    FROM (
      SELECT aer_id_aero,
             COUNT(*) / NULLIF(SUM(COUNT(*)) OVER (),0) * 100 AS pct
      FROM vuelos
      GROUP BY aer_id_aero
    );
  EXCEPTION
    WHEN OTHERS THEN
      v_top_pct := NULL;
  END;

  IF v_top_pct IS NOT NULL THEN
    IF v_top_pct < 1 THEN
      set_warn('Skew bajo: top aeropuerto origen='||TO_CHAR(v_top_pct,'FM9990D00')||'%.');
    ELSIF v_top_pct > 50 THEN
      set_warn('Skew extremo: top aeropuerto origen='||TO_CHAR(v_top_pct,'FM9990D00')||'%.');
    END IF;
  END IF;

  -- Print summary
  dbms_output.put_line('Estado: '||v_status);
  dbms_output.put_line('Conteos: VUELOS='||v_vuelos||', RESERVAS='||v_reservas||', PLAZAS='||v_plazas);
  IF v_ratio IS NOT NULL THEN
    dbms_output.put_line('Ratio PLAZAS/VUELOS: '||TO_CHAR(v_ratio,'FM9990D00'));
  END IF;
  IF v_air_active IS NOT NULL THEN
    dbms_output.put_line('Aeropuertos activos: '||v_air_active);
  END IF;
  IF v_ag_active IS NOT NULL THEN
    dbms_output.put_line('Agencias con reservas: '||v_ag_active);
  END IF;
  IF v_top_pct IS NOT NULL THEN
    dbms_output.put_line('Skew (top origen %): '||TO_CHAR(v_top_pct,'FM9990D00'));
  END IF;

  IF v_msgs IS NOT NULL AND LENGTH(v_msgs) > 0 THEN
    dbms_output.put_line('----');
    dbms_output.put_line(v_msgs);
  END IF;
 
  -- Firma final para VSCode/CI (una sola línea)
  if v_status = 'OK' then
    dbms_output.put_line('DATASET_OK');
  elsif v_status = 'WARN' then
    dbms_output.put_line('DATASET_WARN');
  else
    dbms_output.put_line('DATASET_FAIL');
    raise_application_error(-20001, 'Dataset inválido (FAIL).');
  end if;

end;
/
spool off
