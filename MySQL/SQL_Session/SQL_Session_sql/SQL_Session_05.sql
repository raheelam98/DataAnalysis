
-- -----------------------------------------------------------------------------------
-- SQL Session 05
-- -----------------------------------------------------------------------------------

-- Common aggregate functions:-  COUNT(), SUM(), AVG(), MAX(), MIN()

SELECT column1, AGGREGATE_FUNCTION(column2) AS alias_name
FROM table_name
GROUP BY column1
HAVING condition_on_aggregate
ORDER BY alias_name [ASC | DESC];

-- from table
-- where  (original)
-- group by
-- having (temporary or aggregated columns)
-- order by

-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------

/*

The order of clauses is important. 
The clauses (whichever ones you are using) must be written in the following order
This means WHERE cannot be written before FROM, ORDER BY cannot be written after LIMIT etc

SELECT- to select columns from the table or columns made through functions
FROM - to select the table you will be using
WHERE - to filter records of the table
GROUP BY - to group records
HAVING - to filter groups (or other columns that cannot be accessed by the WHERE clause)
ORDER BY - to sort records
LIMIT - to limit the number of records returned by the query


WRITING vs EXECUTION OF CLAUSES:

ORDER OF BACK-END EXECUTION				    ORDER OF WRITING 

FROM 										SELECT
WHERE										FROM
GROUP BY									WHERE
HAVING										GROUP BY
SELECT										HAVING
ORDER BY									ORDER BY	
LIMIT										LIMIT

*/


-- ----------------------------------------------------------------------------
-- GROUP BY
-- ----------------------------------------------------------------------------

-- Use the database
use ecommerce;
# if you don't execute the above line, errors: Database is not selected

select * from customers;

select city, count(*) 
from customers
group by city;


-- 1. Find out the count of customers from each city

select  * from customers;

-- count distinct cites 
select distinct city from customers;

-- count all the cites (duplicated as well)
select count(*) from customers;

select city, count(*) as customer_count
from customers
group by city;


-- 2. Find out the count of customers per city per street_name 
select * from customers;

select city, street_name, count(*) as customer_count
from customers
group by city,street_name;

-- rule: 
-- 1. Columns in Select statement must be mentioned in the Group by clause
-- 2. Columns in group by can be or can not be added in select statement

select city, street_name, count(*) as customer_count
from customers
group by city,street_name;

select city, street_name, count(*) as customer_count
from customers
group by 1,2
order by 1;


-- 3. Find total amount in stock of each item_type
select * from items;

select item_type, sum(amount_in_Stock) as total_amount
from items
group by item_type;


select item_type, sum(amount_in_Stock) as total_amount
from items
group by 1;


-- from table
-- where  (original)
-- group by
-- having (temporary or aggregated columns)

select * from items
where amount_in_stock > 40;

-- ----------------------------------------------------------------------------
-- HAVING
-- ----------------------------------------------------------------------------

-- 1. Find out the count of customers per city per street_name 
-- with counts greater than 5


select city, street_name, count(*) as customer_count
from customers
group by 1,2
having count(*) > 5;

select city, street_name, count(*) as customer_count
from customers
group by 1,2
having customer_count > 5;

-- rm query
select city, street_name, count(*) as customer_count
from customers
group by city,street_name
having count(*) > 5;


-- 2. Find out the total stock for those item types that 
-- have a total stock greater than 700


select * from items;

select item_type, sum(amount_in_stock) as total_stock
from items
group by item_type
having total_stock > 700;

-- ----------------------------------------------------------------------------------------------------
-- IF()
-- ----------------------------------------------------------------------------------------------------

select * from items;

-- 1. Label each item's stock level
-- low stock if amount_in_stock is below 30
-- high stock if amount_in_stock is >= 30

select *,
   if(amount_in_stock>= 30,"High stock","low stock") as stock_level
from items;

-- <10 => extremely 
 -- more than two conditions => Nested if
select *,
   if(amount_in_stock>= 30,"High stock",
       if(amount_in_stock>=10,"low","extremely low")) as stock_level
from items;

-- 2. Add column "High_stock" with default value set to 
-- IF stock >= 30,True else false.

select * from items;

alter table items
add column High_stock boolean 
default (if(amount_in_Stock>=30,True,False));

select * from items
where High_stock = True;

select * from items
where High_stock = 1;
-- True => 1
-- False => 0

alter table items
drop column High_stock;

-- ----------------------------------------------------------------------------------------------------
-- CASE STATEMENTS
-- ----------------------------------------------------------------------------------------------------

-- 1. Label each item's stock level
-- low stock if amount_in_stock is below 25
-- medium stock if between 25 and 50
-- high stock if greater than 50

select * from items;

select *,
case
when amount_in_Stock<25 THEN "low stock"
when amount_in_stock between 25 and 50 Then "medium stock"
when amount_in_stock > 50 Then "High stock"
end as stock_level
from items;

select *,
case
when amount_in_Stock<25 THEN "low stock"
when amount_in_stock between 25 and 50 Then "medium stock"
else "High stock"
end as stock_level
from items;


select *,
if (amount_in_Stock<25, "Low",
 if (amount_in_Stock between 25 and 50, "Medium","High")) 
 as stock_level
from items
having stock_level="high";

-- having=> temporary column or aggregated column

-- 2. You wish to find out the age demographics of your customer base. 
-- For this, you want to convert age to categorical data
-- Label each customer's age category

-- below 20 years - teen
-- between 20 and 30 - young adult
-- between 31 and 40 - adult
-- greater than 40 - middle-aged

-- ---------------------

-- count age in days and year 
SELECT 
  customer_id,
  DATEDIFF(NOW(), date_of_birth) AS age_in_days,
  TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age_in_years
