### Appointment Analysis

**Medical Record System Analysis - Solution**


```sql
-- -----------------------------------------------------------------------------------
-- MY SQL Project: Appointments Analysis
-- -----------------------------------------------------------------------------------

-- Step 1: Create and use the database
CREATE DATABASE Appointments;
USE Appointments;

-- -----------------------------------------------------------------------------------
-- Basic SQL & Data Retrieval
-- -----------------------------------------------------------------------------------
-- 1. Retrieve all columns from the Appointments table
SELECT * FROM Appointments_tbl;

-- 2. List the first 10 appointments where the patient is older than 60
SELECT * FROM Appointments_tbl WHERE age > 60 LIMIT 10;

-- 3. Show the unique neighborhoods from which patients came
SELECT DISTINCT neighbourhood FROM Appointments_tbl;

-- 4. Find all female patients who received an SMS reminder
SELECT COUNT(*) FROM Appointments_tbl WHERE gender = 'female' AND SMS_received = 1;

-- 5. Display all appointments scheduled on or after '2023-05-01' and before '2023-06-01'
SELECT * FROM Appointments_tbl 
WHERE STR_TO_DATE(ScheduledDay, '%m/%d/%Y') >= '2023-05-01'
  AND STR_TO_DATE(ScheduledDay, '%m/%d/%Y') < '2023-06-01';

-- -----------------------------------------------------------------------------------
-- Data Modification & Filtering
-- -----------------------------------------------------------------------------------
-- 6. Update the 'Showed_up' status to 'Yes' where it is null or empty
UPDATE Appointments_tbl 
SET Showed_up = 'Yes' 
WHERE Showed_up IS NULL OR Showed_up = '';

-- 7. Add a new column AppointmentStatus using a CASE statement
ALTER TABLE Appointments_tbl ADD COLUMN AppointmentStatus VARCHAR(20);
UPDATE Appointments_tbl 
SET AppointmentStatus = CASE 
    WHEN Showed_up = 'No' THEN 'No Show' 
    ELSE 'Attended' 
END;

-- 8. Filter appointments for diabetic patients with hypertension
SELECT * FROM Appointments_tbl WHERE Diabetes = 1 AND Hypertension = 1;

-- 9. Order the records by Age in descending order and show top 5 oldest patients
SELECT * FROM Appointments_tbl ORDER BY Age DESC LIMIT 5;

-- 10. Limit results to first 5 appointments for patients under age 18
SELECT * FROM Appointments_tbl WHERE Age < 18 LIMIT 5;

-- -----------------------------------------------------------------------------------
-- Aggregation & Grouping
-- -----------------------------------------------------------------------------------
-- 11. Find average age of patients for each gender
SELECT Gender, AVG(Age) AS average_age FROM Appointments_tbl GROUP BY Gender;

-- 12. Count how many patients received SMS reminders by Showed_up status
SELECT Showed_up, COUNT(*) AS total_sms_send 
FROM Appointments_tbl 
WHERE SMS_received = 1 
GROUP BY Showed_up;

-- 13. Count no-show appointments per neighborhood
SELECT Neighbourhood, COUNT(*) AS no_show 
FROM Appointments_tbl 
WHERE Showed_up = 'No' 
GROUP BY Neighbourhood;

-- 14. Show neighborhoods with more than 100 total appointments
SELECT Neighbourhood, COUNT(*) AS number_appointments 
FROM Appointments_tbl 
GROUP BY Neighbourhood 
HAVING COUNT(*) > 100;

-- 15. Use CASE to count children (<12), adults (12–60), and seniors (>60)
SELECT 
  CASE 
    WHEN Age < 12 THEN 'Children' 
    WHEN Age BETWEEN 12 AND 60 THEN 'Adults' 
    ELSE 'Seniors' 
  END AS Age_Group, 
  COUNT(*) AS Total 
FROM Appointments_tbl 
GROUP BY Age_Group;

-- -----------------------------------------------------------------------------------
-- Window Functions
-- -----------------------------------------------------------------------------------
-- 16. Running total of daily appointments per neighborhood
WITH DailyCounts AS (
    SELECT Neighbourhood, AppointmentDay, COUNT(*) AS daily_appointments
    FROM Appointments_tbl
    GROUP BY Neighbourhood, AppointmentDay
)
SELECT Neighbourhood, AppointmentDay, daily_appointments,
       SUM(daily_appointments) OVER (
           PARTITION BY Neighbourhood 
           ORDER BY STR_TO_DATE(AppointmentDay, '%m/%d/%Y')
       ) AS running_total
FROM DailyCounts
ORDER BY Neighbourhood, STR_TO_DATE(AppointmentDay, '%m/%d/%Y');

-- 17. Rank patients by age within each gender using DENSE_RANK()
SELECT PatientId, Gender, Age,
       DENSE_RANK() OVER (PARTITION BY Gender ORDER BY Age DESC) AS rank
FROM Appointments_tbl;

-- 18. Calculate how many days have passed since last appointment per neighborhood
SELECT PatientId, Neighbourhood, STR_TO_DATE(AppointmentDay, '%m/%d/%Y') AS ApptDate,
       DATEDIFF(
           STR_TO_DATE(AppointmentDay, '%m/%d/%Y'),
           LAG(STR_TO_DATE(AppointmentDay, '%m/%d/%Y')) OVER (
               PARTITION BY Neighbourhood 
               ORDER BY STR_TO_DATE(AppointmentDay, '%m/%d/%Y')
           )
       ) AS days_since_last
FROM Appointments_tbl
ORDER BY Neighbourhood, STR_TO_DATE(AppointmentDay, '%m/%d/%Y');

-- 19. Rank neighborhoods by number of no-show appointments
SELECT Neighbourhood, COUNT(*) AS missed_appointments,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS no_show_rank
FROM Appointments_tbl
WHERE Showed_up = 'No'
GROUP BY Neighbourhood;

-- 20. Identify weekdays with highest no-show rate and calculate percentages
SELECT DAYNAME(STR_TO_DATE(AppointmentDay, '%m/%d/%Y')) AS day_of_week,
       COUNT(*) AS total_appointments,
       SUM(CASE WHEN Showed_up = 'Yes' THEN 1 ELSE 0 END) AS showed_up_count,
       SUM(CASE WHEN Showed_up = 'No' THEN 1 ELSE 0 END) AS no_show_count,
       ROUND((SUM(CASE WHEN Showed_up = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS show_percentage,
       ROUND((SUM(CASE WHEN Showed_up = 'No' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS no_show_percentage
FROM Appointments_tbl
WHERE Showed_up IN ('Yes', 'No')
GROUP BY day_of_week
ORDER BY no_show_percentage DESC;
```
