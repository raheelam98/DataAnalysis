-- Practice Question 2
-- Session_03 - 10 May 2025

-- SQL Practice Assignment: Cinema Table
-- Total Points: 10

-- ----------------------------------------
-- Table Setup
-- ----------------------------------------

-- Step 1: Create the Cinema table
CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(100),
    description VARCHAR(100),
    rating DECIMAL(4, 2)
);

-- Step 2: Insert sample data
INSERT INTO Cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

-- ----------------------------------------
-- Part A: Basic SQL Queries and Updates
-- ----------------------------------------

-- 1. Retrieve movies with an odd-numbered ID and a description that is not "boring".
--    Return the results ordered by rating in descending order.


-- 2. Update the rating of the movie 'War' by increasing it by 0.5.


-- 3. Replace the description 'great 3D' with 'Amazing 3D experience'.


-- 4. Rename the column "movie" to "movie_title".


-- 5. Add a new column called "simple_rating" with data type DOUBLE.


-- 6. Manually update each row so that simple_rating = rating * 2.


-- ----------------------------------------
-- Part B: Generated Columns (Auto-calculated)
-- ----------------------------------------
-- Run the following queries and observe the differences between 
-- manually updated and auto-generated columns.


-- 1. Add a generated column that automatically calculates rating * 2
ALTER TABLE Cinema
ADD rating_twice DOUBLE GENERATED ALWAYS AS (rating * 2);

SELECT * FROM Cinema;


-- 2. Insert a new row with a manual value for simple_rating.
--    Note: random value given for simple_rating is allowed because it's a regular column.
--    The generated column rating_twice will auto-calculate the correct value.

INSERT INTO Cinema (id, movie, description, rating, simple_rating)
VALUES (6, 'Inception', 'Mind-bending', 9.3, 20);


SELECT * FROM Cinema;


-- 3. Try to update rating_twice directly and observe the error.

UPDATE Cinema
SET rating = 10,
    simple_rating = rating * 2,
    rating_twice = rating * 2
WHERE id = 6;

SELECT * FROM Cinema;


-- 4. Update rating and simple_rating only.
--    Observe how rating_twice is automatically updated.
UPDATE Cinema
SET rating = 0.75,
    simple_rating = rating * 2
WHERE id = 6;

SELECT * FROM Cinema;

-- ----------------------------------------
-- Part C: Reflection Questions (Max two lines answer)
-- ----------------------------------------

-- 1. What happens when you try to manually insert or update a value in the `rating_twice` column?

-- 2. What happens to `rating_twice` when you update the `rating` column?
--    Is it updated automatically? How does this behavior compare to `simple_rating`?

-- 3. What is the key difference between `simple_rating` and `rating_twice`?
--    Which one is manually controlled and which one is auto-generated?

-- 4. Can a generated column be removed after it’s added?
--    Try ALTER command

