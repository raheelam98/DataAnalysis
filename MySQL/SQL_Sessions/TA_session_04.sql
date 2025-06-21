-- TA Session 04
-- --------------------------------------------------------

select * from customers;

alter table customers
modify date_of_birth date;

select distinct date_of_birth from customers;


select distinct date_of_birth from customers;


select *, str_to_date(date_of_birth, "%m/%d/%Y") from customers;

update customers
set date_of_birth= str_to_date(date_of_birth, "%m/%d/%Y");

set sql_safe_updates =0;


select date_of_birth from customers 
group by date_of_birth;

--  current date

select Now(), year(now()), month(now()), day(now());

select 
datediff(now(),date_of_birth) as age_in_days,   -- age in days
timestampdiff(year, date_of_birth, now() ) as age_in_year
from customers;

select * from items;

select avg(item_price) from items;

select round(avg(item_price), 1) from items;

-- amount_in_stock   5 - 75

select min(amount_in_stock) from items;

select max(amount_in_stock) from items;


select *, 
    case 
    
         when amount_in_stock>= 5 and amount_in_stock <= 25 then 'low_stock'
         when amount_in_stock > 26 and amount_in_stock <= 50 then "moderate_stock"
         when amount_in_stock > 50 then "high_stock"

    end as stock_level
 from items;
 
 alter table customers
 add primary key(customer_id);
 
  alter table orders
 add primary key(order_id);
 
alter table items
 add primary key(item_id);
 
 -- alter table orders
--  drop customer_id;
 
 select * from orders;
 DESC orders;
 
 -- Step 1: Add the customer_id column to orders if it doesn't exist
ALTER TABLE orders
ADD COLUMN customer_id INT;

-- Step 2: Then add the foreign key constraint
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
 
 
-- rm give error
--  alter table orders
--  add foreign key(customer_id) references customers(customer_id);
 
 -- add full name
  -- select c.customer_id, c.fullname, o.order_id
--   from customers as c 
--   join orders as o
--   on c.customer_id = o.customer_id;


select * from customers;
select * from items;
select * from orders;

DESC customers;
DESC orders;
DESC items; 


SELECT *,
CASE
WHEN amount_in_stock <= 10 THEN 'low stock'
WHEN amount_in_stock >= 10 THEN 'Modrate tock'
WHEN amount_in_stock >= 50 THEN 'hight stock'
END as stock_level
From items;

-- amount_in_stock   5 - 75

select min(amount_in_stock) from items;

select max(amount_in_stock) from items;


select *, 
    case 
    
         when amount_in_stock between 5   and 25 then 'low_stock'
         when amount_in_stock between 26 and 50 then "moderate_stock"
         when amount_in_stock > 50 then "high_stock"

    end as stock_level
 from items;
 
 
 select max(item_price) from items;
 
 -- sub-query
 
 select * from items where item_price= (
 select max(item_price) from items);
 
 
SELECT 
  customer_id,
  DATEDIFF(NOW(), date_of_birth) AS age_in_days,
  TIMESTAMPDIFF(YEAR, date_of_birth, NOW()) AS age_in_year
FROM customers;


ALTER TABLE customers
ADD COLUMN age2 INT;

UPDATE customers
SET age2 = TIMESTAMPDIFF(YEAR, date_of_birth, NOW());


select * from customers;