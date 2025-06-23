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

---

#### Excel Session - Solution - 02 Task (Sales 2nd Session)

#### 1. How many total transactions are in the dataset?
- total transactions    =MAX(A:A)   134371
- Calculate total numbers of rows :-  =ROWS(A:A)   1048576
- Calculate total number of rows without blank :-   =COUNT(A:A)   134371

#### 2. How many orders were placed in March 2023?  
` =COUNTIF(B:B,"*_32023") `  result = 19131

#### 3. How many stores are there?
stores total     ` =COUNTA(UNIQUE(H:H))`  result = 5  (column H - store_id in Transaction-sheet)

#### 4. How many transactions were from store_id = 5? 
`=COUNTIF(H:H,5)`    result = 3738   (column H - store_id in Transaction-sheet)

#### 5. How many unique categories of product are there?
 total_unique_product_category.   ` =COUNTA(UNIQUE(C2:C76))`  result = 8

#### 6. How many types of tea products are available?
unique tea products  ` =SUM(COUNTA(FILTER(A:A, (C:C="Loose Tea")+(C:C="Tea"))))`  result = 24

#### 7. What is the Highest unit price of Coffee? (product-sheet)
??

- Filter loose tea and tea from product_category :  `FILTER(A:A, (C:C="Loose Tea")+(C:C="Tea"))`
  result = 11, 12, 13, 14, 15, 16, 17, 18, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,57
- Count Loose Tea and Tea from product_category :  `=COUNTIFS(C:C, "Loose Tea") + COUNTIFS(C:C, "Tea")`   result = 24

#### 8. What is the average price of Bakery Category products?
store_locations column :-  `=UNIQUE(B:B)`    Peshawar.  Islamabad. Lahore  -- store-sheet 

---

#### Excel Session - Sales.xlsx

#### Transactions Sheet
- column B - Transactiondate : 1_12023
- column G - store_id | product_id
- column H - store_id


**`=column1& "-" &column2`  (combine two columns  )**  (e.g. month-year)   =D2 &"-" &E2  

**Formating Date,   day_monthyear** Given Date format:  11_12023 
- separate day     `=LEFT(B2,LEN(B2)-6)`       e.g. 11_12023, day (11)   
- separate month   `=MID(B3,FIND("_",B3)+1,1)` e.g. 11_12023, month (1)   
- separate year    `=RIGHT(B2,4)`              e.g. 11_12023, Year (2023) 
- month-year       `=LEFT(B2,FIND("_",B2)-1) & "-" & RIGHT(B2,4)`  e.g.   1_2023
- day/month/year    `=DATE(E2,D2,C2)`

##### TRIM , FIND 
- **Separate Two Things From Column Data**, e.g. `store_id|product_id `
- store_id    `=TRIM(LEFT(G2,FIND("|",G2)-1))`
- product_id    `=TRIM(RIGHT(G2,LEN(G2)-FIND("|",G2)))`

##### ROWS, COUNT, COUNTIF, COUNTA
- **transaction_total_rows :** `=ROWS(A:A)`
- **total_without_blank :** `=COUNT(A:A)`
- **orders in March 2023 :** `=COUNTIF(B:B,"*_32023")`
  DateFormat 1_32023 (day_monthyear)
- **stores total :**  `=COUNTA(UNIQUE(H:H))`

##### TEXT, IF, TIME, OR, AVERAGE
- **transactions for store_id = 5 :**  `=COUNTIF(H:H,5)`
- **day of the week  :**  ` TEXT(F2,"=TEXT(F2,"dddd")" ` :  (F-column) Date (10/1/2023) result = sunday
- **shift - Morning/Evening  :** ` =IF(AND(H2>=TIME(6,0,0),H2<=TIME(14,0,0)),"Morning shift","Evening shift") `   :    (H-column) transaction_time (7:06:11)  shift = Morining shift
- **total_sales :**   ` M2*N2 `
     (M-column) transaction_qty (2) , (N-column) unit_price (3), total_sales = 6
- **sales_category - Premimum/Standard :**  ` =IF(R3>AVERAGE(R:R),"Premimum","Standard") `
      (R-column) total_sales (6) , sales_category = Premimum
- **weekend_order - week_order/weekend_order:** check ` =IF(OR(G2="Sunday",G2="Saturday"),"Weekend orders","Weekday order") `
    (column-G) day of week (sunday)  weekend_order=*weekend_order

##### UNIQUE,  
- `=COUNTA(UNIQUE(H:H))`
  

#### Product Sheet

- **Count Loose Tea and Tea :** ` =COUNTIFS(C:C, "Loose Tea") + COUNTIFS(C:C, "Tea") `  note: column C : product category
- **Filter loose tea and tea from product_category :**  ` =FILTER(A:A,(C:C="Loose Tea")+(C:C="Tea")) `
- **Unique Product (from product_category column C ):** ` =UNIQUE(C:C) `
- **total_unique_product_category :** ` =COUNTA(UNIQUE(C2:C76)) `

---

**`=COUNTA(range) :`**  counts the number of non-empty cells  

=COUNTA(value1, [value2], ...)  


**`=COUNTIF(range, criteria) :`** count the number of cells in a range that meet a specific condition

- **Find frequency** of a specific value in a dataset  
- **Count matching names**, categories, or entries  (Count how many times a name appears)
- **Filter data** based on conditions like `"greater than"`, `"equals"`, or `"contains"` (Count values greater than or less than a number)






