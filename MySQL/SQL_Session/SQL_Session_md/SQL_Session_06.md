## SQL Session 06

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN (via UNION)
- Single-row, Multi-row, and Multi-column Subqueries
- Subqueries inside FROM clause
- Use of subqueries with conditions and aggregation

---

### SQL Session 06 Questions

```sql

## 🔗 JOINS

### INNER JOIN
1. Fetch customer name and item name for each order.

### LEFT JOIN
2. List all customers and their order details, including those with no orders.
3. Find customers who haven't placed any order.

### RIGHT JOIN
4. List all items with order details, including items never ordered.

### FULL JOIN (Emulated with UNION)
5. Retrieve all order, customer, and item details (order ID, name, item, date), including unmatched records.

---

## SUBQUERIES

### Single-Row Subquery
6. Display all items with the minimum price.
7. Retrieve the customer who placed the most recent order.
8. Get order details of item with the minimum price.
9. Label stock as 'High' if above average, else 'Low'.

### Multi-Row Subquery
10. Retrieve all customers who placed an order in February.
11. Find customers who ordered the item with the lowest price.

### Multi-Column Subquery
12. Find repeated orders by same customer for the same item.

---

## Subquery in FROM clause
13. Show item name with the number of times it was ordered.

```

--- 

### SQL Session 06 Questions with Answers

