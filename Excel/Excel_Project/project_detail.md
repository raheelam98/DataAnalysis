# Excel Project – Retail Sales Analysis

**Total Marks:** 100  


#### Scenario

You are a Data Analyst at an e-commerce company aiming to enhance sales strategies and customer satisfaction.  
Your objective is to analyze online retail transaction data to uncover insights into sales performance, customer behavior, and product trends.

#### Dataset Description

- **InvoiceNo** – Unique identifier for each transaction  
- **StockCode** – Product/item code  
- **Description** – Product description  
- **Quantity** – Number of items purchased  
- **InvoiceDate** – Date and time of transaction  
- **UnitPrice** – Price per unit in GBP  
- **CustomerID** – Unique identifier for each customer  
- **Country** – Country of the customer  

#### Objectives

Clean and prepare retail sales data in Excel by fixing errors, creating new features, and organizing it properly.  
Analyze sales trends, customer behavior, product performance, and geographical insights through calculations and visualizations.  
Create a clean, professional dashboard with filters to easily explore and update the sales data.

#### Data Cleaning Steps

- Remove unnecessary columns  
- Eliminate errors and blank rows  
- Extract hour from `InvoiceDate`  
- Convert `InvoiceDate` to proper Date format  
- Correct data types where needed  

#### Feature Engineering

- **Total Revenue** = `UnitPrice` × `Quantity`  
- Extract **Day of Week** from `InvoiceDate`  

### Analysis Questions

#### General Questions

1. Which month had the highest sales, and what was the revenue?  
2. Which top 10 countries sold the most products?  
3. At what time of day do we have the highest sales?  
4. Are there specific days where the number of items sold peaks or dips significantly?  
5. Which top 10 products sold the most?  

#### Sales and Revenue Insights

1. What is the total revenue over time? (daily and monthly trends)  
2. Which products generate the highest sales revenue?  
3. What are the top-selling products by quantity sold?  

#### Customer Behavior

1. What is the average revenue generated per customer?  
2. What percentage of customers make repeat purchases?  
3. How frequently do customers make purchases on average?  

#### Product Analysis

1. Which products generate the highest revenue?  
2. What are the best-selling products in each country?  

#### Time Series Trends

1. How does revenue vary month to month?  
2. Which days of the week have the highest sales?  
3. What time of day sees the most purchases?  

#### Geographical Insights

1. Which countries have the highest average order value?  
2. What is the top-selling product in each region?  
3. What is the revenue breakdown by country?  
4. Are some countries more price-sensitive (lower average unit price)?  

*Note: These questions can help guide your analysis. You can skip or add questions of your choice.*

#### Deliverable

Create a comprehensive Excel dashboard to visualize key metrics and trends.  
Include a short report summarizing your insights and findings.

#### Suggested Metrics

- Customer behavior metrics (average revenue, repeat purchases, purchase frequency)  
- Product performance metrics (top-selling products, revenue)  
- Time series trends (monthly transactions, daily revenue, seasonal patterns)  
- Geographical insights (top countries by sales, average order value)  
- Sales efficiency metrics (products per invoice, average unit price)  

Use visualizations such as **line charts, bar charts, pie charts**, and **pivot tables** to effectively communicate insights and trends.
