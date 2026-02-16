# FLIGHTS-BOOKINGS dataset (Cafe Database)
 
 This repository contains the **FLIGHTS-BOOKINGS model** used as a base for examples for *SQL Optimization in Oracle*.
 
 ## Two ways
 
 ### 1) Canonical Dataset (book/class reproduction)
 
 - **Goal:** reproducibility (same results as the book/classes).
 - **Status:** the canonical artifact (e.g. `expdp/impdp`) will be added when published as a Data Pump export.
 
 ### 2) Exploratory Dataset (random)
 
 - **Goal:** realistic variability. The load allows silent rejects by design to keep an unpredictable scenario.
 - **Usage:** ideal for experimenting and finding (or not) emerging patterns, like in real environments.
 
 ## Installation (exploratory)
 
 1. Create user (example):
 
 ```sql
 create user flights identified by flights default tablespace users quota unlimited on users;
 grant connect, resource to flights;
 ```
 
 2. Run the installer (SQL*Plus / SQLcl):
 
 ```sql
 @sql/install.sql
 ```
 
 The script executes:
 - Object creation (`02_create_objects.sql`)
 - Random load (`03_load_random.sql`)
 - Minimal validation (`04_validate.sql`)
 
 ## Validation
 
 The validator produces **OK / WARN / FAIL**.
 - **FAIL:** redo load.
 - **WARN:** dataset usable, but may limit some examples (volume/distribution).
 
 Agreed threshold: `FLIGHTS >= 30,000`.
