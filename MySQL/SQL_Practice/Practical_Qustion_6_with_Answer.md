### Education System

#### Practice Questions 6 

**SQL Session 07**

```sql

-- Combine Result Query Practice (UNION, INTERSECT, EXCEPT)

-- Table Setup (Students_Data and Event_organizers)
-- ----------------------------------------------------
-- 1. Create the Students_Data table with student_id, student_name, and student_department.
-- 2. Create the Event_organizers table with organizer_id, organizer_name, and organizer_department.
-- 3. Insert at least 5 records into Students_Data.
-- 4. Insert at least 3 records into Event_organizers.

-- Questions
-- ----------------------------------------------------
-- Q1: Write a query to combine all participants (students and organizers) using UNION.

-- Q2: Write a query to find the common participants between Students_Data and Event_organizers (using INTERSECT).

-- Q3: Rewrite Q2 using INNER JOIN based on matching names.

-- Q4: Write a query to find students who are not organizers (using EXCEPT).

-- Q5: Rewrite Q4 using LEFT JOIN and a NULL check.

-- Q6: List all records from Students_Data.

-- Q7: List all records from Event_organizers.
```

#### Practice Questions 6 - Answers

**SQL Session 07**

```sql

-- Combine Result Query (UNION, INTERSECT, EXCEPT)

CREATE DATABASE Education_System;

USE Education_System;

-- Create Students_Data table
CREATE TABLE Students_Data (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    student_department VARCHAR(50)
);

-- Create Event_organizers table
CREATE TABLE Event_organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(100),
    organizer_department VARCHAR(50)
);

-- Insert data into Students_Data table
INSERT INTO Students_Data (student_id, student_name, student_department)
VALUES
    (1, 'Ahmad', 'Software Engineering'),
    (2, 'Bilal', 'Data Science'),
    (3, 'Daniyal', 'Social Sciences'),
    (4 , 'Haris', 'Data Science'),
    (5, 'Imad', 'Computer Science');

-- Insert data into Event_organizers table
INSERT INTO Event_organizers (organizer_id, organizer_name, organizer_department)
VALUES
    (1, 'Aliyan', 'BBA'),
    (2, 'Ali', 'English'),
    (3, 'Daniyal', 'Social Sciences');

-- View tables
SELECT * FROM Students_Data;
SELECT * FROM Event_organizers;

-- UNION: Combine all participants (distinct)
SELECT student_name, student_department FROM Students_Data
UNION
SELECT organizer_name, organizer_department FROM Event_organizers;

-- INTERSECT: Common participants based on name and department
SELECT student_name, student_department FROM Students_Data
INTERSECT
SELECT organizer_name, organizer_department FROM Event_organizers;

-- INTERSECT using JOIN (based on name match)
SELECT s.student_id, s.student_name, s.student_department
FROM Students_Data s
INNER JOIN Event_organizers e ON s.student_name = e.organizer_name;

-- EXCEPT: Students who are not organizers
SELECT student_name, student_department FROM Students_Data
EXCEPT
SELECT organizer_name, organizer_department FROM Event_organizers;

-- EXCEPT using JOIN: Students not in Event_organizers
SELECT s.student_id, s.student_name, s.student_department
FROM Students_Data s
LEFT JOIN Event_organizers e ON s.student_name = e.organizer_name
WHERE e.organizer_name IS NULL;
```
