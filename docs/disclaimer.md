## Disclaimer: Canonical vs Exploratory dataset
 
 - To reproduce exactly the book/classes: use the **canonical dataset** (when available as Data Pump export).
 - For exploration and realistic variability: use the **random generator** (`install.sql` / `03_load_random.sql`).
 
 In exploratory mode, part of the variability comes from insertions discarded during load due to constraint violations.
 This is intentional to favor an unpredictable environment.