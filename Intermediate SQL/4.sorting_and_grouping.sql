-- 1. Sorting single fields
-- Select name from people and sort alphabetically
SELECT name
FROM people
ORDER BY name;

-- 2. Sorting multiple fields
-- Select the release year, duration, and title sorted by release year and duration
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration; 

-- 3. GROUP BY single fields
-- Find the release_year and film_count of each year
SELECT release_year, COUNT(id) AS film_count
FROM films
GROUP BY release_year;

-- 4. GROUP BY multiple fields
-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country;

-- 5. Filter with HAVING
-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;

-- 6. HAVING and sorting
-- Select the country and average_budget from films
SELECT country, AVG(budget) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING AVG(budget) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;

-- 7. All together now
-- Select the budget for films released after 1990 grouped by year
SELECT release_year, SUM(budget)
FROM films

GROUP BY release_year
HAVING release_year > 1990;