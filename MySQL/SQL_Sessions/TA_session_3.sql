-- TA Session 03
-- --------------------------------------------------------

-- create database one;
create database ta_session_3;

use ta_session_3;

-- DML

select * from customers;

-- from , join 
-- group by 
-- having
-- order by 
-- limit

-- datatypes
-- text
-- char ,
-- varchar
-- decimal, float, int 

-- create table 

create table employees(
employee_id int auto_increment primary key, 
employee_name_first varchar(25),
employee_second_name varchar(25),
department varchar(50), 
age int, 
salary double
);
select * from employees;

select * from employees_one;

insert into employees_one (employee_id, employee_name_first, employee_second_name, age, salary)values(1, "sana", "hussain", 25, 100);

insert into employees_one values( 2, "ali", "khan", "HR", 26, 150); 

-- hussain

-- ss

-- ("hussain", 3, 2)

select substring("hussain", 3, 2) as substring_name;

select substring("hello DA 5", 7, 2) as substring_name;

select first_name, last_name from customers;

select concat(first_name, "  ",last_name) as full_name from customers;

set sql_safe_updates = 0;

alter table customers
add column fullname varchar(50);

select * from customers;
-- dml
-- dml 
 update customers
set fullname = concat(first_name, "  ",last_name);

-- ddl 
alter table employees_one
drop column department;

select * from customers;

--  ddl -> add column after another

alter table customers
modify column fullname varchar(50) after last_name;


