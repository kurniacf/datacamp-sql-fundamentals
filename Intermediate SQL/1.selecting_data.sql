-- 1. Practice with COUNT()
-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people; 

-- 2. SELECT DISTINCT
-- Return the unique countries from the films table
SELECT DISTINCT country FROM films;

-- 3. Debugging errors
-- Debug this code
SELECT certification
FROM films
LIMIT 5;

-- 4. Formatting
-- Rewrite this query
SELECT person_id, role 
FROM roles 
LIMIT 10;