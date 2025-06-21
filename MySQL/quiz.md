### SQL Practice Quiz

**1. Suppose we have the string `"HelloWorld"` and want to extract `"World"` using `SUBSTRING`. Which `SUBSTRING` function would you use?**

- [ ] SUBSTRING('HelloWorld', 1, 5)  
- [ ] SUBSTRING('HelloWorld', 6, 5)  
- [ ] SUBSTRING('HelloWorld', 1, 10)

**2. What is the primary use of the `CASE` statement in SQL?**

- [ ] To perform calculations  
- [ ] To manipulate strings  
- [ ] To join tables  
- [ ] To perform conditional logic
 
**3. What is the difference between the following two SQL queries?**

Query 1: SELECT * FROM customers WHERE country = 'USA' AND age > 18;
Query 2: SELECT * FROM customers WHERE age > 18 AND country = 'USA';

- [ ] Query 1 is faster than Query 2
- [ ] Query 2 filters by age first, then country
- [ ] The order of conditions doesn't matter; results will be the same
- [ ] Query 1 filters by country first, then age

---

### SQL Practice Quiz Answer

#### 1. Suppose we have the string `"HelloWorld"` and want to extract `"World"` using `SUBSTRING`. Which `SUBSTRING` function would you use?
SUBSTRING('HelloWorld', 6, 5)


#### 2. What is the primary use of the `CASE` statement in SQL?
To perform conditional logic

#### 3. What is the difference between the following two SQL queries?
Query 1: SELECT * FROM customers WHERE country = 'USA' AND age > 18;

Query 2: SELECT * FROM customers WHERE age > 18 AND country = 'USA';

The order of conditions doesn't matter; results will be the same

