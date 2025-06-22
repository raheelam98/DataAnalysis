-- Practice Questions Answers - 4 
-- Session_05 - 15 May 2025

-- ----------------------------------------------------------------------------
-- Table Setup
-- ----------------------------------------------------------------------------
-- NOTES
-- WHERE :-  Filters rows before groups are aggregated.
-- HAVING :- Filters groups after the aggregation process..

-- CASE case_value
-- WHEN condition THEN result1
-- WHEN condition THEN result2
-- Else result
-- END CASE;
-- ----------------------------------------------------------------------------

USE Ecommerce;

-- Create patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    city VARCHAR(50)
);

-- Insert data into patients
INSERT INTO patients (patient_id, name, gender, age, city) VALUES
(1, 'Ali', 'M', 45, 'Lahore'),
(2, 'Sara', 'F', 30, 'Karachi'),
(3, 'Zain', 'M', 60, 'Islamabad'),
(4, 'Ayesha', 'F', 25, 'Lahore'),
(5, 'Bilal', 'M', 50, 'Karachi'),
(6, 'Nida', 'F', 35, 'Peshawar'),
(7, 'Usman', 'M', 40, 'Quetta'),
(8, 'Hina', 'F', 28, 'Lahore'),
(9, 'Kashif', 'M', 55, 'Islamabad'),
(10, 'Farah', 'F', 32, 'Karachi'),
(11, 'Tariq', 'M', 65, 'Lahore'),     
(12, 'Noor', 'F', 70, 'Peshawar'),      
(13, 'Hammad', 'M', 22, 'Islamabad'),   
(14, 'Mehak', 'F', 19, 'Quetta'),       
(15, 'Adeel', 'M', 67, 'Karachi'),
(16, 'Usama', 'M', 62, 'Quetta'),
(17, 'Haniya', 'F', 18, 'Peshawar'),
(18, 'Qasim', 'M', 15, 'Quetta'),
(19, 'Fariyal', 'F', 52, 'Quetta'),
(20, 'Haris', 'M',12, 'Islamabad'); 

-- Create visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    visit_date DATE,
    diagnosis VARCHAR(50),
    fee INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Insert data into visits
INSERT INTO visits (visit_id, patient_id, visit_date, diagnosis, fee) VALUES
(201, 1, '2024-01-05', 'Diabetes', 1500),
(202, 1, '2024-03-01', 'Flu', 600),
(203, 2, '2024-01-10', 'Flu', 500),
(204, 3, '2024-01-12', 'Hypertension', 1000),
(205, 4, '2024-02-03', 'Flu', 500),
(206, 5, '2024-02-05', 'Diabetes', 1500),
(207, 6, '2024-02-06', 'Anxiety', 1200),
(208, 7, '2024-02-07', 'Flu', 600),
(209, 8, '2024-02-10', 'Anxiety', 1200),
(210, 9, '2024-02-12', 'Diabetes', 1500),
(211, 10, '2024-02-15', 'Hypertension', 1000),
(212, 11, '2024-03-26', 'Hypertension', 1000),
(213, 12, '2024-03-27', 'Diabetes', 1500),
(214, 15, '2024-03-30', 'Flu', 500),
(215, 16, '2024-03-31', 'Heart Disease', 1800),
(216, 13, '2024-03-28', 'Flu', 500),
(217, 14, '2024-03-29', 'Anxiety', 1200),
(218, 17, '2024-04-01', 'Cold', 400),
(219, 18, '2024-04-02', 'Flu', 600),
(220, 19, '2024-04-03', 'Diabetes', 1500),
(221, 20, '2024-04-04', 'Cold', 400);

SELECT * FROM  patients;
DESC patients;

SELECT * FROM  visits;
DESC visits;

-- ----------------------------------------------------------------------------
-- Questions
-- ----------------------------------------------------------------------------

-- 1. How many visits per diagnosis type?

SELECT diagnosis, COUNT(visit_id) AS visit_count
FROM  visits
GROUP BY diagnosis;

