### World Table 

**SQL Practice Assignment 1 - Answers**

```sql

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
SELECT * FROM world
WHERE continent = 'Asia';

-- 2. List the names and GDP of countries with a GDP greater than 100 billion.
SELECT name, gdp FROM world
WHERE gdp > 100000000000;

-- 3. Select the countries with population more than 25 million.
SELECT * FROM world
WHERE population > 25000000;

-- 4. Find the countries that are considered 'big' (Area ≥ 3,000,000 OR Population ≥ 25,000,000).
SELECT * FROM world
WHERE population >= 25000000 OR area >= 3000000;

-- 5. Find the names of countries that are big AND located in Asia.
SELECT * FROM world
WHERE (population >= 25000000 OR area >= 3000000) AND continent = 'Asia';

-- 6. Display the top 3 most populous countries.
SELECT * FROM world
ORDER BY population DESC
LIMIT 3;

-- 7. Find countries whose name starts with the letter 'A'.
SELECT * FROM world
WHERE name LIKE 'A%';

-- 8. Find countries whose name ends with the letter 'a'.
SELECT * FROM world
WHERE name LIKE '%a';

-- 9. List all countries that are not in Europe.
SELECT * FROM world
WHERE continent <> 'Europe';

-- 10. Find countries whose name does not contain the letter 'e'.
SELECT * FROM world
WHERE name NOT LIKE '%e%';

-- Display all data
SELECT * FROM world;

```
