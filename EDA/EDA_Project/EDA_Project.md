## EDA Project

### Real Estate Market Insights: An Exploratory Analysis of Zameen.com Listings in Pakistan

### Project Objective

To extract actionable insights from property listings on Zameen.com — such as pricing trends, neighborhood comparisons, and listing quality — that can help real estate investors make informed decisions.

### Deliverables

1. A Colab/Jupyter Notebook with end-to-end analysis  
2. A GitHub repository with code, README, and insights summary *(optional)*  
3. An executive report or PDF summarizing key findings and visualizations

### Rubric

- Code with comments: **50 points**  
- Report: **50 points**

---

### Dataset Description

Dataset Link:  
[Zameen.com Dataset (Google Sheets)](https://docs.google.com/spreadsheets/d/1jnt2UEGt-R2pKlUslVcdHwqwysrekoAZ/edit?usp=sharing)

Features included:
- Listing titles, location (city, area)  
- Price  
- Property type  
- Area  
- Number of beds/baths  
- Date of posting  
- Description text

### Project Sections

#### 1. Problem Statement

- Define the business question:  
  **What drives property prices in Pakistan?**

#### 2. Data Understanding & Preprocessing

**Libraries:** `pandas`, `numpy`  
**Tasks:**
- View basic info  
- Handle duplicates  
- Clean messy columns (e.g., remove commas, PKR symbols)  
- Convert area units (marla/kanal/sqft → uniform sqft), if required

#### 3. Missing Values Treatment

**Tasks:**
- Identify missing values using `.isnull().sum()`  
- Impute with mode/mean/forward-fill for categorical/numerical values  
- Justify chosen treatment method

#### 4. Data Cleaning & Consistency

**Libraries/Tools:** `FuzzyWuzzy`, custom functions  
**Tasks:**
- Standardize city names using fuzzy matching  
- Detect and correct inconsistent property types  
- Remove outliers using IQR or Z-score

#### 5. Feature Engineering

- Create new features to enhance insight extraction and model performance

#### 6. Univariate & Bivariate Analysis

**Libraries:** `matplotlib`, `seaborn`  
**Tasks:**
- Plot distributions of prices, area  
- Correlation heatmap  
- Violin plots / Box plots to compare prices by city, property type, and number of bedrooms

#### 7. Insights & Recommendations

- Use domain knowledge and statistical evidence to generate actionable insights

#### 9. Conclusion & Next Steps

- Summarize key learnings from the analysis  
- Suggest next steps and recommendations for stakeholders (e.g., investors)



