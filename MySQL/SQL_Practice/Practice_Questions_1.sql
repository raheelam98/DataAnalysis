-- Practice Question 1
-- Session_02 - 7 May 2025

-- -------------------------------------------------------------------
-- Create the World table
CREATE TABLE World (
    name VARCHAR(255) PRIMARY KEY,
    continent VARCHAR(100),
    area INT,
    population INT,
    gdp BIGINT
);

-- Insert sample data
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);


-- 1. Find all countries in the 'Asia' continent.


-- 2. List the names and GDP of countries with a GDP greater than 100 billion.

-- 3. Select the countries with population more than 25 million.

-- 4. Find the countries that are considered 'big'.
-- (Area ≥ 3,000,000 OR Population ≥ 25,000,000)

-- 5. Find the names of countries that are big (Area ≥ 3,000,000 OR Population ≥ 25,000,000) AND located in Asia.

-- 6. Display the top 3 most populous countries.

-- 7. Find countries whose name starts with the letter 'A'.

-- 8. Find countries whose name ends with the letter 'a'.

-- 9. List all countries that are not in Europe.

-- 10. Find countries whose name does not contain the letter 'e'.
