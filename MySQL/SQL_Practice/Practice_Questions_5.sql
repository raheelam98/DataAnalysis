-- Practice Question 5
-- Session_06 - 17 May 2025

-- Points: 14 (2 marks each) 
-- ----------------------------------------------------
# Table Setup
-- ----------------------------------------------------

create database education;
use education;

-- Table: students
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

-- Table: departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry');

-- Table: results
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
# JOINS
-- ----------------------------------------------------

-- Q1: Show only those students who are assigned to a department.
-- (You want only those students who match a department.)

-- Q2: List all students along with their department names.
-- If a student doesn't belong to any department, still include them.


-- Q3: List all departments along with the names of students in them.
-- If a department has no students, still show it.
-- (You want all departments, even if no students belong to them.)


-- Q4: Get a full list of students and departments
-- Show a combined list of all students and all departments,
-- even if a student has no department or a department has no students.
-- (You want everything from both tables)


-- ----------------------------------------------------
# Subquery Practice Questions
-- ----------------------------------------------------


-- Q5: Find details of a student who got the highest marks in Math


-- Q6: Find names of students who have taken Physics


-- Q7:  For each subject, find the student(s) who scored the highest marks. Show their subject, marks, and student ID.
-- (You'll need to compare both subject and marks using a subquery that returns multiple columns.)
