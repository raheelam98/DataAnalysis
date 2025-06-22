-- Practice Question 3
-- Session_04 - 12 May 2025

-- Total points: 12
-- -------------------------------------------------------------------
-- Tables Setup
-- -------------------------------------------------------------------

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


-- -------------------------------------------------------------------
-- Primary & Foreign Keys
-- -------------------------------------------------------------------

-- 1. Add a primary key to students.student_id and enrollments.enrollment_id.

-- 2. Add a foreign key on enrollments.student_id that references students(student_id).

-- 3. What happens if you try to insert a row in enrollment table with student_id = 99? (Understand the error and state your reason)


-- -------------------------------------------------------------------
-- Aggregate Functions
-- -------------------------------------------------------------------

-- 1. How many students are enrolled in total?  

-- 2. Count total enrollments in `Data Science` course.

-- 3. What is the average age of students?    

-- 4. Find the oldest and youngest student.

-- 5. List all distinct cities students belong to.

-- 6. List all distinct courses for enrollment.






-- -------------------------------------------------------------------
-- Date Functions
-- -------------------------------------------------------------------

-- 1. Show number of "days taken to complete" each course where completion_date IS NOT NULL.

-- 2. Add "15 days" to each enrollment date.

-- 3. Show "age" of each student in years.


