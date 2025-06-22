## Excel Session Solution
  
#### Excel Session - 02 Task (Sales 2nd Session)

1. How many total transactions are in the dataset?
2. How many orders were placed in March 2023?
3. How many stores are there?
4. How many transactions were from store_id = 5?
5. How many unique categories of product are there?
6. How many types of tea products are available?
7. What is the Highest unit price of Coffee?
8. What is the average price of Bakery Category products?

#### Excel Session - Solution - 02 Task (Sales 2nd Session)

#### 1. How many total transactions are in the dataset?

**`=COUNTA(range) :`**  counts the number of non-empty cells  

=COUNTA(value1, [value2], ...)  

=COUNTA(A1:A134367)  result 134367

#### 2. How many orders were placed in March 2023?   

**`=COUNTIF(range, criteria) :`** count the number of cells in a range that meet a specific condition

- **Find frequency** of a specific value in a dataset  
- **Count matching names**, categories, or entries  
- **Filter data** based on conditions like `"greater than"`, `"equals"`, or `"contains"`

**`=column1& "-" &column2`  (combine two columns  )**  (e.g. month-year)   =D2 &"-" &E2  






