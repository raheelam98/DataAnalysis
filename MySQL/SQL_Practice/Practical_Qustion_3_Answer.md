### Student System

**SQL Practice Assignment 3**

```sql

-- ------------------------------------------------------------
-- Use the database
USE ecommerce;
-- ⚠️ If not selected, error: Database is not selected

-- ------------------------------------------------------------
-- Table Creation and Data Insertion
CREATE TABLE students (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Alice', 'Smith', '2000-04-20', 'Lahore'),
(2, 'Bob', 'Johnson', '1999-09-12', 'Karachi'),
(3, 'Clara', 'Williams', '2001-02-28', 'Lahore'),
(4, 'Danish', 'Khan', '1998-12-05', 'Islamabad'),
(5, 'Eva', 'Brown', '2000-07-16', 'Peshawar');

CREATE TABLE enrollments (
    enrollment_id INT,
    student_id INT,
    course_name VARCHAR(100),
    enrollment_date DATE,
    completion_date DATE
);

INSERT INTO enrollments VALUES
(101, 1, 'Data Science', '2024-01-01', '2024-04-01'),
(102, 2, 'Web Development', '2024-02-15', '2024-05-15'),
(103, 3, 'Data Science', '2024-01-20', '2024-04-20'),
(104, 1, 'AI Basics', '2024-03-10', NULL),
(105, 5, 'Cyber Security', '2024-01-05', '2024-04-05');

-- ------------------------------------------------------------
-- Primary & Foreign Keys
ALTER TABLE students
ADD PRIMARY KEY (student_id);

ALTER TABLE enrollments
ADD PRIMARY KEY (enrollment_id);

ALTER TABLE enrollments
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id)
REFERENCES students(student_id);

-- Foreign key constraint test
-- Fails: student_id = 99 does not exist in students table
-- INSERT INTO enrollments VALUES (4, 99, 'AI', '2025-01-01', '2025-06-06');

-- Succeeds: student_id = 2 exists
INSERT INTO enrollments VALUES (4, 2, 'AI', '2025-01-01', '2025-06-06');

-- ------------------------------------------------------------
-- Aggregate Function Queries
-- 1. Total number of students
SELECT COUNT(DISTINCT student_id) FROM students;

-- 2. Count total enrollments in Data Science
SELECT COUNT(*) FROM enrollments WHERE course_name = 'Data Science';

-- 3. Average age of students
SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age FROM students;

-- 4. Oldest and youngest student
SELECT  
    MIN(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS youngest_student,
    MAX(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS oldest_student
FROM students;

-- 5. Distinct cities
SELECT DISTINCT city FROM students;

-- 6. Distinct courses
SELECT DISTINCT course_name FROM enrollments;

-- ------------------------------------------------------------
-- Date Function Queries
-- 1. Days taken to complete each course (where completion_date IS NOT NULL)
SELECT course_name, 
       DATEDIFF(completion_date, enrollment_date) AS days
FROM enrollments
WHERE completion_date IS NOT NULL;

-- 2. Add "15 days" to each enrollment period (multiplying for example's sake)
SELECT course_name, 
       DATEDIFF(completion_date, enrollment_date) * 15 AS days
FROM enrollments;

-- 3. Age of each student
SELECT first_name, 
       TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM students;
```
