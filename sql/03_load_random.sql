-- Populates the dataset using value generators
 -- Run as schema owner
 set define off
 set feedback on
 set echo on
 set serveroutput on
 
 spool 03_load_random.lst
 
 -- Load static data
 @create_rows.sql
 
 -- Compile procedures
 @load_customers.prc
 @load_flights.prc
 @load_bookings.prc
 
 -- Execute load
 prompt Loading flights...
 exec load_flights;
 
 prompt Loading customers...
 exec load_customers;
 
 prompt Loading bookings...
 exec load_bookings;
 
 spool off