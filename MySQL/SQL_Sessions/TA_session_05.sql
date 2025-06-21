-- TA Session 05 
-- --------------------------------------------------------

-- windows function, lag, lead, row, rank, dense_rank

-- "%m/%d/%Y"

-- 05-12-2025   text 

-- str_to_date(date_of_birth, "%m/%d/%Y") 

-- 12-05-2025

-- str_to_date(date_of_birth, "%d/%m/%Y") 

-- 
select * from customers;
select * from items;

SELECT 
    *
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id;
    
    SELECT 
    *
FROM
    customers c
       right JOIN
    orders o ON c.customer_id = o.customer_id;
    
    SELECT 
    o.order_id, c.*
FROM
    orders o
        left JOIN
    customers c ON c.customer_id = o.customer_id;
    
        SELECT 
    o.order_id, c.*
FROM
    orders o
        right JOIN
    customers c ON c.customer_id = o.customer_id;
    

    select * from customers;
    
    select *, count(customer_id) over() from customers;
    
        select *, count(customer_id) 
        over(partition by age2) from customers;
        
        select *, row_number() over
        (partition by age2 order by customer_id) as numb
        from customers;
        
        
select *, 
dense_rank() over
(partition by age2 order by customer_id) as dense_numb,
rank() over
(partition by age2 order by customer_id) as rank_numb
from customers;

-- select *, 
-- dense_rank over() from customers;

select * from orders;
select customer_id, order_date from orders;


select customer_id, order_date, 
lag(order_date) over ( partition by customer_id) as previous_date,
 lead(order_date) over (partition by customer_id)
as next_order_Date from orders;


-- resources used in the session
-- https://www.sqlshack.com/overview-of-sql-rank-functions/
-- https://www.codeproject.com/Articles/5326895/Left-Join-versus-Right-Join-Comparison

-- additional resources
-- leet code https://leetcode.com/
-- https://www.hackerrank.com/domains/sql
