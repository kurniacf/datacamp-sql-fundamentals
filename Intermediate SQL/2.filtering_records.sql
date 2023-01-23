-- 1. Using WHERE with numbers
-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score 
FROM reviews
WHERE imdb_score > 7.0;

-- 2. Using WHERE with text
-- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language='Spanish';

-- 3. Using AND
-- Select the title and release_year for all German-language films released before 2000
SELECT title, release_year 
FROM films
WHERE language = 'German' AND release_year < 2000;

-- 4. Using OR
-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year=1990 OR release_year=1999;

-- 5. Using BETWEEN
-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

-- 6. LIKE and NOT LIKE
-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

-- 7. WHERE IN
-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN ('1990', '2000') AND duration > 120;

-- 8. Combining filtering and selecting
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE (release_year BETWEEN 1990 AND 1999)
-- Filter to English-language films
	AND (language = 'English')
-- Narrow it down to G, PG, and PG-13 certifications
	AND (certification IN ('G', 'PG', 'PG-13'));

-- 9. Practice with NULLs
-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;