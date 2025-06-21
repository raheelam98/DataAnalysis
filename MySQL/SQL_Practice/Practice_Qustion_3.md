# SQL Practice Assignment 

**Total Points:** 12  
**Filename to Submit:** `Practice_Questions_Answers_3.sql`  
**Deadline:** Submit via Google Classroom  
**Cohort:** DA Cohort 05 – Azure Track

---

## Tables Setup

```sql
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

```
