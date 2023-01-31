-- 1. Semi Join
-- Select country code for countries in the Middle East
SELECT code
FROM countries
-- Filter to Middle East
WHERE region = 'Middle East';

-- Select unique language names
SELECT DISTINCT name
FROM languages
-- Order by the name of the language
ORDER BY name;

SELECT DISTINCT name
FROM languages
-- Add syntax to use bracketed subquery below as a filter
WHERE code IN
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- 2. Diagnoising Problems Using Anti Join
-- Select code and name of countries from Oceania
SELECT code, name
FROM countries
WHERE continent = 'Oceania';

SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
AND code NOT IN
    (SELECT code
    FROM currencies);

-- 3. Subquery inside WHERE
-- Select average life_expectancy from the populations table
SELECT AVG(life_expectancy)
FROM populations
-- Filter for the year 2015
WHERE year = 2015;

SELECT *
FROM populations
-- Filter for only those populations where life expectancy is 1.15 times higher than average
WHERE life_expectancy > 1.15 * 
    (SELECT AVG(life_expectancy)
        FROM populations
        WHERE year = 2015) 
        AND year = 2015;

-- 4. WHERE do people live?
-- Select relevant fields from cities table
SELECT name, country_code, urbanarea_pop
FROM cities
-- Filter using a subquery on the countries table
WHERE name IN
    (SELECT capital 
    FROM countries)
ORDER BY urbanarea_pop DESC;

-- 5. Subquery inside SELECT
-- Find top nine countries with the most cities
SELECT countries.name AS country, COUNT(cities.name) AS cities_num
FROM countries
-- Join to cities table
LEFT JOIN cities
-- Match on country code
ON countries.code = cities.country_code
-- Group by country
GROUP BY countries.name
-- Order by count of cities as cities_num
ORDER BY cities_num DESC, country ASC
-- Limit to top 9
LIMIT 9;


SELECT countries.name AS country,
-- Subquery that provides the count of cities   
    (SELECT COUNT(cities.name)
    FROM cities
    WHERE cities.country_code = countries.code
    ) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- 6. Subquery inside FROM
-- Select code, and language count as lang_num
SELECT code, COUNT(*) AS lang_num
FROM languages
-- Group by code
GROUP BY code
-- Order by lang_num
ORDER BY lang_num DESC;

-- Select local_name and lang_num from appropriate tables
SELECT countries.local_name, sub.lang_num
FROM countries
JOIN (SELECT code, COUNT(*) AS lang_num
    FROM languages
    GROUP BY code
) AS sub
-- Where codes match
ON countries.code = sub.code
ORDER BY lang_num DESC;


-- 7. Subquery challenge
-- Select relevant fields
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
    AND code NOT IN (
-- Subquery returning country codes filtered on gov_form
        SELECT code
        FROM countries
        WHERE gov_form LIKE '%Republic%'
            OR gov_form LIKE '%Monarchy%'
    )
ORDER BY inflation_rate;

-- 8. Final challenge
-- Select fields from cities
SELECT 
	name, 
    country_code, 
    city_proper_pop, 
    metroarea_pop,
    city_proper_pop / metroarea_pop * 100 AS city_perc
FROM cities
-- Use subquery to filter city name
WHERE name IN
  (SELECT capital
   FROM countries
   WHERE (continent = 'Europe'
   OR continent LIKE '%America'))
-- Add filter condition such that metroarea_pop does not have null values
	  AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;