-- 1. Your first join
-- Select all columns from cities
SELECT * FROM cities;

SELECT * 
FROM cities
-- Inner join to countries
INNER JOIN countries
-- Match on country codes
ON cities.country_code = countries.code

-- Select name fields (with alias) and region 
SELECT cities.name AS city,
countries.name AS country, 
countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- 2. Joining with aliased tables
-- Select fields with aliases
SELECT c.code AS country_code, 
    c.name,
    e.year,
    e.inflation_rate
FROM countries AS c 
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code = e.code

-- 3. USING in action
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING(code)

-- 4. Inspecting a relationship
-- Select country and language names, aliased
Select 
    c.name AS country,
    l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING(code);


-- Rearrange SELECT statement, keeping aliases
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l
USING(code)
-- Order the results by language
ORDER BY language;


-- 5. Joining multiple tables
-- Select relevant fields
SELECT name, year, fertility_rate
-- Inner join countries and populations, aliased, on code
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code;

-- 6. Checking multi-table joins
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	AND p.year = e.year;