-- Practice Questions Answers - 3
-- Session_04 - 12 May 2025

-- Total points: 12
-- -------------------------------------------------------------------
-- Tables Setup
-- -------------------------------------------------------------------

-- Use the database
use ecommerce;
# if you don't execute the above line, errors: Database is not selected


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

SELECT * FROM students;

SELECT * FROM enrollments; 

DESCRIBE students;

DESCRIBE enrollments;

-- -------------------------------------------------------------------
-- Primary & Foreign Keys
-- -------------------------------------------------------------------

-- 1. Add a primary key to students.student_id and enrollments.enrollment_id.

ALTER TABLE students
ADD PRIMARY KEY (student_id );

ALTER TABLE enrollments
ADD PRIMARY KEY (enrollment_id);

DESCRIBE students;

DESCRIBE enrollments;

-- 2. Add a foreign key on enrollments.student_id that references students(student_id).

ALTER TABLE enrollments
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id) 
REFERENCES students(student_id);

-- 3. What happens if you try to insert a row in enrollment table with student_id = 99? (Understand the error and state your reason)

SELECT * FROM students; 
SELECT * FROM enrollments; 

INSERT INTO enrollments
VALUES  (4,99,'AI','2025-01-01','2025-06-06');

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
-- means students table doesn't has student_id  '99' 
-- only insert valiad student-id as FOREIGN KEY

-- the correct, student_id '2' is present in students table so we can use FOREIGN KEY
INSERT INTO enrollments
VALUES  (4,2,'AI','2025-01-01','2025-06-06');

-- -------------------------------------------------------------------
-- Aggregate Functions
-- ---xmany students are enrolled in total? 

 SELECT COUNT(DISTINCT student_id) FROM students;
 
 SELECT * FROM students; 

-- 2. Count total enrollments in `Data Science` course.

SELECT * FROM enrollments;

-- SELECT COUNT(DISTINCT student_id) FROM students;
 
SELECT *
FROM enrollments
WHERE course_name = 'Data Science';

-- 3. What is the average age of students? 
SELECT * FROM students;

-- 3. What is the average age of students? 

-- calculate age of single person
SELECT TIMESTAMPDIFF(YEAR, '1999-09-12', CURDATE()) AS date_of_brith;

-- calculate first_name and age of all students
SELECT first_name, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM students;

-- calculte average age of all students
SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age FROM students;


-- 4. Find the oldest and youngest student.

-- calculate oldest student
SELECT  MAX(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS oldest_student FROM students;

-- calculate youngest student
SELECT  MIN(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS youngest_student FROM students;

-- oldest and youngest student.

SELECT  
    MIN(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS youngest_student,
    MAX(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS oldest_student
FROM students;


-- 5. List all distinct cities students belong to.
SELECT DISTINCT(city)
FROM students; 

-- 6. List all distinct courses for enrollment.
SELECT DISTINCT(course_name)
FROM enrollments; 

 SELECT * FROM students; 
 SELECT * FROM enrollments; 

-- -------------------------------------------------------------------
-- Date Functions
-- -------------------------------------------------------------------

-- 1. Show number of "days taken to complete" each course where completion_date IS NOT NULL.

SELECT course_name, 
       DATEDIFF(completion_date, enrollment_date) AS days
FROM enrollments
WHERE completion_date IS NOT NULL;

-- 2. Add "15 days" to each enrollment date.
SELECT course_name, 
       DATEDIFF(completion_date, enrollment_date)*15 AS days
FROM enrollments;

-- 3. Show "age" of each student in years.
-- calculate first_name and age of all students

SELECT first_name, 
       TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM students;


