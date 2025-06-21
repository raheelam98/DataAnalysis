-- SQL Session 07

select * from customers;
select distinct city from customers;


-- ----------------------------------------------------------------------------
-- Correlated Subquery
-- A correlated subquery is a type of subquery in SQL where the inner query (subquery) is dependent on the outer query (main query). 
-- In other words, the inner query references columns from the outer query and is evaluated for each row processed by the outer query.
-- ----------------------------------------------------------------------------

-- 1. Retrieves the first order (earliest order date) for each customer.
select * from orders;

select * from orders o2
where order_date = (
select min(order_date) from orders o1
where o1.customer_id = o2.customer_id
);

-- single-row (= )
-- multi-row ( in)
-- multiple-column ( in) 
-- corelated (loop /iterations/repititions)


select city, count(*)
from customers
group by city;

select * from customers;

select city, count(*)
from customers
group by city;

select * from customers limit 10;

select *,
count(*) over (partition by age_category) 
from customers
order by customer_id;


-- full or complete data + aggregated column => window functions

-- ---------------------------------------------------------------------------------------- 
-- Window Functions
-- ---------------------------------------------------------------------------------------- 
-- Over(): Syntax used to define the window frame for window functions, specifying the partitioning and ordering of rows.
-- PARTITION BY: Divides the result set into partitions to perform calculations separately within each partition or group.
-- Key Window Functions:
	-- RANK(): Assigns a rank to each row based on specified criteria.
	-- DENSE_RANK(): Similar to RANK() but assigns consecutive ranks without gaps.
	-- LEAD(): Accesses data from subsequent rows in the result set.
	-- LAG(): Accesses data from previous rows in the result set.


-- ---------------------------------------------------------------------------------------- 
-- Aggregate Functions
-- ---------------------------------------------------------------------------------------- 

-- 1: Retrieve all order details from the orders table while also 
-- calculating the total number of orders placed by each customer
select *, count(order_id) over ( partition by customer_id) as ordeR_count
 from orders
 order by order_id;
 
 select *, count(order_id) over ( partition by customer_id) from orders;
 
 select * from orders;
 
 select customer_id, count(order_id) 
 from orders group by customer_id;


-- 2: Get all the records from the items table along with the 
-- number of items and avg price in each type
select *, 
count(item_id) over (partition by item_type) as item_count,
round(avg(item_price) over (partition by item_type),2) as average_price
 from items
 order by item_id;


-- 3. calculate a running total of item prices based on the order date 
-- while retrieving all order details from the orders table

select o.* , i.item_price,
sum(item_price) over (order by order_date) as running_total
from orders o
join items i on o.item_id = i.item_id;


-- -------------------
select *,
lag(item_id) over() previous_item,
lead(item_id) over() next_item
from orders;
-- ---------------------------------------------------------------------------------------- 
-- LAG()
-- ---------------------------------------------------------------------------------------- 
-- 1. Find the previous order date for each customer.
select * from orders;

select *,
lag(order_date) over (partition by customer_id) as previous_order_date
from orders;

-- ---------------------------------------------------------------------------------------- 
-- LEAD()
-- ---------------------------------------------------------------------------------------- 
-- 1. Check when the next order is placed by each customer
select * from orders;

select *,
lead(order_date) over (partition by customer_id) as next_order_date
from orders;


-- 2. check difference between 1st and 2nd order of each customer
select *,
lead(order_date) over (partition by customer_id) as next_order_date,
timestampdiff(day, order_date, lead(order_date) over (partition by customer_id) ) as difference
from orders;


-- ---------------------------------------------------------------------------------------- 
-- Row_number, Rank, Dense_Rank
-- ---------------------------------------------------------------------------------------- 

select *, row_number() over(partition by city order by customer_id) from customers;


-- 1. Assign Row Numbers/ID Per Category (Partitioned Row Numbers)
select *, 
row_number() over ( partition by item_type order by item_price)
 from items;



-- TASK
-- 2. Assign row numbers, ranks, and dense ranks to items 
-- within each item type based on their price in descending order 


-- 3. Use Dense_Rank() to rank customers by age within each city
select *,
dense_rank() over ( partition by city order by age ) as age_dense_rank,
rank() over ( partition by city order by age ) as age_rank
 from customers;



-- 4.  Calculate the orders in each city. 
-- Then, Use DENSE_RANK() to rank city based on the number of ordes (top to bottom).

select c.city, count(o.order_id) as order_count,
dense_rank() over (order by count(o.order_id) desc) as city_rank
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.city;


-- limitation: can't use window functions directly in where or having

-- ---------------------------------------------------------------------------------------- 
-- Common Table Expressions (CTEs) 
-- ---------------------------------------------------------------------------------------- 
-- Temporary result Table that can be referenced within a SELECT, UPDATE, or DELETE statement, 
-- often used with window functions to simplify queries and improve readability.


-- ---------------------------------------------------------------------------------------- 
-- BASIC CTE
-- ---------------------------------------------------------------------------------------- 


-- 1.  Which City have the highest number of orders? Top city based on orders.

with city_orders as
(
select c.city, count(o.order_id) as order_count,
dense_rank() over (order by count(o.order_id) desc) as city_rank
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.city
)
select * from city_orders
where city_rank = 1;


-- 2. Find the youngest customer in each city.
select *,
dense_rank() over ( partition by city order by age ) as age_dense_rank
 from customers;


with age_ranked_data as
(
select *,
dense_rank() over ( partition by city order by age ) as age_dense_rank
 from customers
)
select * from age_ranked_data
where age_dense_rank = 1;




with any_town_data as 
( 
	select * from customers
	where city = "Anytown"
)
select age_category,count(*) 
from any_town_data 
group by 1;


-- ---------------------------------------------------------------------------------------- 
-- CTE with Aggregate and JOIN
-- ---------------------------------------------------------------------------------------- 

-- 1. Fetch the customer details who have placed more than 5 orders.

with  grouped_data as 
(
	select c.*, count(o.order_id) over (partition by o.customer_id) as order_count 
	from orders o 
	join customers c 
	on o.customer_id = c.customer_id
)
select distinct * from grouped_data
where order_count > 5;    


with grouped_data
as
(
	select c.customer_id, count(*) as order_count 
	from orders o
	join customers c on o.customer_id = c.customer_id
	group by c.customer_id
    having count(*) > 5
)
select * from grouped_data gd
join customers c
on c.customer_id = gd.customer_id;

-- ---------------------------------------------------------------------------------------- 
-- Using CTE with a DELETE Statement
-- ---------------------------------------------------------------------------------------- 

-- 1. Delete customers from customers_table who have never placed an order.
select c.customer_id
from customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is NULL;


start transaction;

with NoOrderCustomers as
(
select c.customer_id
from customers c
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is NULL
)
delete from customers
where customer_id in ( select * from NoOrderCustomers) ;

rollback;





