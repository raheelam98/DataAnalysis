# DataFrame Basics & Cleaning – MCQs (Questions Only)

---

### 1. What does `df.info()` provide?

A) Only column names  
B) Descriptive statistics of numerical columns  
C) Summary of index, columns, data types, and non-null counts  
D) Frequency of unique values

### 2. Which function is used to count the number of missing values per column?

A) `df.isnull()`  
B) `df.dropna()`  
C) `df.fillna()`  
D) `df.isnull().sum()`


### 3. What will `df['Name'].duplicated()` return?

A) A count of unique values in the Name column  
B) A boolean Series indicating if a row is a duplicate  
C) Removes all duplicate names  
D) Replaces missing names with a placeholder


### 4. Which command will remove all rows with missing values permanently?

A) `df.dropna()`  
B) `df.dropna(inplace=True)`  
C) `df.dropna(axis=1)`  
D) `df.fillna('missing')`

### 5. How do you convert values like "PKR 2.5 Crore" to a numeric format?

A) Using `.fillna()`  
B) With `np.clip()`  
C) By writing a string cleaning function and converting  
D) Using `df.describe()`


### 6. What does `df['Column'].nunique()` return?

A) A list of unique values  
B) The number of all values in the column  
C) The number of distinct non-null values  
D) The frequency of values in a column


### 7. Which of the following drops multiple columns?

A) `df.drop('col1', 'col2')`  
B) `df.remove(['col1', 'col2'])`  
C) `df.drop(['col1', 'col2'], axis=1)`  
D) `df.columns.remove(['col1', 'col2'])`


### 8. What does `np.clip(df['Fare'], 2, 100)` do?

A) Removes outliers above 100  
B) Sets all values below 2 to 2 and above 100 to 100  
C) Filters rows with Fare between 2 and 100  
D) Normalizes values in the column

### 9. Which method fills missing values with the median?

A) `df.fillna('median')`  
B) `df.replace(median=True)`  
C) `df['col'].fillna(df['col'].median())`  
D) `df['col'].replace('NaN', df['col'].median())`


### 10. Which command shows all unique values in a column?

A) `df['col'].nunique()`  
B) `df['col'].unique()`  
C) `df['col'].value_counts()`  
D) `df.columns`

---
---
# 🧠 DataFrame Basics & Cleaning – MCQs with Answers

### 1. What does `df.info()` provide?
C) Summary of index, columns, data types, and non-null counts

### 2. Which function is used to count the number of missing values per column?
D) `df.isnull().sum()`

### 3. What will `df['Name'].duplicated()` return?
B) A boolean Series indicating if a row is a duplicate

### 4. Which command will remove all rows with missing values permanently?
B) `df.dropna(inplace=True)`

### 5. How do you convert values like "PKR 2.5 Crore" to a numeric format?
C) By writing a string cleaning function and converting

### 6. What does `df['Column'].nunique()` return?
C) The number of distinct non-null values

### 7. Which of the following drops multiple columns?
C) `df.drop(['col1', 'col2'], axis=1)`

### 8. What does `np.clip(df['Fare'], 2, 100)` do?
B) Sets all values below 2 to 2 and above 100 to 100

### 9. Which method fills missing values with the median?
C) `df['col'].fillna(df['col'].median())`

### 10. Which command shows all unique values in a column?
B) `df['col'].unique()`

