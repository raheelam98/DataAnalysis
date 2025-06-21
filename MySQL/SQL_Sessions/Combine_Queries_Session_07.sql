-- Combine Queries - SQL Session 07

-- Combine Result Query (UNION, INTERSECT, EXCEPT)

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
    


select * from Students_Data;
select * from event_organizers;


-- {1,2}  union { 2,3}    => { 1,2,3}

-- Union
-- Combine all members whether they are Students or Event organizers
SELECT  student_name, student_department FROM Students_Data
UNION
SELECT  organizer_name, organizer_department FROM Event_organizers;


-- {1,2}   intersection { 2,3 }  => { 2}
-- Intersect
-- Find the common participants between the Students_Data and Event_organizers tables based on their names.
SELECT  student_name, student_department FROM Students_Data
Intersect
SELECT  organizer_name, organizer_department FROM Event_organizers;

-- using joins
-- Students and Event organizers intersect (using INNER JOIN)
SELECT s.student_id, s.student_name, s.student_department
FROM Students_Data s
INNER JOIN Event_organizers e ON s.student_name = e.organizer_name;


-- {1,2} except { 2,3 } => {1}
-- Except 
-- Create a query that identifies students from the Students_Data table who are not organizers in the Event_organizers table.
SELECT  student_name, student_department FROM Students_Data
Except
SELECT  organizer_name, organizer_department FROM Event_organizers;


-- using join 
-- Students not in Event organizers (using LEFT JOIN and NULL check)
SELECT s.student_id, s.student_name, s.student_department
FROM Students_Data s
LEFT JOIN Event_organizers e ON s.student_name = e.organizer_name
WHERE e.organizer_name IS NULL;


