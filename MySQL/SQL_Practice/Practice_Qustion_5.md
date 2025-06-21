### Education System

**SQL Practice Assignment 5** 

**Session 06 – Joins & Subqueries**

-- Points: 14 (2 marks each)

```sql

-- ----------------------------------------------------
-- Table Setup
-- ----------------------------------------------------

CREATE DATABASE Education;
USE education;

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

INSERT INTO students VALUES
(1, 'Ahmad', 1),
(2, 'Bilal', 1),
(3, 'Usman', 2),
(4, 'Zahid', NULL),
(5, 'Zia', 3);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry');

-- Results Table
CREATE TABLE results (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO results VALUES
(1, 'Math', 85),
(1, 'Physics', 90),
(2, 'Math', 60),
(3, 'Chemistry', 70),
(3, 'Math', 75),
(5, 'Physics', 88);

-- ----------------------------------------------------
-- JOINS
-- ----------------------------------------------------

-- Q1: Show only those students who are assigned to a department.


-- Q2: List all students along with their department names.
-- If a student doesn't belong to any department, still include them.


-- Q3: List all departments along with the names of students in them.
-- If a department has no students, still show it.


-- Q4: Get a full list of students and departments.
-- Show a combined list of all students and all departments,
-- even if a student has no department or a department has no students.


-- ----------------------------------------------------
-- Subquery Practice Questions
-- ----------------------------------------------------

-- Q5: Find details of a student who got the highest marks in Math.

-- Q6: Find names of students who have taken Physics.

-- Q7: For each subject, find the student(s) who scored the highest marks.
-- Show their subject, marks, and student ID.

```
