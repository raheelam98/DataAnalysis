# SQL Session 04 

DML & Transaction Control

### SQL Session 04 Questions 

```sql
## DML & Transaction Control

1. Insert a new customer record into the `customers` table.
2. Update the `first_name` of a specific customer using `UPDATE`.
3. Delete a customer record using `DELETE`.
4. Perform a series of `INSERT` statements using `START TRANSACTION`.
5. Update the `street_number` for a specific customer.
6. Delete multiple customer records in one command.
7. Rollback the transaction to undo previous changes.
8. Start a new transaction to delete a customer, then use `ROLLBACK` to undo.

## TRUNCATE

9. Create a backup table from the `customers` table.
10. Use `TRUNCATE` to delete all rows from the backup table.

## PRIMARY KEY Constraints

11. Add a `PRIMARY KEY` to the `customer_id` column in `customers`.
12. Drop the `PRIMARY KEY` from the `customers` table.
13. Add primary keys to `customers`, `items`, and `orders` tables.

## FOREIGN KEY Constraints

14. Add a foreign key `item_id` in `orders` referencing `items`.
15. Add a foreign key `customer_id` in `orders` referencing `customers`.
16. Drop a foreign key from the `orders` table.

## Mathematical Functions

17. Use `ROUND()` to round `item_price` in the `items` table.
18. Use `CEIL()` and `FLOOR()` functions on numeric values.

## Date Functions

19. Show customer details along with age (in years and days).
20. Add an `Age` column to the `customers` table with default value using `TIMESTAMPDIFF`.
21. Add a `remarks` column with a default value and then remove it.
22. Use `DATE_ADD()` with `DAY`, `MONTH`, `YEAR`, and `MINUTE` intervals.

## Aggregate Functions

23. Count the total number of customers.
24. List all unique city names using `DISTINCT`.
25. Count the number of unique cities in the `customers` table.
26. Count the number of distinct `item_type` values in the `items` table.
27. Calculate the average price of items in the "shoes" category.
28. Find the maximum and minimum `item_price` from the `items` table.
29. Count the total number of orders.
30. Calculate the average shipping delay using `DATEDIFF`.
31. Count how many customers were born before the year 1995.

```
--- 
### SQL Session 04 Questions with Answers

