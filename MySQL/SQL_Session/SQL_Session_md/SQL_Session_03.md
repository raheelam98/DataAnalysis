## SQL Session 03

**DDL Commands (ALTER, DROP, MODIFY)**

### SQL Session 03 Questions

```sql
### DDL Commands (ALTER, DROP, MODIFY)

1. Rename the `customers` table to `new_customer_table` and then back to `customers`.
2. Add a column `street` of type `VARCHAR(3)` to the `customers` table.
3. Rename column `street` to `street_number`.
4. Drop the `street_number` column from the `customers` table.
5. Add the column `street_number` again but at the **first** position.
6. Move the `street_number` column to come **after** the `address` column.
7. Add two new columns `street_name` and `city` after `street_number`.
8. Change the datatype of `street_number` to `VARCHAR(5)`.

---

### Updating Data

9. Update all values of `street_number` to `"N/A"`.
10. Set even `customer_id` rows' `street_number` to NULL and odd ones to `"Rahee"`.
11. Update only the NULL values in `street_number` to `"ZARA"`.
12. Update the `street_number` column with the value from `customer_id`.
13. Update multiple columns: `street_number`, `street_name`, and `city` to `"N/A"`.

---

### String Functions Practice

14. Use `LENGTH()` to find length of `first_name`.
15. Use `SUBSTRING()` to extract parts of the `address` column.
16. Use `SUBSTRING_INDEX()` to split `address` into:
    - `street_number`
    - `street_name`
    - `city`
17. Update the `street_number` based on `address` column using `SUBSTRING_INDEX()`.
18. Update `street_name` and `city` based on `address`.
19. Drop the original `address` column.

---

### Date Handling

20. Try converting `date_of_birth` from text to date (and handle formatting errors).
21. Format `date_of_birth` to `YYYY-MM-DD` using `STR_TO_DATE()`.
22. Change the datatype of `date_of_birth` to `DATE`.
23. Change `order_date` and `shipping_date` columns in the `orders` table to type `DATE`.

```

---

