-- -----------------------------------------------------------------------------------
-- MY SQL Project
-- -----------------------------------------------------------------------------------

CREATE DATABASE Appointments;

-- DROP DATABASE Appointments;

-- Use the database
USE Appointments; --  to use database run this command

DESC Appointments_tbl;

-- -----------------------------------------------------------------------------------
-- Basic SQL & Data Retrieval
-- -----------------------------------------------------------------------------------

-- 1. Retrieve all columns from the Appointments table.
SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------

-- 2.  List the first 10 appointments where the patient is older than 60.
SELECT * 
FROM Appointments_tbl
WHERE age >= 60
LIMIT 10;

-- -----------------------------------------------------------------------------------

-- 3.Show the unique neighborhoods from which patients came.

SELECT DISTINCT neighbourhood
FROM Appointments_tbl;

SELECT DISTINCT column_name
FROM table_name;
-- -----------------------------------------------------------------------------------

-- 4. Find all female patients who received an SMS reminder. Give count of them
SELECT PatientId, Gender, ScheduledDay, ScheduledDay, Age,Neighbourhood, SMS_received
FROM Appointments_tbl
WHERE gender = 'female' AND SMS_received = 1;

-- -----------------------------------------------------------------------------------

-- 5.Display all appointments scheduled on or after '2023-05-01' and before '2023-06-01'
-- give data is day/month/year  like 2/26/2023

SELECT * 
FROM Appointments_tbl
WHERE STR_TO_DATE(ScheduledDay, '%m/%d/%Y') >= '2023-05-01'
  AND STR_TO_DATE(ScheduledDay, '%m/%d/%Y') < '2023-06-01';

SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------
-- Data Modification & Filtering
-- -----------------------------------------------------------------------------------

-- 6. Update the 'Showed_up' status to 'Yes' where it is null or empty

UPDATE Appointments_tbl
SET Showed_up = 'Yes'
WHERE Showed_up IS NULL OR Showed_up = '';

SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------

-- 7. Add a new column AppointmentStatus using a CASE statement:
-- 'No Show' if Showed_up = 'No'  --  'Attended' otherwise

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Appointments_tbl
ADD COLUMN AppointmentStatus varchar(20);

UPDATE Appointments_tbl
SET AppointmentStatus = CASE
    WHEN Showed_up = 'No' THEN 'No Show'
    ELSE 'Attended'
END;

SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------

-- 8. Filter appointments for diabetic patients with hypertension.

SELECT * 
FROM Appointments_tbl
WHERE Diabetes = 1 AND Hypertension = 1;

-- -----------------------------------------------------------------------------------

-- 9. Order the records by Age in descending order and show only the top 5 oldest patients.

SELECT * 
FROM Appointments_tbl
ORDER BY age DESC
LIMIT 5;

-- -----------------------------------------------------------------------------------

-- 10.Limit results to the first 5 appointments for patients under age 18.

SELECT * 
FROM Appointments_tbl
WHERE age <18
LIMIT 5;

SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------
-- Aggregation & Grouping
-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

-- 11. Find the average age of patients for each gender.

SELECT Gender, AVG(Age) AS average_age
FROM Appointments_tbl
GROUP BY Gender;

-- -----------------------------------------------------------------------------------
-- 12.  Count how many patients received SMS reminders, grouped by Showed_up status.

SELECT Showed_up, count(*) AS total_sms_send
FROM Appointments_tbl
WHERE sms_received = 1
GROUP BY Showed_up;


SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------
-- 13. Count no-show appointments in each neighborhood using GROUP BY.

SELECT  Neighbourhood, Showed_up, COUNT(*) AS 'no-show'
FROM Appointments_tbl
WHERE Showed_up = 'no'
GROUP BY Neighbourhood;

-- -----------------------------------------------------------------------------------
-- 14. Show neighborhoods with more than 100 total appointments (HAVING clause).

SELECT Neighbourhood, COUNT(*) AS number_appointments
FROM Appointments_tbl
GROUP BY Neighbourhood
HAVING COUNT(*) > 100 ;

-- -----------------------------------------------------------------------------------
-- 15.Use CASE to calculate the total number of:
-- children (Age < 12)
-- adults (Age BETWEEN 12 AND 60)
-- seniors (Age > 60)

SELECT
  CASE
    WHEN Age < 12 THEN 'children'
    WHEN Age BETWEEN 12 AND 60 THEN 'adults'
    ELSE 'seniors'
  END AS age_group,
  COUNT(*) AS total_patients
FROM Appointments_tbl
GROUP BY age_group;

SELECT * ,
	CASE
		WHEN age < 12 THEN 'children'
        WHEN age BETWEEN 12 AND 60 THEN 'adults'
        ELSE 'seniors'
    END AS age_group
FROM Appointments_tbl;

SELECT * FROM Appointments_tbl;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------
-- Window Functions
-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

-- 16. Tracks how appointments accumulate over time in each neighbourhood. (Running Total
-- of Appointments per Day) In simple words: How many appointments were there each day and
-- how do the total appointments keep adding up over time in each neighborhood?

-- running total per neighborhood,  use PARTITION BY
-- PARTITION BY,  the running total is across all neighborhoods

