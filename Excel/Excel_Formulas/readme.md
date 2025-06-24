## Excel Fromulas

Excel sheets Manual

## Excel Manual – Session 02

#### 1. Text to Column and CONCAT
This feature allows you to split the content of a single column into multiple columns based on a  delimiter (e.g., comma, space).

 Formula: **` =CONCAT(text1, text2, ...) `**
- If A1 contains "Hello" and B1 contains "World", =CONCAT(A1, " ", B1) will
result in "Hello World".


#### 2. Text Functions: LEFT, RIGHT, MID

**LEFT**
Extracts a specified number of characters from the start of a text string.
-  Formula: **` =LEFT(text, num_chars) `**
- Example: =LEFT("Excel", 2) returns "Ex"

**RIGHT**
Extracts a specified number of characters from the end of a text string.
- Formula: **` =RIGHT(text, num_chars) `**
- Example: =RIGHT("Excel", 2) returns "el"

**MID**
Extracts characters from the middle of a text string, starting at a specified position.
-  Formula: **` =MID(text, start_num, num_chars) `**
- Example: =MID("Excel", 2, 3) returns "xce".

#### 3. Advanced Sorting and Filtering

#### 4. Handling Duplicates


## Excel Manual – Session 03

Table of Contents
1. IF Function
2. Advanced Logical Functions (AND, OR, NOT)
3. VLOOKUP in-depth
4. Data Validation: Creating Rules to Ensure Data

#### 1. IF Function : logical tests and returns different values based on whether the condition is TRUE or FALSE.
- **` =IF(logical_test, value_if_true, value_if_false) `**
-  If cell A1 contains a number, =IF(A1 > 10, "Yes", "No") will return "Yes" if A1 is
greater than 10, otherwise it will return "No".

#### 2. Advanced Logical Functions (AND, OR, NOT)

**AND Function**
• Description: Returns TRUE if all arguments are TRUE, otherwise returns FALSE.
-  Formula: **` =AND(logical1, [logical2], ...) `**
- Example: =AND(A1 > 10, B1 < 5) returns TRUE if both conditions are met.

**OR Function**
• Description: Returns TRUE if any of the arguments are TRUE.
-  Formula: **` =OR(logical1, [logical2], ...) `**
- Example: =OR(A1 > 10, B1 < 5) returns TRUE if either condition is met.

**NOT Function**
• Description: Reverses the value of its argument. Returns FALSE if the argument is
TRUE and TRUE if the argument is FALSE.
-  Formula: **` =NOT(logical) `**
- Example: =NOT(A1 > 10) returns TRUE if A1 is not greater than 10.


#### 3. VLOOKUP in-depth
VLOOKUP (Vertical Lookup) searches for a value in the first column of a table and returns a value in the same row from a specified column.
- Formula **` =VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup]) `**
Example
• To find the price of an item in a list where the item names are in column A and prices in column B, =VLOOKUP("Apple", A:B, 2, FALSE) returns the price of "Apple".
Key Points
• Ensure the lookup value is in the first column of the table array.
• Use FALSE for an exact match and TRUE for an approximate match.

#### 4. Data Validation: Creating Rules to Ensure Data Integrity
Data validation is used to create rules that restrict the type of data or the values that users can enter a cell.

Steps
1. Select the cells where you want to apply data validation.
2. Go to the Data tab and click on Data Validation.
3.Set the criteria for data validation (e.g., whole number, list, date)
Example
To restrict a cell to accept only whole numbers between 1 and 100:
1. Select the cell(s).
2. Go to Data Validation > Settings tab.
3. In Allow, select Whole number.
4. Set the minimum and maximum values to 1 and 100, respectively.
Tips
• Use custom formulas for more complex validation rules.
• Add input messages and error alerts to guide users.

