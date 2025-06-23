#### Excel Session - 03 Task (Sales 3rd Session)

1. Bring "store_location" columns from the sheet "Stores" to the sheet "Transactions" using store_ID.
2. Bring unit_price, product_category, product_type, product_detail columns from the sheet "Product" to the sheet "Transactions" using Product_ID.
3. Create a Total Sales column by multiplying Quantity with Price.
4. Create a "Sales Category" for Orders: If Sale of the order  > average(sales), classify it as Premium, otherwise Standard.
5. Create a column to classify orders as "Weekend Order" if placed on Saturday or Sunday, otherwise "Weekday Order".
6. Create a conditional column for Shifts based on Time:
"Morning Shift": 6:00 AM - 2:00 PM,
Else, "Evening Shift"
7. Add a data validation rule to ensure only "Premium" or "Standard" values are entered in the Premium Pizza column.
8. Add a data validation rule to allow only whole numbers between 1 and 10 in the Quantity column.
9. What is the total sales amount?
10. How many stores are there?
11. How many transactions were from store_id = 5?
12. What is the Highest unit price of Coffee?
13. What is the average price of Bakery Category products?
14. How many orders have been placed for product_id = 40 on Sunday?
15. Which sales category (Premium, Standard) contributes most to total sales?

---

#### 1. Bring "store_location" columns from the sheet "Stores" to the sheet "Transactions" using store_ID.



#### 2. Bring unit_price, product_category, product_type, product_detail columns from the sheet "Product" to the sheet "Transactions" using Product_ID.

#### 3. Create a Total Sales column by multiplying Quantity with Price.

#### 4. Create a "Sales Category" for Orders: If Sale of the order  > average(sales), classify it as Premium, otherwise Standard.

#### 5. Create a column to classify orders as "Weekend Order" if placed on Saturday or Sunday, otherwise "Weekday Order".

#### 6. Create a conditional column for Shifts based on Time:
"Morning Shift": 6:00 AM - 2:00 PM,
Else, "Evening Shift"



#### 7. Add a data validation rule to ensure only "Premium" or "Standard" values are entered in the Premium Pizza column.

#### 8. Add a data validation rule to allow only whole numbers between 1 and 10 in the Quantity column.

#### 9. What is the total sales amount?
#### 10. How many stores are there?

#### 11. How many transactions were from store_id = 5?

#### 12. What is the Highest unit price of Coffee?

#### 13. What is the average price of Bakery Category products?

#### 14. How many orders have been placed for product_id = 40 on Sunday?

###15. Which sales category (Premium, Standard) contributes most to total sales?
---

### Session 03_Sales - AM

VLOOKUP(D2,Stores!A:B,2,FALSE)

XLOOKUP(E2,Products!A:A,Products!B:B,"Not found")

transaction_qty * unit_price

IF(K2>AVERAGE(K:K),"Premium","Standard")

IF(OR(weekday="Saturday", weekday="Sunday"), "Weekend","Weekday order")

IF(AND(B2>=TIME(6,0,0),B2<TIME(14,0,0)),"Morning shift","Evening shift")

IFS(AND(G2>=TIME(6,0,0),G2<TIME(14,0,0)),"Morning shift",AND(G2>=TIME(14,0,0),G2<TIME(22,0,0)),"Evening shift",TRUE,"Night Shift")

=SUM(Transactions!L:L)

=COUNTA(Stores!B2:B4)

=COUNTIF(Transactions!E:E,5)

=ROUND(AVERAGEIF(Products!C:C,"Bakery",Products!B:B),2)

=COUNTIFS(Transactions!F:F,40,Transactions!K:K,"Sunday")

Premium   =SUMIF(Transactions!R:R,'TASK solution'!F33,Transactions!L:L)



