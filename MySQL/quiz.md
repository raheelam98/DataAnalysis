## SQL Quiz

### SQL Quiz 1

#### 1. Which of the following is a DML command?
- CREATE  
- ALTER  
- INSERT  
- DROP

#### 2. Which command is used to change the structure of an existing table?
- INSERT  
- ALTER  
- UPDATE  
- DELETE

#### 3. Which DDL command is used to remove a table from the database permanently?
- TRUNCATE  
- DELETE  
- DROP  
- REMOVE

#### 4. Which DML command is used to remove specific rows from a table?
- DROP  
- DELETE  
- TRUNCATE  
- REMOVE

#### 5. Which of the following commands is used to save a transaction in SQL?
- ROLLBACK  
- COMMIT  
- SAVE  
- SAVEPOINT

---

### SQL Quiz 2

#### 1. Suppose we have the string `"HelloWorld"` and want to extract `"World"` using `SUBSTRING`. Which `SUBSTRING` function would you use?
- SUBSTRING('HelloWorld', 1, 5)  
- SUBSTRING('HelloWorld', 6, 5)  
- SUBSTRING('HelloWorld', 1, 10)

#### 2. What is the primary use of the `CASE` statement in SQL?
- To perform calculations  
- To manipulate strings  
- To join tables  
- To perform conditional logic

#### 3. What is the difference between the following two SQL queries?

Query 1: `SELECT * FROM customers WHERE country = 'USA' AND age > 18;`  
Query 2: `SELECT * FROM customers WHERE age > 18 AND country = 'USA';`

- Query 1 is faster than Query 2  
- Query 2 filters by age first, then country  
- The order of conditions doesn't matter; results will be the same  
- Query 1 filters by country first, then age

--- 

### SQL Quiz 3

#### 1. What does a multi-row subquery return?
- Only one column  
- One row  
- One or more rows with one column  
- One or more rows with more than one column  

#### 2. What type of subquery is used in the following SQL query?  
SELECT * FROM orders o  
WHERE order_date = (  
SELECT MIN(o2.order_date)  
FROM orders o2  
WHERE o2.customer_id = o.customer_id  
);
- Single-row subquery  
- Multi-row subquery  
- Multiple-column subquery  
- Correlated subquery  

#### 3. Which clause is required when using a window function?
- WHERE  
- HAVING  
- OVER()  
- GROUP BY  

#### 4. What does the following SQL return?  
SELECT name, salary, AVG(salary) OVER() AS avg_salary FROM employees;
- The average salary per department  
- The average salary for all employees on each row  
- Only employees with salary above average  
- An error  

#### 5. Which clause can you add to OVER() to calculate window aggregates by group?
- ORDER BY  
- GROUP BY  
- PARTITION BY  
- HAVING  

---

### SQL Quiz 1

#### 1. Which of the following is a DML command?  
INSERT

#### 2. Which command is used to change the structure of an existing table?  
ALTER

#### 3. Which DDL command is used to remove a table from the database permanently?  
DROP

#### 4. Which DML command is used to remove specific rows from a table?  
DELETE

#### 5. Which of the following commands is used to save a transaction in SQL?  
COMMIT

---

### SQL Quiz 2 Answer

#### 1. Suppose we have the string `"HelloWorld"` and want to extract `"World"` using `SUBSTRING`. Which `SUBSTRING` function would you use?
SUBSTRING('HelloWorld', 6, 5)


#### 2. What is the primary use of the `CASE` statement in SQL?
To perform conditional logic

#### 3. What is the difference between the following two SQL queries?
Query 1: SELECT * FROM customers WHERE country = 'USA' AND age > 18;

Query 2: SELECT * FROM customers WHERE age > 18 AND country = 'USA';

The order of conditions doesn't matter; results will be the same

---

### SQL Quiz 3

#### 1. What does a multi-row subquery return?  
One or more rows with one column

#### 2. What type of subquery is used in the following SQL query?  
SELECT * FROM orders o  
WHERE order_date = (  
SELECT MIN(o2.order_date)  
FROM orders o2  
WHERE o2.customer_id = o.customer_id  
);  
Correlated subquery

#### 3. Which clause is required when using a window function?  
OVER()

#### 4. What does the following SQL return?  
SELECT name, salary, AVG(salary) OVER() AS avg_salary FROM employees;  
The average salary for all employees on each row

#### 5. Which clause can you add to OVER() to calculate window aggregates by group?  
PARTITION BY

