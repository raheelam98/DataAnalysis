## EDA Quiz Comprehensive Part 1 :

#### **Q1: What does `display(df.head())` return?**
- A. The number of rows and columns  
- B. The column data types  
- C. The first 5 rows of the DataFrame  
- D. The summary statistics for numeric columns  

#### **Q2: What does `df.columns` return?**
- A. First few rows  
- B. Shape of the DataFrame  
- C. All column names in the DataFrame  
- D. All index values in the DataFrame  

#### **Q3: What does `df.shape` return?**
- A. Data types of each column  
- B. Summary statistics  
- C. Number of missing values  
- D. Tuple with number of rows and columns  

#### **Q4: What does `df.info()` provide?**
- A. Descriptive statistics  
- B. All null values  
- C. Column data types and non-null counts  
- D. Unique values per column  

#### **Q5: Which method returns summary statistics for numeric columns?**
- A. `df.info()`  
- B. `df.describe()`  
- C. `df.sum()`  
- D. `df.head()`  

#### **Q6: Which command shows the frequency of each value in a column?**
- A. `df['Column'].unique()`  
- B. `df['Column'].value_counts()`  
- C. `df['Column'].nunique()`  
- D. `df['Column'].duplicated()`  

#### **Q7: What does `df['Column'].nunique()` do?**
- A. Lists all unique values  
- B. Counts duplicates  
- C. Returns number of distinct non-null values  
- D. Replaces null values  

#### **Q8: Which command gives True/False for missing values?**
- A. `df.isnull()`  
- B. `df.duplicated()`  
- C. `df.notnull()`  
- D. `df.empty()`  

#### **Q9: What does `df['ColumnName'].isnull()` check?**
- A. Column duplicates  
- B. Column names  
- C. Missing values in a specific column  
- D. Unique values  

#### **Q10: Which command calculates missing value percentage?**
- A. `df.count()`  
- B. `df.isnull().sum()`  
- C. `(missing_values / len(df)) * 100`  
- D. `df.describe()`  

#### **Q11: What does `df.fillna(df.median(numeric_only=True), inplace=True)` do?**
- A. Drops missing values  
- B. Replaces all values with median  
- C. Fills missing numeric values with median  
- D. Does nothing  

#### **Q12: Which command restricts column values within a given range?**
- A. `df.fillna()`  
- B. `df.between()`  
- C. `np.clip()`  
- D. `df.replace()`  

#### **Q13: How do you check for duplicate values in a column?**
- A. `df['Column'].duplicated()`  
- B. `df['Column'].value_counts()`  
- C. `df.duplicated().sum()`  
- D. `df.isnull()`  

#### **Q14: How do you drop all duplicate rows in the DataFrame?**
- A. `df.dropna()`  
- B. `df.drop_duplicates(inplace=True)`  
- C. `df.fillna()`  
- D. `df.remove()`  

#### **Q15: What does `df['Column'] = df['Column'].str.lower()` do?**
- A. Drops the column  
- B. Changes column name  
- C. Converts text in column to lowercase  
- D. Removes nulls from column  

#### **Q16: What does `df['Column'] = df['Column'].str.strip()` do?**
- A. Removes duplicates  
- B. Removes whitespace from text  
- C. Sorts the column  
- D. Replaces NaNs  

#### **Q17: How do you list all unique values in a column?**
- A. `df['Column'].value_counts()`  
- B. `df['Column'].nunique()`  
- C. `df['Column'].unique()`  
- D. `df['Column'].duplicated()`  

#### **Q18: What is the purpose of `column.sort()` after using `df['Column'].unique()`?**
- A. Filter duplicates  
- B. Sorts the list of unique values  
- C. Drops the column  
- D. Fills missing values  

--- 

## EDA Quiz Comprehensive Part 1 - Answers :

#### Q1: What does `display(df.head())` return?
*C. The first 5 rows of the DataFrame*

#### Q2: What does `df.columns` return?
*C. All column names in the DataFrame*

#### Q3: What does `df.shape` return?
*D. Tuple with number of rows and columns*

#### Q4: What does `df.info()` provide?
*C. Column data types and non-null counts*

#### Q5: Which method returns summary statistics for numeric columns?
*B. `df.describe()`*

#### Q6: Which command shows the frequency of each value in a column?
*B. `df['Column'].value_counts()`*

#### Q7: What does `df['Column'].nunique()` do?
*C. Returns number of distinct non-null values*

#### Q8: Which command gives True/False for missing values?
*A. `df.isnull()`*

#### Q9: What does `df['ColumnName'].isnull()` check?
*C. Missing values in a specific column*

#### Q10: Which command calculates missing value percentage?
*C. `(missing_values / len(df)) * 100`*

#### Q11: What does `df.fillna(df.median(numeric_only=True), inplace=True)` do?
*C. Fills missing numeric values with median*

#### Q12: Which command restricts column values within a given range?
*C. `np.clip()`*

#### Q13: How do you check for duplicate values in a column?
*A. `df['Column'].duplicated()`*

#### Q14: How do you drop all duplicate rows in the DataFrame?
*B. `df.drop_duplicates(inplace=True)`*

#### Q15: What does `df['Column'] = df['Column'].str.lower()` do?
*C. Converts text in column to lowercase*

#### Q16: What does `df['Column'] = df['Column'].str.strip()` do?
*B. Removes whitespace from text*

#### Q17: How do you list all unique values in a column?
*C. `df['Column'].unique()`*

#### Q18: What is the purpose of `column.sort()` after using `df['Column'].unique()`?
*B. Sorts the list of unique values*

