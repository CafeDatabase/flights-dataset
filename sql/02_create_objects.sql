-- Creates all schema objects for FLIGHTS-BOOKINGS dataset
 -- Run as schema owner
 set echo on
 set define off
 set feedback on
 spool 02_create_objects.lst
 
 @@objects/flights.tab
 @@objects/flights.ind
 @@objects/flights.con
 @@objects/flights.sqs
 
 spool off