```sql

-- ----------------------------------------------------------------------------
-- INNER JOIN 
-- pick the ones that exist in both tables
-- ----------------------------------------------------------------------------

-- 1. Fetch customer name and item name against each order in orders table
select * from orders;
select * from items;

select o.*, c.first_name , i.item_name, i.item_price
from orders o
inner join customers c on o.customer_id = c.customer_id
inner join items i on o.item_id = i.item_id
order by order_id;

select o.*,c.first_name, i.item_name
from orders o
inner join 
customers c on o.customer_id = c.customer_id
inner join
items i on o.item_id = i.item_id;

select orders.*, customers.first_name, items.item_name
from orders
join customers on orders.customer_id = customers.customer_id
join items on items.item_id = orders.item_id;

-- ----------------------------------------------------------------------------
-- LEFT JOIN
-- ----------------------------------------------------------------------------
-- 1. Write a query to list all customers and 
-- their order details including 
-- customers who have not placed any order.

SELECT * 
from customers c left join orders o 
on c.customer_id = o.customer_id;

SELECT c.customer_id, c.first_name, o.* 
from customers c left join orders o 
on c.customer_id = o.customer_id;

select count(distinct customer_id) from orders; -- 97
select count(distinct customer_id) from customers; -- 100

-- 2. Write a query to find customers who 
-- haven't placed any order

select c.*,o.order_id 
from customers c
left join orders o
on c.customer_id = o.customer_id
where o.order_id is NULL;

-- ----------------------------------------------------------------------------
-- RIGHT JOIN
-- ----------------------------------------------------------------------------
-- 1.  Write a query to list all item details and 
-- the related order details including items that 
-- have not been ordered.

select *
from items i left join orders o
on i.item_id = o.item_id;

-- (ITEMS WITH ORRDERS OR WITHOUT ORDERS)=> ALL ITEMS
select i.*,o.order_id
from orders o right join items i  
on o.item_id = i.item_id
LEFT JOIN CUSTOMERS C ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- table after from =>  left table
-- table after join keyword => right table


-- ----------------------------------------------------------------------------
-- FULL JOIN
-- ----------------------------------------------------------------------------

-- 1. Retrieve all order, customer, and item details, including
-- order ID, first name, last name, item name, and order date. 
-- Include all records from both tables, even if there is no match.


-- IN MYSQL, there is no keyword for full join

select * 
from customers c  
left join orders o  on c.customer_id = o.customer_id
left join items i on i.item_id = o.item_id

union
select * 
from customers c  
right join orders o  on c.customer_id = o.customer_id
right join items i on i.item_id = o.item_id;

-- order ID, first name, last name, item name, and order date.

select o.order_id,c.first_name, c.last_name, i.item_name, o.order_date
from customers c  
left join orders o  on c.customer_id = o.customer_id
left join items i on i.item_id = o.item_id

union
select o.order_id,c.first_name, c.last_name, i.item_name, o.order_date 
from customers c  
right join orders o  on c.customer_id = o.customer_id
right join items i on i.item_id = o.item_id;


-- ----------------------------------------------------------------------------
-- SUBQUERIES: Nested queries

-- Single-row Subquery (along with where and aggregation and case statements)
-- Multiple Row Subquery
-- Multiple Column Subquery
-- Corelated subquery
-- ----------------------------------------------------------------------------

-- Select or display all items with the minimum price
select * from items;
select * from items
order by item_price
limit 1;

select * from customers;
-- all customers with the minimum or starting street_number
select * from customers
order by street_number;

select min(street_number) from customers;
-- '123'

select * from customers where street_number = 123;

SELECT *
FROM customers
WHERE
    street_number = (SELECT MIN(street_number) FROM customers);

-- ----------------------------------------------------------------------------
-- Single-Row Subquery
-- ----------------------------------------------------------------------------

-- 1. Select or display all items with the minimum price

select min(item_price) from items;

select * from items where item_price = (select min(item_price) from items);

-- 2. Retrieve the details of customer who placed the most recent order.

select * from customers;

select customer_id from orders
order by order_date desc 
limit 1;

select * from customers
where customer_id = (select customer_id from orders
order by order_date desc 
limit 1);

-- using join
SELECT  c.*
FROM customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY order_date DESC
LIMIT 1;


-- 3. Find the order details of item with the minimum price
select * from orders;
select * from items;

-- 1st way
select min(item_price) from items;

select item_id from items where item_price = (select min(item_price) from items);


select * from orders
where 
	item_id = (select item_id from items
				where item_price = (select min(item_price) from items));


-- 2nd way
select item_id from items
order by item_price 
limit 1;

select * from orders 
where 
	item_id = (select item_id from items
			order by item_price limit 1);


-- 4. In items, label amount_in_stock as 'High' if above the average stock, else 'Low'.

select * from items;

select avg(amount_in_stock) from items;

select *,
case
when amount_in_Stock > (select avg(amount_in_stock) from items) then "High"
else "low"
end as stock_level
from items;

-- ----------------------------------------------------------------------------
-- MultiRow Subquery
-- ----------------------------------------------------------------------------
-- 1. Retrieves all customer details who placed an order IN FEB.

select * from customers;

select customer_id from orders
where month(order_date) =2;

SELECT 
    *
FROM
    customers
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            orders
        WHERE
            MONTH(order_date) = 2);



-- 2. Find the detail of customers who have ordered item with the 
-- minimum price

select * from items;

select item_id from items where item_price = (select min(item_price) from items);


select customer_id from orders
where item_id = (select item_id from items where item_price = (select min(item_price) from items));

select * from customers
where 
	customer_id in 
				(select customer_id from orders
							where item_id = (select item_id from items 
											 where item_price = (select min(item_price) from items))
);


-- ----------------------------------------------------------------------------
-- MultiColumn sub query
-- Returns multiple columns, useful for comparisons involving multiple values.
-- ----------------------------------------------------------------------------

-- 1. Retrieves orders where the same customer has ordered the same item more
--  than once.

select customer_id, item_id, count(*)
from orders
group by customer_id, item_id;

select * from orders
where customer_id = 20 and item_id = 38;

select customer_id, item_id
from orders
group by customer_id, item_id
having count(*)>1;


select * from orders
where (customer_id, item_id ) in 
(select customer_id, item_id
from orders
group by customer_id, item_id
having count(*)>1);

-- --------------------------------------------------
-- Sub query in "From" 
-- --------------------------------------------------
-- 1. Find the number of orders placed for each item, and 
-- show item name and total orders.

select * from items;
select * from orders;


select i.item_name ,count(o.order_id) as total_orders
from items i
join orders o on i.item_id = o.item_id
group by 1;


select i.item_name, summary.total_orders from items i
join
(
select item_id,count(*) as total_orders
from orders
group by item_id ) as summary 
on i.item_id = summary.item_id;


```
