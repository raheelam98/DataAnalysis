-- SQL Session 02

-- Create a database with name Ecommerce
create database IF NOT exists Ecommerce;

-- Use the database
use ecommerce;
# if you don't execute the above line, errors: Database is not selected

-- DATATYPES
-- numeric: 
-- - int         : discrete: 1, 50,80,40
-- - bigint

-- data with points  
-- - decimal  : Decimal(2,3) => 34.678, 12.320 
-- - float      :  you have only max 7 digits after point 1. 988777 , 2.3456
-- - double   :  values after points are more than 7 => double 1.987777777777

-- Text  (alphabetic data)
--  1. char: char(2)    country code (UK, US, PK) 
--  2. varchar: varchar(255) address, names 
--  3. TEXT: unlimited
--  note: CHAR() :- Fixed-length string, faster, 
--  note : VARCHAR() :- Variable-length string, Uses only as much space as needed 

-- date 
-- date (yyyy-mm-dd)   
-- datetime  (yyyy-mm-dd hh::mm:ss)

-- boolean: bool ( for yes/no, true false, 0/1) 

-- CREATE TABBLE
-- create table table_name
-- (
-- column_1 datatype constraint,
-- column_2 datatype,
-- column_3 datatype
-- );
-- constraints like primary key, auto-increment, not null, unique

-- display/show
-- asteric * => all columns 
-- from table_name

-- Create table Employees with column 
-- (employee_id, first_name, last_name, department, salary)

create table Employees
(
employee_id int auto_increment primary key ,
first_name varchar(30),
last_name varchar(30),
department varchar(30),
salary int
);

-- drop table if created 
drop table Employees; -- table delete

select * from employees

-- it gives error why ??
insert into employees
values(1,"Maimoona","Khilji","Faculty",1500);

-- copy fieldes name of table
-- right click on field and select -- copy all fields name
-- employee_id, first_name, last_name, department, salary

-- Insert a single row 
insert into employees (first_name, last_name, department, salary)
values ( "Aliyan","Sohail","Administration",1700);

-- insert data into table don’t need to give employee_id it is auto_increment primary key
insert into employees (first_name, last_name, department, salary)
values ("Raheela","Khan","Data Analyst",50000);

-- Insert multiple rows
insert into employees (first_name, last_name, department, salary)
values 
("Huma","Awan","Admission",1900),
("Rimsha","Ahmad","HR",1800),
("Zia","Ahmar","HR",1900);

-- check data is inserted
select * from employees;

-- -----------------------------------------------------------------------------------

-- pull data from cvs

-- import data using import wizard and then explore 
-- create new table through wizard

-- import data using import wizard and then explore 

select * from customers;

select * from items;

select * from orders;

-- -----------------------------------------------------------------------------------

-- Where

-- Condition: Equal =
-- 1. Show all items in Clothing type
select * 
from items
where item_type = "clothing";

select * 
from items
where item_id= 5;

-- Condition: OR
-- 2. Show  all items in Clothing and shoes category
select * from items
where item_type = "clothing" or item_type= "shoes";

-- AND
-- 2.1 Show  all items in Clothing with price greater than 50
select * from items
where item_type = "clothing" and item_price > 50;

-- AND + OR
-- 2.1 Show  all items in Clothing and shoes with price greater than 50
select * from items
where (item_type = "clothing" or item_type="shoes")
and item_price > 50;

-- Condition: Between
-- 3. Show record of customers with id  from 1 to 5
SELECT * FROM customers
WHERE customer_id BETWEEN 1 AND 5;

-- Condition: Greater than
-- Note :- first use < or > then use = example  <= , >=
-- 4. Show items with price greater than or equal to 30
select * from items
where item_price >= 30;

select * from items
where item_price > 30 or item_price = 30 ;

-- Condition: Less than
-- 5. Show items with price less than or equal to 30
select * from items
where item_price <= 30;

-- Condition: OR and equal
-- 6. Show records with item_id = 1, 4, 6, 2,5
select * from items
where item_id = 1
or  item_id = 4 
or  item_id = 6
or  item_id = 2
or  item_id = 5;

select * from items
where item_id in (1, 4, 6, 2,5);
   
-- Condition: IN
-- 7.  Show records of John, Sarah and Robert
select * from customers
where first_name ="John" 
or first_name = "Sarah"
or first_name ="Robert";

SELECT 
    *
FROM
    customers
WHERE
    first_name IN ('John' , 'Sarah', 'Robert');

select * from items
where item_name ="Shirt" 
or item_name = "jacket"
or item_name = "dress"
or item_name = "scarf"
or item_name = "belt"
or item_name = "Jeans"
or item_name = "Hat"
or item_name = "Skirt";

SELECT 
    *
FROM
    items
WHERE
   not item_name IN ('Shirt' , 'jacket',
        'dress',
        'scarf',
        'belt',
        'Jeans',
        'Hat',
        'Skirt');
        
-- Condition: LIKE
-- 8.  Show records of customers with name starting with A
select * from customers
where first_name like "A%";

-- 8.1 Show records of customers with name ending with y
select * from customers
where first_name like "%y";

-- 8.2 Show records of customers with name ending with nr
select * from customers
where first_name like "%nr%";
        
select * from customers
where first_name like "%nr%"
or first_name like "%oh%";

-- Condition: NOT

select * from items
where item_type ="Accessories";

# <>
select * from items
where item_type <>"Accessories";

# !=
select * from items
where item_type !="Accessories";

# NOT
select * from items
where NOT item_type ="Accessories";

select * from items
where NOT item_price > 50;

select * from items
where item_price <= 50;

-- -----------------------------------------------------------------------------------

-- Order By
-- Order the items by item_price in ascending or descending order

select * from items
order by item_price;  -- by deafult=> ascending order

select * from items
order by item_price asc; -- asc=> ascending

select * from items
order by item_price desc;  -- desc=> descending 

select * from items
order by item_price desc, amount_in_stock asc ; 

-- -----------------------------------------------------------------------------------

-- Limit
-- Show the top two expensive items

select * from items
order by item_price desc
limit 2;

-- least expensive
select * from items
order by item_price asc
limit 2;

-- -----------------------------------------------------------------------------------

-- Alias => TEMPORAY name or nickname
-- concat first and last name and alias it as Full Name
select first_name, last_name, 
concat(first_name," ", last_name) as "Full name"
 from customers;
 
 select first_name as "FIRST NAME" from customers;

-- summary
-- create database
-- use database
-- discussed data types
-- create table
-- insert into table
-- select
-- where ( in, greater or less than, equal , not, like, or, and)
-- order by
-- limit
-- alias



