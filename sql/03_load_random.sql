-- Populates the dataset using the original random generator (exploratory mode)
-- Note: this generator intentionally allows silent rejects via exception handling.
-- Run as schema owner (e.g., VUELOS)
set define off
set feedback on
set echo on
-- Keep SERVEROUTPUT off to avoid noisy output during load.
set serveroutput off
-- Explicitly disable DBMS_OUTPUT in the session (some tools keep it enabled).
begin dbms_output.disable; end;
/
spool 03_load_random.lst

@crea_filas.sql

spool off