-- One-shot installer for exploratory (random) dataset
 -- Run as schema owner after creating the user.
 set define off
 set echo on
 set feedback on
 
 @02_create_objects.sql
 @03_load_random.sql
 @04_validate.sql
 
 prompt
 prompt Installation finished. If the validator showed WARN, the dataset is usable but may limit some examples.
 prompt