FROM customers;

-- FIRST ADD AGE COLUMN
ALTER TABLE customers
ADD COLUMN age INT;

-- INSERT DATA INTO AGE COLUMN
SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET age = TIMESTAMPDIFF(YEAR, date_of_birth, NOW());

select * from customers;

-- ---------------------

select *,
case
when age < 20 then "teen"
when age between 20 and 30 then "young adult"
when age between 31 and 40 then "adult"
when age > 40 then "Middle-aged"
end as age_category
 from customers;

select * from customers;

select * from items;

select item_type, High_stock, count(*)
from items
group by 1,2;

-- select *, count(*)
-- from items
-- group by *;   -- throw error  because we can't use asteric * in select statement while using group by 

select * from items;

-- ----------------------------------------------------------------------------------------------------
-- CASE WITH GROUP BY AND AGGREGATE FUNCTIONS
-- You can easily use a column that you have created using case in the group by clause and apply different aggregate functions
-- ----------------------------------------------------------------------------------------------------

-- 1. Find out the customer_count in each age_category

SELECT  
    CASE
        WHEN age < 20 THEN 'teen'
        WHEN age BETWEEN 20 AND 30 THEN 'young adult'
        WHEN age BETWEEN 31 AND 40 THEN 'adult'
        WHEN age > 40 THEN 'Middle-aged'
    END AS age_category,
    count(*) as customer_count
FROM
    customers
    group by age_category;

SELECT  
    age,
    count(*) as customer_count
FROM
    customers
    group by age;

-- 2. Find out the number of low stock, medium stock and high stock items in the inventory (same conditions as in previous section)

select 
case
when amount_in_Stock<25 THEN "low stock"
when amount_in_stock between 25 and 50 Then "medium stock"
else "High stock"
end as stock_level,
count(*) as item_count
from items
group by stock_level;


-- 3. Label the average price (rounded off to two decimal places) of each item_type as:
-- avg_price less than 12 - low
-- avg_price between 12 and 32 - medium
-- avg_price greater than 32 - high

SELECT 
    item_type,
    ROUND(AVG(item_price), 2) AS average_price,
    CASE
        WHEN ROUND(AVG(item_price), 2) < 12 THEN 'Low'
        WHEN ROUND(AVG(item_price), 2) BETWEEN 12 AND 32 THEN 'medium'
        WHEN ROUND(AVG(item_price), 2) > 32 THEN 'high'
    END AS average_category
FROM
    items
GROUP BY item_type;

-- ----------------------------------------------------------------------------------------------------
-- UPDATING WITH CASE
-- ----------------------------------------------------------------------------------------------------

-- 1. Add a column called age_category and fill it with appropriate age category for each customer
SELECT  *,
    CASE
        WHEN age < 20 THEN 'teen'
        WHEN age BETWEEN 20 AND 30 THEN 'young adult'
        WHEN age BETWEEN 31 AND 40 THEN 'adult'
        WHEN age > 40 THEN 'Middle-aged'
    END AS age_category 
FROM
    customers;


alter table customers
add  column age_category varchar(50);

select * from customers;

update customers
set age_category = (CASE
        WHEN age < 20 THEN 'teen'
        WHEN age BETWEEN 20 AND 30 THEN 'young adult'
        WHEN age BETWEEN 31 AND 40 THEN 'adult'
        WHEN age > 40 THEN 'Middle-aged'
    END);

alter table customers
drop column age_category;
select * from customers;


-- ----------------------------------------------------------------------------------------------------
-- CASE INSIDE AGGREGATE FUNCTIONS
-- ----------------------------------------------------------------------------------------------------
select distinct age_category 
from customers;

-- 1. Write an SQL query to count the number of customers in each age category 
-- (young_adult, Adult, middle-aged) in each city from the customers table. 

select city,
sum(case when age_category = "Adult" then 1 end) as adult,
sum(case when age_category = "Middle-aged" then 1 end) as middle_aged,
sum(case when age_category = "young adult" then 1 end) as young_adult
from customers
group by city;



select city, age_category
from customers;

select city, age_category, count(*)
from customers
group by city, age_category
order by 1,2;

-- --------------------------------------------------------------------------
-- JOINs to Combine Data from Multiple Tables
-- --------------------------------------------------------------------------

-- INNER join: only the same matching values / common values from ooth tables
-- LEFT join: inner join + remaining records from left table
-- RIGHT join: inner join + remaining records from right table
-- FULL JOIN:  all records from ooth tables
-- CROSS JOIN: Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.
-- SELF join:  Joins a table to itself.


-- Display datasets
select * from customers;
select * from items;
select * from orders;

-- ----------------------------------------------------------------------------
-- INNER JOIN 
-- pick the ones that exist in both tables
-- ----------------------------------------------------------------------------

-- 1. Write a query to find customers along with their orders information 
select * from items;
select * from orders;
select * from customers;
-- order_id, customer_id, order_date, shipping_date, item_id
-- customer_id, first_name, last_name, date_of_birth, phone_number, street_number, street_name, city, Age, age_category

select *
from customers 
inner join orders
on customers.customer_id = orders.customer_id;

select customers.first_name, customers.city, orders.order_id, orders.order_date, orders.item_id
from customers
inner join orders
on customers.customer_id = orders.customer_id;

-- alias
select  o.order_id, o.order_date, o.item_id,c.first_name, c.city
from customers as c
inner join orders as o
on c.customer_id = o.customer_id;

-- inner join and join, both are same
select c.customer_id,c.first_name, c.city, o.order_id, o.order_date, o.item_id
from customers as c
join orders as o
on c.customer_id = o.customer_id;





