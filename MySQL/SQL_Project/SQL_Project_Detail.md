
###  MY SQL Project: Appointments Analysis

```sql
-- -----------------------------------------------------------------------------------
-- MY SQL Project: Appointments Analysis
-- -----------------------------------------------------------------------------------

-- Database Creation
CREATE DATABASE Appointments;
USE Appointments;

-- -----------------------------------------------------------------------------------
-- Basic SQL & Data Retrieval
-- -----------------------------------------------------------------------------------
-- Q1: Retrieve all columns from the Appointments table.
-- Q2: List the first 10 appointments where the patient is older than 60.
-- Q3: Show the unique neighborhoods from which patients came.
-- Q4: Find all female patients who received an SMS reminder. Give count of them.
-- Q5: Display all appointments scheduled on or after '2023-05-01' and before '2023-06-01'.

-- -----------------------------------------------------------------------------------
-- Data Modification & Filtering
-- -----------------------------------------------------------------------------------
-- Q6: Update the 'Showed_up' status to 'Yes' where it is null or empty.
-- Q7: Add a new column AppointmentStatus using CASE: 'No Show' if Showed_up = 'No'; otherwise 'Attended'.
-- Q8: Filter appointments for diabetic patients with hypertension.
-- Q9: Order the records by Age in descending order and show only the top 5 oldest patients.
-- Q10: Limit results to the first 5 appointments for patients under age 18.

-- -----------------------------------------------------------------------------------
-- Aggregation & Grouping
-- -----------------------------------------------------------------------------------
-- Q11: Find the average age of patients for each gender.
-- Q12: Count how many patients received SMS reminders, grouped by Showed_up status.
-- Q13: Count no-show appointments in each neighborhood using GROUP BY.
-- Q14: Show neighborhoods with more than 100 total appointments (using HAVING clause).
-- Q15: Use CASE to calculate the total number of children (<12), adults (12–60), and seniors (>60).

-- -----------------------------------------------------------------------------------
-- Window Functions
-- -----------------------------------------------------------------------------------
-- Q16: Running total of daily appointments per neighborhood.
-- Q17: Use DENSE_RANK() to rank patients by age within each gender group.
-- Q18: Calculate how many days have passed since the last appointment in the same neighborhood (LAG & DATEDIFF).
-- Q19: Rank neighborhoods by number of missed appointments using DENSE_RANK().
-- Q20: Determine if patients are more likely to miss appointments on certain days of the week.

```
