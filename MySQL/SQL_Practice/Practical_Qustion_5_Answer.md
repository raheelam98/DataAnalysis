### Education System

**Practice Questions 5 - Answers**

Points: 14 (2 marks each) 

sql```

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

SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM results;

DESC departments;
DESC students;
DESC results;

-- ----------------------------------------------------
# JOINS
-- ----------------------------------------------------

-- Syntax:

-- INNER JOIN SYNTAX
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

-- LEFT JOIN SYNTAX
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

-- RIGH JOIN SYNTAX
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

-- FULL OUTER JOIN - UNION operator
SELECT * FROM table1
LEFT JOIN table2 ON table1.column_name = table2.column_name
UNION
SELECT * FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;


-- CROSS JOIN JOIN

SELECT column_name(s)
FROM table1
CROSS JOIN table2;

-- Q1: Show only those students who are assigned to a department.
-- (You want only those students who match a department.)


SELECT 
    students.name, departments.department_name 
FROM 
    students 
INNER JOIN 
    departments 
ON 
    students.department_id = departments.department_id ;

-- Q2: List all students along with their department names.
-- If a student doesn't belong to any department, still include them.

SELECT 
    students.name, 
    departments.department_name
FROM 
    students
LEFT JOIN 
    departments 
ON 
    students.department_id = departments.department_id;
    
    
-- Q3: List all departments along with the names of students in them.
-- If a department has no students, still show it.
-- (You want all departments, even if no students belong to them.)

SELECT 
    students.name, departments.department_name
FROM 
    students
RIGHT JOIN 
    departments 
ON 
    students.department_id = departments.department_id;
    

-- Q4: Get a full list of students and departments
-- Show a combined list of all students and all departments,
-- even if a student has no department or a department has no students.
-- (You want everything from both tables)

-- FULL OUTER JOIN - UNION operator
SELECT * FROM table1
LEFT JOIN table2 ON table1.column_name = table2.column_name
UNION
SELECT * FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;


-- Simulate FULL OUTER JOIN using LEFT and RIGHT JOIN + UNION

-- First part: all students with their departments (even if no department)
SELECT 
    students.name AS student_name, departments.department_name
FROM students
LEFT JOIN departments 
ON 
    students.department_id = departments.department_id
UNION
-- Second part: all departments with their students (even if no students)
SELECT 
    students.name AS student_name, departments.department_name
FROM students
RIGHT JOIN departments 
ON 
    students.department_id = departments.department_id;

-- ----------------------------------------------------
# Subquery Practice Questions
-- ----------------------------------------------------

-- Q5: Find details of a student who got the highest marks in Math

SELECT * FROM results
WHERE subject = 'Math';

SELECT * FROM results
WHERE subject = 'Math'
ORDER BY marks DESC
LIMIT  1;

--  Subquery

SELECT *
FROM students
WHERE student_id = (
    SELECT student_id
    FROM results
    WHERE subject = 'Math'
    ORDER BY marks DESC
    LIMIT 1
);

-- Q6: Find names of students who have taken Physics

SELECT * 
FROM results
WHERE subject = 'Physics';

SELECT  *  
FROM students
WHERE student_id IN (
	SELECT student_id
    FROM results
    WHERE subject = 'Physics'
);


-- Q7:  For each subject, find the student(s) who scored the highest marks. Show their subject, marks, and student ID.
-- (You'll need to compare both subject and marks using a subquery that returns multiple columns.)

SELECT  DISTINCT(subject) as subjects from results;

SELECT MAX(marks) AS max_marks
FROM results;

SELECT subject, MAX(marks) AS max_marks
FROM results
GROUP BY subject;

SELECT student_id, subject, marks
FROM results 
WHERE (subject, marks) IN (
    SELECT subject, MAX(marks)
    FROM results
    GROUP BY subject
);



SELECT * from students;
SELECT * from departments;
SELECT * from results;

```