-- 2. Find out the count of patients from each city.

SELECT city, COUNT(patient_id) AS number_of_patents
FROM patients
GROUP BY city;

-- 3. Find diagnosis types with more than 2 patient visit.

SELECT * FROM  visits;

SELECT diagnosis, COUNT(*) AS number_of_visit
FROM visits
GROUP BY diagnosis
HAVING COUNT(*) > 2;  -- Filters only those diagnosis types with more than 2 visits
-- HAVING :- Filters groups after the aggregation process

-- 4. Label visits as 'Expensive' if fee > 1000, else 'Normal'

SELECT *,
CASE
	WHEN fee >1000 THEN 'Expensive'
    ELSE 'Normal'
END AS fee_visit    
FROM visits;


-- 5. Count how many visits fall into each cost category (Expensive and Normal). Use the previous question condition.

SELECT
    CASE
        WHEN fee > 1000 THEN 'Expensive'
        ELSE 'Normal'
    END AS fee_category,
    COUNT(*) AS total_visits -- counts the number of rows (i.e., number of visits) in each fee_category
FROM visits
GROUP BY fee_category;


-- 6. Categorize patients based on age:
-- Age is greater than or equal to 60 => Senior
-- Age is greater than or equal to 30 => Adult
-- Else Young

SELECT * FROM patients;

SELECT *,
	CASE 
		WHEN age >= 60  THEN 'Senior'
        WHEN age >= 30 THEN 'Adult'
        ELSE 'Young'
	END AS age_category
FROM patients;


-- 7. Add a column "Age_group" in table "patients" and update the value using case statement as in previous question.

ALTER TABLE patients
ADD COLUMN Age_group VARCHAR(20);

DESC patients;

set sql_safe_updates =0;

UPDATE patients
SET Age_group = 
    CASE 
        WHEN age >= 60 THEN 'Senior'
        WHEN age >= 30 THEN 'Adult'
        ELSE 'Young'
    END;

SELECT * FROM patients;			

-- 8. Write an SQL query to count the number of customers in each age category 
-- (Senior, Adult, Young) in each city from the customers table. 

SELECT * FROM customers;

-- get the age from data_of_birth
-- TIMESTAMPDIFF(unit,expr1,expr2) -- unit :- YESAR, MONTH , ECT
SELECT 	*,
	TIMESTAMPDIFF(YEAR, date_of_birth, now()) AS customer_age
FROM customers;

-- add age_category column
ALTER TABLE customers
ADD COLUMN age_category VARCHAR(20);

UPDATE customers
	SET age_category =
		CASE
			WHEN age >= 60 THEN 'Senior'
            WHEN age >= 30 THEN 'Adult'
            ELSE 'Young'
          END;
         

SELECT city, age_category, COUNT(*) AS customer_count
FROM customers
GROUP BY city, age_category;


-- ALTER TABLE customers
-- ADD COLUMN customer_age INT;

-- -- insert data into customer_age 
-- UPDATE customers
-- 	SET customer_age = TIMESTAMPDIFF(YEAR, date_of_birth, now());
--     

-- ALTER TABLE customers
-- DROP COLUMN age_category ;


-- 9: List visits along with patient details (hint: show all columns from both tables)

SELECT *
FROM visits v
JOIN patients p ON v.patient_id = p.patient_id;


-- 10. Write a query to find the patients who have visited the hospital more than once. 
-- For each of these patients, display their patient_id, name, and the total number of visits they made.

-- Hints:
-- Use the INNER JOIN to combine data from the patients and visits tables.
-- Group the data by patient_id and name.
-- count the number of visits for each patient.
-- Use the HAVING clause to show patients with more than one visit.

-- Double check
SELECT 
    p.patient_id, 
    p.name, 
    COUNT(v.visit_id) AS total_visits
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
GROUP BY 
    p.patient_id, p.name
HAVING 
    COUNT(v.visit_id) > 1;

