-- 1. Comparing Global Economies

-- Select all fields from economies2015
SELECT *
FROM economies2015
-- Set operation
UNION
-- Select all fields from economies2019
SELECT *
FROM economies2019
ORDER BY code, year;

-- 2. Comparing two set operations
-- Query that determines all pairs of code and year from economies and populations, without duplicates
SELECT code, year
FROM economies
UNION
SELECT country_code, year
FROM populations

-- Amend the query to return all combinations (including duplicates) of country code and year in the economies or the populations tables.
SELECT code, year
FROM economies
-- Set theory clause
UNION ALL
SELECT country_code, year
FROM populations
ORDER BY code, year;

-- 3. Intersect
-- Return all cities with the same name as a country
SELECT name
FROM cities
-- Set theory clause
INTERSECT
SELECT name
FROM countries
ORDER BY name;

-- 4. Except
-- Return all cities that are not in the same country
SELECT name
FROM cities
-- Set theory clause
EXCEPT
SELECT name
FROM countries
ORDER BY name;