WITH DailyCounts AS (
    SELECT 
        Neighbourhood,
        AppointmentDay,
        COUNT(*) AS daily_appointments
    FROM Appointments_tbl
    GROUP BY Neighbourhood, AppointmentDay
)
SELECT 
    Neighbourhood,
    AppointmentDay,
    daily_appointments,
    SUM(daily_appointments) OVER (
        PARTITION BY Neighbourhood 
        ORDER BY STR_TO_DATE(AppointmentDay, '%m/%d/%Y')
    ) AS running_total
FROM DailyCounts
ORDER BY Neighbourhood, STR_TO_DATE(AppointmentDay, '%m/%d/%Y');

-- SELECT 
--     AppointmentDay,
--     Neighbourhood,
--     COUNT(*) AS daily_appointments,
--     SUM(COUNT(*)) OVER (
--         PARTITION BY Neighbourhood
--         ORDER BY AppointmentDay
--         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--     ) AS running_total
-- FROM Appointments_tbl
-- GROUP BY AppointmentDay, Neighbourhood
-- ORDER BY Neighbourhood, AppointmentDay;

 
-- SELECT distinctROW Neighbourhood, AppointmentDay, 
-- COUNT(AppointmentDay) OVER(PARTITION BY Neighbourhood ORDER BY AppointmentDay) AS appointments_number
-- FROM Appointments_tbl
-- ORDER BY AppointmentDay, Neighbourhood;

-- calculate appointment numbers in each Neighbourhood
SELECT Neighbourhood, COUNT(AppointmentDay) AS appointments_number
FROM Appointments_tbl
GROUP BY Neighbourhood;

-- -----------------------------------------------------------------------------------

-- 17. Use Dense_Rank() to rank patients by age within each gender group.

-- DENSE_RANK() :- assign ranking to rows based on a specified column (or columns), 
-- without skipping any ranks in case of ties


SELECT * FROM Appointments_tbl;

SELECT 
    PatientId,
    Gender,
    Age,
    DENSE_RANK() OVER (
        PARTITION BY Gender
        ORDER BY Age DESC
    ) AS age_rank_within_gender
FROM Appointments_tbl;


-- -----------------------------------------------------------------------------------

-- 18. How many days have passed since the last appointment in the same neighborhood?
-- (Hint: DATED IFF and Lag) (This helps to see how frequently appointments are happening in
-- each neighborhood.)


--  DATEDIFF() : DATEDIFF(interval, date1, date2) -- returns the difference between two dates
--  LAG() :LAG(column1) OVER(ORDER BY column2) -- compare the current row's value with a previous row's value


SELECT * FROM Appointments_tbl;

DESC Appointments_tbl;

SELECT 
	PatientId,
    Neighbourhood,
    STR_TO_DATE(AppointmentDay, '%m/%d/%Y') AS AppointmentDate,
    DATEDIFF(
        STR_TO_DATE(AppointmentDay, '%m/%d/%Y'),
        LAG(STR_TO_DATE(AppointmentDay, '%m/%d/%Y')) OVER (
            PARTITION BY Neighbourhood 
            ORDER BY STR_TO_DATE(AppointmentDay, '%m/%d/%Y')
        )
    ) AS days_since_last_appointment
FROM Appointments_tbl
ORDER BY Neighbourhood, STR_TO_DATE(AppointmentDay, '%m/%d/%Y');


-- -----------------------------------------------------------------------------------

-- 19. Which neighborhoods have the highest number of missed appointments? Use
-- DENSE_RANK() to rank neighborhoods based on the number of no-show appointments.

SELECT * FROM Appointments_tbl;

SELECT 
    Neighbourhood,
    COUNT(*) AS missed_appointments,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank1
FROM Appointments_tbl
WHERE Showed_up = 'No'
GROUP BY Neighbourhood
ORDER BY missed_appointments DESC;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

-- 20. Are patients more likely to miss appointments on certain days of the week?
-- Steps to follow for question # 20
-- •	(Use the AppointmentDay column in function dayname() to extract the day name (likeMonday, Tuesday, etc.).
-- •	Count how many appointments were scheduled, how many showed up (showed_up ="yes") and how many were missed (Showed_up = 'No') on each day.
-- •	Calculate the percentage of shows and no-shows for better comparison between days.
-- •	Formula: (count of Showed_up = 'yes' / total appointment count ) * 100, Use round function to show up to two decimal points
-- •	Sort the result by NoShow

SELECT 
    DAYNAME(STR_TO_DATE(AppointmentDay, '%m/%d/%Y')) AS day_of_week,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN Showed_up = 'Yes' THEN 1 ELSE 0 END) AS showed_up_count,
    SUM(CASE WHEN Showed_up = 'No' THEN 1 ELSE 0 END) AS no_show_count,
    ROUND((SUM(CASE WHEN Showed_up = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100), 2) AS show_percentage,
    ROUND((SUM(CASE WHEN Showed_up = 'No' THEN 1 ELSE 0 END) / COUNT(*) * 100), 2) AS no_show_percentage
FROM Appointments_tbl
WHERE Showed_up IN ('Yes', 'No')
GROUP BY day_of_week
ORDER BY no_show_percentage DESC;

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

