## MySQL

SQL Data Manipulation and Cleaning

[DataCamp – SQL DML Commands: Mastering Data Manipulation](https://www.datacamp.com/tutorial/sql-dml-commands-mastering-data-manipulation-in-sql)  
Learn how to use SQL DML commands such as INSERT, UPDATE, DELETE, and SELECT to manipulate and interact with database records effectively.

[Acho – The Ultimate Guide to Data Cleaning in SQL](https://acho.io/blogs/the-ultimate-guide-to-data-cleaning-in-sql)  
A practical guide on cleaning messy data in SQL using techniques like NULL handling, data type corrections, trimming, and standardization.

### Session 01 - (Introduction to Databases and Basic SQL Operations)

- What are Databases?  
- What is SQL? (Structured Query Language)  
- Importance of SQL in the modern world  
- Introduction to RDBMS (Relational Database Management System)  
- Terminologies of RDBMS, Data types, Constraints, Data Relationships  

- **MySQL Workbench**
  - Exploring the MySQL interface  
  - Create Database, Tables, Columns  
  - SELECT Statement (basic querying)  
  - Inserting data into tables  
  - ORDER BY (sorting results)  
  - LIMIT  
  - Aliases (AS keyword)

##### Reading Materials - SQL Fundamentals and Relational Databases

[GeeksforGeeks – SQL SELECT Query](https://www.geeksforgeeks.org/sql-select-query/)  
Learn how to retrieve data from tables using the `SELECT` statement. This guide covers syntax, examples, and usage of `WHERE`, `DISTINCT`, and more.

[Simplilearn – What is SQL?](https://www.simplilearn.com/tutorials/sql-tutorial/what-is-sql)  
A beginner-friendly overview of SQL, including its purpose, command types, and how it interacts with databases.

[IBM – What is a Relational Database?](https://www.ibm.com/think/topics/relational-databases)  
Understand core relational database concepts like tables, relationships, normalization, and how SQL is used to manage structured data.

### Session 02 - (Data Manipulation in SQL)

- **Basic SQL Operations**
  - Import data  
  - SELECT Statement (basic querying)  
  - WHERE Clause (filtering data)  
  - IN, BETWEEN, LIKE  

- **SQL DDL Statements (Data Definition Language)**
  - Adding/dropping keys  
  - Adding/dropping columns  
  - Modifying columns (changing the datatype, adding constraints, setting defaults, etc.)  
  - Truncate  

- **SQL DML Statements (Data Manipulation Language)**
  - Inserting records  
  - Deleting records (with WHERE clause)  
  - Updating records statically, dynamically, or conditionally (with WHERE clause)  

- **SQL TCL Statements (Transaction Control Language)**
  - Start transaction  
  - Commit  
  - Rollback

##### Reading Materials - SQL Fundamentals

[W3Schools – SQL WHERE Clause](https://www.w3schools.com/sql/sql_where.asp)  
A beginner-friendly guide to filtering records in SQL using the WHERE clause, with examples and syntax explanations.

[DataCamp – SQL DML Commands](https://www.datacamp.com/tutorial/sql-dml-commands-mastering-data-manipulation-in-sql)  
An in-depth tutorial on SQL Data Manipulation Language (DML) covering SELECT, INSERT, UPDATE, and DELETE operations.


### Session 03 - (SQL Functions and Advanced Querying )

- SQL DDL Statements  
- SQL DML Statements  
- SQL TCL Statements  

- **SQL Functions**
  - Aggregate Functions  
  - String Functions  
  - Date Functions  
  - Mathematical Functions  

- **Advanced SQL Clauses**
  - DISTINCT  
  - GROUP BY  
  - HAVING  

- CASE statements

##### Reading Materials - SQL Topics and Use Cases

[DataCamp – SQL DML Commands](https://www.datacamp.com/tutorial/sql-dml-commands-mastering-data-manipulation-in-sql)  
A tutorial covering SQL Data Manipulation Language (DML) including INSERT, UPDATE, DELETE, and SELECT commands with examples.

[Acho – The Ultimate Guide to Data Cleaning in SQL](https://acho.io/blogs/the-ultimate-guide-to-data-cleaning-in-sql)  
A comprehensive guide on cleaning and preparing data in SQL using techniques like handling NULLs, formatting, and removing duplicates.

[The Clever Programmer – Product Sales Analysis Using SQL](https://thecleverprogrammer.com/2023/06/14/product-sales-analysis-using-sql/)  
A hands-on walkthrough of analyzing product sales data using SQL queries, with practical examples and business questions.

[Programiz – SQL GROUP BY](https://www.programiz.com/sql/group-by)  
Learn how to group and summarize data in SQL using the GROUP BY clause, with clear examples and step-by-step explanations.

[Mode – SQL CASE Statement](https://mode.com/sql-tutorial/sql-case)  
An intuitive tutorial on how to use the CASE statement in SQL for conditional logic inside queries.


### Session 04 - (Analysis, Joins and Data Relationships in SQL )

- **CASE Statements**
  - How to use CASE in queries  
  - How to use CASE inside aggregate functions  
  - How to use CASE in UPDATE statements  

- **ERDs & Table Relationships**
  - Inner Join  
  - Left Join  
  - Right Join  
  - Cross Join  
  - Full Outer Join  
  - Self Join


##### Reading Materials - SQL Joins

[Programiz – SQL JOIN](https://www.programiz.com/sql/join)  
A clear explanation of SQL JOINs with examples, covering how to combine rows from two or more tables based on related columns.

[W3Schools – SQL JOIN](https://www.w3schools.com/sql/sql_join.asp)  
An easy-to-follow tutorial on different types of JOINs in SQL including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.

[GeeksforGeeks – SQL JOIN (Set 1)](https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/)  
Detailed coverage of INNER, LEFT, RIGHT, and FULL joins with syntax and visual diagrams to enhance understanding.


### Session 05 - (Subqueries and CTEs for Complex Data Retrieval )

- Joins  

- **Subqueries**
  - Understand the difference between subqueries and joins  
  - Single value subquery  
  - Multi-row subquery  
  - Multi-row and multi-column subquery  
  - Correlated subqueries  

- **Common Table Expressions (CTEs)**
  - Show them how to make CTEs  
  - Comparing subqueries and CTEs  
  - How to use CTEs and joins to update a table


##### Reading Materials - SQL Joins and Subqueries

[Programiz – SQL JOIN](https://www.programiz.com/sql/join)  
A clear explanation of SQL JOINs with examples, covering how to combine rows from multiple tables using related columns.

[Programiz – SQL Subquery](https://www.programiz.com/sql/subquery)  
Learn how subqueries work in SQL with examples of single-row, multi-row, and correlated subqueries.

[W3Resource – Understanding SQL Subqueries](https://www.w3resource.com/sql/subqueries/understanding-sql-subqueries.php)  
An in-depth guide to understanding subqueries, including where and how they are used in different SQL statements.


### Session 06 - (CTEs and Window Functions for Advanced Analytics in SQL)

- **SQL Window Functions**
  - Understanding the ORDER BY and PARTITION BY clauses inside the OVER() clause  
  - LEAD() and LAG()  
  - RANK() and DENSE_RANK()  
  - Explore other window functions from the MySQL window functions list  
  - Combining window functions and CTEs


##### Reading Materials - SQL CTEs and Subqueries

[LearnSQL – What is a Common Table Expression?](https://learnsql.com/blog/what-is-common-table-expression/)  
An introductory guide explaining what CTEs are, how they work, and why they are useful for writing readable SQL queries.

[GeeksforGeeks – CTE in SQL](https://www.geeksforgeeks.org/cte-in-sql/)  
A practical explanation of Common Table Expressions (CTEs) with syntax and examples, including recursive CTEs.

[W3Resource – Understanding SQL Subqueries](https://www.w3resource.com/sql/subqueries/understanding-sql-subqueries.php)  
An in-depth overview of SQL subqueries with detailed examples, use cases, and classifications.

[Programiz – SQL Subquery](https://www.programiz.com/sql/subquery)  
A beginner-friendly guide to subqueries in SQL, covering single-row, multi-row, and correlated subqueries.

