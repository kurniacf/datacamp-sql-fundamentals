-- 1. Practice with aggregate functions
-- Query the sum of film durations
SELECT SUM(duration) AS  total_duration
FROM films;

-- 2. Combining aggregate functions with WHERE
-- Calculate the sum of gross from the year 2000 or later
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;

-- 3. Using ROUND()
-- Round the average number of facebook_likes to one decimal place
SELECT ROUND(AVG(facebook_likes), 1) AS avg_facebook_likes
FROM reviews;

-- 4. ROUND() with a negative parameter
-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget), -3) AS avg_budget_thousands
FROM films;

-- 5. Aliasing with functions
-- Calculate the title and duration_hours from films
SELECT title, duration/60.0 AS duration_hours
FROM films;

-- 6. Rounding results
-- Round duration_hours to two decimal places
SELECT title, ROUND(duration / 60.0, 2) AS duration_hours
FROM films;

