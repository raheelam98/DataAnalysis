###  Cinema System - SQL Practice Assignment 2  
 Total Points: 10

```sql
-- ----------------------------------------
-- Table Setup
-- ----------------------------------------

USE ecommerce;

CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(100),
    description VARCHAR(100),
    rating DECIMAL(4, 2)
);

INSERT INTO Cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

SELECT * FROM Cinema;

-- ----------------------------------------
-- Part A: Basic SQL Queries and Updates
-- ----------------------------------------

-- 1. Retrieve movies with odd-numbered ID and non-'boring' description.
SELECT *
FROM Cinema
WHERE id % 2 != 0 AND description <> 'boring'
ORDER BY rating DESC;

-- 2. Update rating of 'War' by +0.5
UPDATE Cinema
SET rating = rating + 0.5
WHERE movie = 'War';

-- 3. Replace 'great 3D' with 'Amazing 3D experience'
UPDATE Cinema
SET description = 'Amazing 3D experience'
WHERE description = 'great 3D';

-- 4. Rename column 'movie' to 'movie_title'
ALTER TABLE Cinema
RENAME COLUMN movie TO movie_title;

-- 5. Add column 'simple_rating'
ALTER TABLE Cinema
ADD COLUMN simple_rating DOUBLE;

UPDATE Cinema
SET simple_rating = rating;

-- 6. Update simple_rating = rating * 2
UPDATE Cinema
SET simple_rating = rating * 2;

-- ----------------------------------------
-- Part B: Generated Columns
-- ----------------------------------------

-- 1. Add generated column 'rating_twice'
ALTER TABLE Cinema
ADD rating_twice DOUBLE GENERATED ALWAYS AS (rating * 2) STORED;

-- 2. Insert new row (Inception)
ALTER TABLE Cinema
CHANGE COLUMN movie_title movie VARCHAR(100);

INSERT INTO Cinema (id, movie, description, rating, simple_rating)
VALUES (6, 'Inception', 'Mind-bending', 9.3, 20);

-- 3. Try to update rating_twice directly (error)
-- UPDATE fails because 'rating_twice' is generated and read-only
-- UPDATE Cinema
-- SET rating_twice = 18
-- WHERE id = 6;

-- 4. Update rating and simple_rating, rating_twice updates automatically
UPDATE Cinema
SET rating = 0.75,
    simple_rating = rating * 2
WHERE id = 6;

-- ----------------------------------------
-- Part C: Reflection Questions
-- ----------------------------------------

-- 1. What happens when you try to update `rating_twice`?
-- Error: Cannot modify generated column

-- 2. What happens to `rating_twice` when `rating` is updated?
-- It updates automatically based on the new value of `rating`

-- 3. Key difference between `simple_rating` and `rating_twice`?
-- simple_rating is manual, rating_twice is auto-generated

-- 4. Can a generated column be removed?
-- Yes
ALTER TABLE Cinema
DROP COLUMN rating_twice;

SELECT * FROM Cinema;

```
