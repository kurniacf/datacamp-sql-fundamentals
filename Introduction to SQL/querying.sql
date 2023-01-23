-- 1. Querying the books table
-- Return all titles from the books table
SELECT title FROM books;

-- 2. Making queries DISTINCT
-- Select unique authors from the books table
SELECT DISTINCT author FROM books;

-- 3. Aliasing
-- Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author
FROM books;

-- 4. VIEWing your query
-- Save the results of this query as a view called library_authors
CREATE VIEW library_authors AS
    SELECT DISTINCT author AS unique_author
    FROM books;

-- 5. Limiting results
-- Select the first 10 genres from books using PostgreSQL
SELECT genre FROM books LIMIT 10;

