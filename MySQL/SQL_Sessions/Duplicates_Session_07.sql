-- Duplicates - SQL Session 07

create table employees
(
id int,
name varchar(50),
department varchar(50),
salary int
);

insert into employees values
(1 ,"Ahmad","HR", 15000),
(2 ,"Bilal", "IT",16000),
(3, "Usman","IT", 15000),
(4, "Usama","Administration",16000),
(5, "Zia","Faculty",15000),
(1 ,"Ahmad","HR", 15000),
(2 ,"Bilal", "IT",16000),
(3, "Usman","IT", 15000),
(4, "Usama","Administration",16000),
(5, "Zia","Faculty",15000),
(6, "Ahmad", "HR", 15000),
(7,"Bilal","IT", 16000);


select * from employees;

-- show all unique records
select distinct * from employees;

-- create a new table using distinct rows
create table unique_employees
as select distinct * from employees;

SELECT * FROM unique_employees;

-- But there is an issue... IDs are different but it has employees data 


#standardSQL

SELECT name, department,salary, count(*) as num_duplicate_rows FROM
unique_employees
GROUP BY
name, department,salary
HAVING count(*) > 1;

-- display duplicated rows
select * from unique_employees
where name in ( SELECT name FROM
unique_employees
GROUP BY
name, department,salary
HAVING count(*) > 1)
order by name;


-- using window functions
select *, row_number() over (partition by name, department,salary) as num_duplicate_rows
from unique_employees;


-- create a backup using window function
create table emp as

with data as (

select *, row_number() over (partition by name, department,salary) as num_duplicate_rows
from unique_employees

)
select * from data where num_duplicate_rows =1
order by id;

select * from emp;


-- 2nd way: Delete the duplicate rows 

select *, 
	row_number() over (partition by name, department,salary) as duplicate_rows
	from unique_employees
	order by id;


with duplicate_data as
(
select *, 
	row_number() over (partition by name, department,salary) as duplicate_rows
	from unique_employees
	order by id
)
delete  from unique_employees
where id in (select id from duplicate_data where duplicate_rows>1);


select * from unique_employees;


with duplicates as
(	select *, 
	row_number() over (partition by name, department,salary) as duplicate_rows
	from unique_employees
	order by id
)    
delete from unique_employees
where id in (select id from duplicates
		where duplicate_rows > 1);


select * from unique_employees;


-- 1. use distinct to eliminate duplicate rows
-- 2. values are duplicates other than primary key > you have to use CTE along with window_functions

