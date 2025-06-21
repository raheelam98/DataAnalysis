### Hospital System

**Practice_Questions_Answer_4 : Answers** 

**Session_05**

```sql

-- ------------------------------------------------------------
-- Table Setup
-- ------------------------------------------------------------
USE Hospital;

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender CHAR(1),
    age INT,
    city VARCHAR(50)
);

INSERT INTO patients VALUES
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
(20, 'Haris', 'M', 12, 'Islamabad');

CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    visit_date DATE,
    diagnosis VARCHAR(50),
    fee INT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

INSERT INTO visits VALUES
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

-- ------------------------------------------------------------
-- Questions & Answers
-- ------------------------------------------------------------

-- 1. Visits per diagnosis type
SELECT diagnosis, COUNT(*) AS visit_count FROM visits GROUP BY diagnosis;

-- 2. Patient count from each city
SELECT city, COUNT(*) AS number_of_patients FROM patients GROUP BY city;

-- 3. Diagnosis types with more than 2 visits
SELECT diagnosis, COUNT(*) AS visit_count FROM visits GROUP BY diagnosis HAVING COUNT(*) > 2;

-- 4. Label visits by fee
SELECT *, CASE WHEN fee > 1000 THEN 'Expensive' ELSE 'Normal' END AS fee_visit FROM visits;

-- 5. Count visits per cost category
SELECT CASE WHEN fee > 1000 THEN 'Expensive' ELSE 'Normal' END AS fee_category, COUNT(*) AS total_visits FROM visits GROUP BY fee_category;

-- 6. Categorize patients by age
SELECT *, CASE WHEN age >= 60 THEN 'Senior' WHEN age >= 30 THEN 'Adult' ELSE 'Young' END AS age_category FROM patients;

-- 7. Add and update Age_group column
ALTER TABLE patients ADD COLUMN Age_group VARCHAR(20);
UPDATE patients SET Age_group = CASE WHEN age >= 60 THEN 'Senior' WHEN age >= 30 THEN 'Adult' ELSE 'Young' END;

-- 8. Count customers by age category and city (assumes customers table with date_of_birth exists)
-- Sample only: UPDATE and transformation using TIMESTAMPDIFF skipped due to table reference
-- SELECT city, age_category, COUNT(*) FROM customers GROUP BY city, age_category;

-- 9. Join patients and visits
SELECT * FROM visits v JOIN patients p ON v.patient_id = p.patient_id;

-- 10. Patients who visited more than once
SELECT p.patient_id, p.name, COUNT(v.visit_id) AS total_visits FROM patients p INNER JOIN visits v ON p.patient_id = v.patient_id GROUP BY p.patient_id, p.name HAVING COUNT(v.visit_id) > 1;

```