### SQL Session 0 Questions with Answers
```sql
/*

DDL (Data Definition Language):
CREATE: Creates a new table or database.
ALTER: Modifies an existing database object.
DROP: Deletes an entire table, database, or other objects.
TRUNCATE: Removes all records from a table, deleting the space allocated for the records.

DML (Data Manipulation Language):
SELECT: Retrieves data from the database.
INSERT: Adds new data to a table.
UPDATE: Modifies existing data within a table.
DELETE: Removes data from a table.


TCL (Transaction Control Language):
COMMIT: Saves all changes made in the current transaction.
ROLLBACK: Restores the database to the last committed state.

*/
-- -----------------------------------------------------------------------------------
-- DDL Commmands
-- ADD/DROP columns

-- Use the database
use ecommerce;
# if you don't execute the above line, errors: Database is not selected

-- Rename the table
select * from customers;

-- change table name
alter table customers
rename to new_customer_table;

alter table new_customer_table
rename to customers;

select * from customers;

-- 1. Add a column street (data_type: varchar(3) )
Alter table customers
add column street varchar(3);

-- 2. Rename column to street_number
alter table customers
rename column street to street_number;

-- 3. Drop a column street_number
alter table customers
drop column street_number;

-- 4. Add column "street_number" at first position
select * from customers;

alter table customers
add column street_number varchar(3) first;

-- first
-- after 

-- 5. Change location of "street_number" and move it to follow the address column.
alter table customers
modify column street_number varchar(3) after address;


select * from customers;


-- 6. Add multiple columns at once: Street_name and city
alter table customers
add column street_name varchar(20) after street_number,
add column city varchar(20) after street_name;

alter table customers
modify column street_number varchar(5) after address,
modify column street_name varchar(20) after street_number,
modify column city varchar(20) after street_name;

select * from customers;

-- -----------------------------------------------------------------------------------

-- LETS CHANGE DATATYPES OF COLUMNS

-- 1. Change data type of street_number to varchar(5)
alter table customers
modify  column street_number varchar(5);

select * from customers;
-- -----------------------------------------------------------------------------------
-- UPDATING DATA

-- LET'S TURN OFF SAFE UPDATES
-- by default, it's 1 
set sql_safe_updates = 0;


-- LETS ADD DATA TO A COLUMN
-- 1. Fill column "street_number" with "N/A" 

-- update all the values in the column with "N\A"
UPDATE Customers
set street_number = "N/A";


UPDATE Customers
set street_number = NULL
where customer_id %2 =0 ;

UPDATE Customers
set street_number = "Rahee"
where customer_id %2 !=0 ;


-- 2. If you want to fill the missing value, sue where condition as given
UPDATE CUSTOMERS
SET STREET_NUMBER ="ZARA"
WHERE STREET_NUMBER IS NULL;

select * from customers;


-- 2.1 update the column 'street_number' into customer_id
update customers
set street_number = customer_id;

select * from customers;

-- 3. Update data of multiple columns at once

select * from customers;

update customers
set street_number = "N/A",
street_name = "N/A",
city = "N/A";

select * from customers;

-- ------------------------------
-- String functions: concat( ), subtring_index(), substring(), length()
-- ------------------------------

-- find the leaght of column varaiable
select "Mona", length( "Mona");

select *, length(first_name) as length from customers;

-- substring(text, starting_position, number_of_characters)
-- fixed length
select "123, Main St, Anytown",
substring("123, Main St, Anytown",6,7),
substring("123, Main St, Anytown",15,10)
;

select *, 
substring(address,1,3),
substring(address,6,7),
substring(address,15,10) from customers;

-- Alias Column Syntax
-- SELECT column_name AS alias_name
-- FROM table_name;

select *, 
substring(address,1,3) as house_number,
substring(address,6,7) as street_name,
substring(address,15,10) as city
from customers;

-- substring_index(text to column based on delimeter)
-- substring_index(text,delimeter, block_number)

select '123, Main St, Anytown',
trim(substring_index('123, Main St, Anytown',",",1)) as street_number,
trim(substring_index(substring_index('123, Main St, Anytown',",",2),",",-1)) as street_name,
trim(substring_index('123, Main St, Anytown',",",-1)) as city;

-- 4. Update the value in street_number based on column Address

select *, trim(substring_index(address,",",1)) as street_number  from customers;

update customers
set street_number = trim(substring_index(address,",",1));

select * from customers;

-- 5. Add data to multiple columns at once street_name and city
select *, 
trim(substring_index(substring_index(address,",",2),",",-1)) as street_name,
trim(substring_index(address,",",-1)) as city
from customers;

select * from customers;

update customers
set street_name =trim(substring_index(substring_index(address,",",2),",",-1)),
city = trim(substring_index(address,",",-1));

select * from customers
where city = "Anytown";

-- 6. Drop the address column
alter table customers
drop column address;

select * from customers;

-- -----------------------------------------------------------------------------------

-- LETS Work on DATE columns

select * from customers
order by first_name;

select * from customers
order by date_of_birth;


-- 1. Change the datatype of date_of_birth to date from text (Note: You will get Error because of formating)
alter table customers
modify date_of_birth date;

-- 2. Update the format of date_of_birth to yyyy-mm-dd
select distinct date_of_birth from customers;


select "1990/15/5", str_to_date("1990/15/5","%Y/%d/%m");

select *, str_to_date(date_of_birth,"%m/%d/%Y") from customers;

update customers
set date_of_birth = str_to_date(date_of_birth,"%m/%d/%Y");

select * from customers;

select * from customers
order by date_of_birth;

-- 3. Now change the datatype of date_of_birth to date 
alter table customers
modify date_of_birth date;

select * from customers;

-- 4. Change the datatype of order_date, shipping_date to date in Orders table
select * from orders;

alter table orders
modify order_date date,
modify shipping_date date;

-- -----------------------------------------------------------------------------------


```