```sql

-- SQL Session 04
-- -----------------------------------------------------------------------------------

-- Use the database
use ecommerce;
# if you don't execute the above line, errors: Database is not selected

-- DML (insert, update, delete)
SELECT * from customers;

DESCRIBE customers;

insert into customers
values (101, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace', 'AI'); 

SELECT * from customers
order by customer_id desc;

-- Temporarily Disable Safe Updates (Run this SQL command before your update)
SET SQL_SAFE_UPDATES = 0;

update customers 
set first_name = "Maimoona"
where customer_id = 101;

delete from customers
where customer_id = 101;

select * from customers
order by customer_id desc;


-- Insert RECORDS / Transactions
-- You can only keep record of DML commands( insert, update, delete)

start transaction;

-- Transaction:- It saves all changes only if every operation succeeds; if something goes wrong, 
-- the database rolls back to its previous state.

insert into customers
values ( 101, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 195, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 1001, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 104, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 295, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 2001, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 10001, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 1950, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 

insert into customers
values ( 1006, 'James', 'Anderson', '1973-03-10', '555-890-1234', '456', 'Walnut St', 'Anyplace','AB'); 


select * from customers
order by customer_id desc;


update customers
set street_number = 007
where customer_id=10001;


delete from customers
where customer_id in (101, 195,1001);

select * from customers
order by customer_id desc;

-- undo
rollback;

select * from customers
order by customer_id desc;


-- DELETE RECORDS / Transactions

select * from customers;

-- '1', 'Alice', 'Smith', '1990-05-15', '555-123-4567', '123', 'Main St', 'Anytown'

delete from customers
where customer_id = 1;

insert into customers
values(1, 'Alice', 'Smith', '1990-05-15', '555-123-4567', '123', 'Main St', 'Anytown', 'QW');

select * from customers;

start transaction;

delete from customers
where customer_id = 1;


select * from customers
where customer_id = 1;

rollback;

--  RAHEELA START FROM HERE. 

-- Truncate

create table customer_backup as
select * from customers order by customer_id asc;

select * from customer_backup;

truncate customer_backup;


-- -----------------------------------------------------------------------------------

-- ADDING/DROPPING PRIMARY KEY

-- 1. Let's set a primary key customer_id
ALTER TABLE customers
add primary key (customer_id);


select * from customers;


-- 2. Let's drop it
alter table customers
drop primary key;


-- 3. Add primary keys in table customers, items and orders
ALTER TABLE customers
add primary key (customer_id);

ALTER TABLE orders
add primary key (order_id);

ALTER TABLE items
add primary key (item_id);
-- -----------------------------------------------------------------------------------


-- ADD/DROP FOREIGN KEY

-- 1. Add item_id as foreign key in orders table referenced from items table

select * from orders;

-- alter table table_name
-- add constraint foreign_key_name
-- foreign key ( column_name)
-- references table_2(column_name);


alter table orders
add constraint fk_item_ID
FOREIGN KEY (item_id)
references items(item_id);


-- 2. Add customer_id as foreign key in orders table referenced from customers table

alter table orders
add constraint fk_customer_id
foreign key (customer_id)
references customers(customer_id);


-- 3. Drop FOREIGN key
alter table orders
drop foreign key fk_item_id;


-- ----------------------------------------------------------------------------
-- SQL Functions
-- ----------------------------------------------------------------------------

-- ----------------------------------------------------------------------------
-- Mathematical Functions: ROUND(), CEIL(), FLOOR()
-- ----------------------------------------------------------------------------

-- 1. Round item price to the nearest whole number or decimal place
select *, round(item_price) from items;

select 
round(1.5678,2),
round(1.6),
round(1.3);

select *, round(item_price) as rounded_price from items;
-- round the value to the next integer
select ceil(3.9), ceil(3.1), ceil(-2.1);

-- round to the previous integer
select floor(3.9),floor(3.1),floor(-2.1);

-- round (price)
-- ceil (construction, area or space )
-- floor (to get the exact value other than points )


-- ----------------------------------------------------------------------------
-- Date Functions: NOW(), DATE_ADD(), DATEDIFF()
-- ----------------------------------------------------------------------------


-- 1. Select customer details and show age of each customer  
select * from customers;

-- current date
select Now(),year(Now()), month(now());

select date_of_birth,Now(), 
year(Now()) - year(date_of_birth) as Age,
datediff(Now(),date_of_birth ) as "Age in days",
timestampdiff(year, date_of_birth, Now()) as "Age in year"
  from customers;

-- datediff
-- delivery date & order date


-- 2. Add a column "Age" in customers table.
alter table customers
add column Age int default (timestampdiff(year, date_of_birth, Now()));


-- we can change the formula
-- alter table customers
-- modify Age int default (100);


select * from customers;


insert into customers (customer_id, first_name, last_name, date_of_birth, phone_number, street_number, street_name, city)
values (104,'Jack', 'Morales', '1990-05-15', '555-567-8901', '567', 'Pine St', 'Anyville');


alter table customers
add column remarks varchar(50) default "nothing";
select * from customers;

insert into customers 
values (102,'Jack', 'Morales', '1990-05-15', '555-567-8901', '567', 'Pine St', 'Anyville',34,"GOOD JOB");

delete from customers
where customer_id >100;
-- default => placeholder just ot avoid NULL values

alter table customers
drop column remarks;


-- DATE_ADD()
select DATE_ADD("2025-05-12",INTERVAL 2 DAY),
DATE_ADD("2025-05-12",INTERVAL 7 DAY),
DATE_ADD("2025-05-12",INTERVAL 2 Month),
DATE_ADD("2025-05-12",INTERVAL 1 year)
;

select 
Now(),
DATE_ADD(Now(),INTERVAL 13 Minute);


-- ----------------------------------------------------------------------------
-- AGGREGATE FUNCTIONS ( SUM, AVG, MAX, MIN,...)
-- ----------------------------------------------------------------------------

-- 1. How many customers are there?
select * from customers;


select count(*) from customers;   -- count(*)=> count(rows)
select count(city) from customers;

select * from customers;

update customers
set city = NULL
where customer_id =1;
-- Anytown
update customers
set city = "Anytown"
where customer_id =1;


select city from customers;
-- 2. List the unique city names
-- distinct => to show unique values
select distinct city from customers;


-- 3. How many cities are included in customers dataset?

select count(distinct city) from customers;

-- 4. how many item types are included in items dataset;
select * from items;
select count(distinct item_type) from items;


-- 5. What is the average item price in shoes category
select avg(item_price) from items
where item_type = "shoes";


-- 6. What is the maximum and minimum item price?
select max(item_price), min(item_price) from items;


-- 7. How many orders were placed?
select count(order_id) from orders;

-- 8. What is the average shipping delay in days for all orders?
select avg(datediff(shipping_date,order_date)) from orders;

select *, datediff(shipping_date,order_date) from orders;


-- 9. How many customers were born before the year 1995?
select count(*) from customers
where year(date_of_birth)<1995;


```
