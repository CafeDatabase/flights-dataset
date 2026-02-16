-- Creates all schema objects for VUELOS-RESERVAS dataset
-- Run as schema owner (e.g., VUELOS)
set echo on
set define off
set feedback on
spool 02_create_objects.lst

@@objects/vuelos.tab
@@objects/vuelos.ind
@@objects/vuelos.con
@@objects/vuelos.sqs

spool off
