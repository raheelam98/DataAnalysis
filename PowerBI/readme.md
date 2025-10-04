## Power BI

[Power BI Project End to End Dashboard Development | Beginners | Power BI Tutorial - Pivotalstats](https://www.youtube.com/watch?v=G8ikAJele_s)

### **Power BI - Tool**

**Data**

- **Data scraping** = getting the raw data.
- **Data cleaning** = making that data usable.


---

#### **Power BI / Data Analysis Workflow**

This workflow shows the complete lifecycle of data in Power BI:  
Data is **extracted → cleaned → modeled → analyzed → visualized → published**.  
It highlights how **Data Analysis Expressions (DAX)** and visual dashboards turn raw data into meaningful business insights.

#### **Overview**
The end-to-end process demonstrates how raw data is **collected, cleaned, transformed, modeled, and visualized** into dashboards for publishing and decision-making.

#### **Steps in the Process**

1. **Get Data (Data Extraction/Ingestion)**
   - Sources: CSV, Excel, MySQL, SQL Server, Google Sheets, Web Services, etc.  
   - **Goal:** Collect raw data from multiple sources.  

2. **Cleaning / Transformation (Data Transformation)**
   - Tool: **Power Query**  
   - Tasks:  
     * Handle missing values and duplicates  
     * Fix text inconsistencies  
     * Ensure correct data types  
     * Standardize column names  
   - **Goal:** Make raw data usable for analysis.  

3. **Relationships (Data Modeling)**
   - Define relationships between tables (e.g., fact and dimension tables).  
   - Ensure schema supports accurate reporting.  

4. **DAX (Data Analysis Expressions)**
   - Create calculated columns, measures, KPIs.  
   - Perform advanced aggregations and business logic.  
 
5. **Visuals / Dashboard (Data Visualization)**
   - Build interactive reports with charts, graphs, and visuals.  
   - Communicate insights effectively.  

6. **Publish (Report Publishing)**
   - Share dashboards via **Power BI Service**, web, or mobile apps.  
   - Enable collaboration and better decision-making.  

---

#### **ETL in Data Science / Analytics**

ETL stands for **Extract, Transform, Load**.  
It is the process used to integrate data from multiple sources into a single storage system (like a database, data warehouse, or BI tool such as Power BI).

#### **1. Extract**
* Collect data from multiple sources:  
  - Databases (MySQL, SQL Server, Oracle)  
  - Files (CSV, Excel)  
  - APIs / Web Services  
  - Cloud Storage (Azure, AWS, Google Cloud)  
* **Goal:** Gather raw data.  

#### **2. Transform**
* Clean and prepare data for analysis:  
  - Handle missing values / duplicates  
  - Standardize column names  
  - Fix data types (date, numeric, text)  
  - Remove inconsistencies (e.g., "NY" vs "New York")  
  - Create calculated fields  
* **Tools:** SQL, Power Query, Python (Pandas), Spark, etc.  
* **Goal:** Convert raw data into meaningful, structured data.  

#### **3. Load**
* Store the transformed data into a target system:  
  - Data Warehouse (Snowflake, BigQuery, Redshift, Azure Synapse)  
  - Database (PostgreSQL, SQL Server, MySQL)  
  - BI Tools (Power BI, Tableau)  
* **Goal:** Make data available for reporting, dashboards, and analysis.  

#### **Why ETL is Important?**
* Integrates data from different sources  
* Improves data quality  
* Enables fast and reliable analysis  
* Powers dashboards and reports for decision-making  

#### **Example (Power BI)**
When connecting **CSV + SQL Server** data in Power BI:  
- **Extract:** Import CSV + SQL data  
- **Transform:** Clean in Power Query (remove nulls, fix data types)  
- **Load:** Store in Power BI model for analysis  

---
---

[How to Calculate Year over Year Growth % in Power BI - Data Science Tutorials](https://www.youtube.com/watch?v=vaUeODZJyd4)
 
### Power BI - Data Modeling Resources

Articles cover key concepts - Power BI models.

[Data Modeling in Power BI: An Introduction – Chester King (LinkedIn)](https://www.linkedin.com/pulse/data-modeling-power-bi-introduction-chester-king/)

[Data Modeling in Power BI – DataCamp Tutorial](https://www.datacamp.com/tutorial/data-modeling-in-power-bi-tutorial)

### Session - (Power Query)

- Power BI Overview 
- Load the data from CSV, Excel, Folder, mysql database
- Power Query Interface
- Data Transformation in Power Query

##### Reading Materials 

[Power BI Query Overview – Microsoft Documentation](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-query-overview)

[What is Power BI – Coursera](https://www.coursera.org/articles/what-is-power-bi)

[Power BI Tutorial – Data Flair](https://data-flair.training/blogs/power-bi-tutorial/)

### Session - (DAX)

#### Power BI - DAX Essentials 

This repository contains notes and reference material for learning DAX (Data Analysis Expressions) in Power BI.

##### Topics Covered

- DAX Calculated Columns
- DAX Measures
- Implicit vs Explicit Measures
- Quick Measures
- DAX Syntax & Operators

##### Common DAX Function Categories

- Basic Math & Statistics  
- Count and Distinct Count  
- Text Functions  
- Conditional & Logical Functions  
- SWITCH Function  
- Date & Time Functions  
- CALCULATE Function  
- ALL Function  
- FILTER Function  
  
##### Reading Materials 

[Learn DAX Basics - Microsoft Docs](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-quickstart-learn-dax-basics)
  
[Power BI DAX Tutorial for Beginners - DataCamp](https://www.datacamp.com/tutorial/power-bi-dax-tutorial-for-beginners)  

[DAX Guide - Function Reference](https://dax.guide/)

### Session (Data Visualization)

#### Power BI - Data Visualization & Reporting

This repository contains learning notes and resources for building effective reports and dashboards in Power BI.

##### Explore Different Types of Visualizations

- Time Series Visuals: Line Plots
- Comparison Visuals: Bar and Column Charts
- Maps
- Pie and Donut Charts
- Heatmaps / Treemaps
- Cards
- Narratives and Q&A Visuals

##### Visual Enhancements and Features

- Visual Formatting
- Adding Interactivity with Slicers and Buttons
- Row-Level Security (RLS)
- Pagination in Reports
- Publishing Reports

##### Reading Materials 

[5 Data Visualization Best Practices – GoodData](https://www.gooddata.com/blog/5-data-visualization-best-practices/)  

[Power BI Data Visualization Guide – PixelPlex](https://pixelplex.io/blog/power-bi-data-visualization/)

### Case Study Session

#### Power BI Case Studies & Sample Reports

This repository includes a curated list of articles and sample projects to help you explore real-world use cases and improve your Power BI skills through practical examples.

##### Articles and Resources

[Sample Retail Analysis Report – Microsoft Docs](https://learn.microsoft.com/en-us/power-bi/create-reports/sample-retail-analysis)

[Sample Customer Profitability Report – Microsoft Docs](https://learn.microsoft.com/en-us/power-bi/create-reports/sample-customer-profitability)

[Sales Case Study Analysis – GitHub Project](https://github.com/aisha305/Sales-Case-Study-Analysis-)

[BI in Real Life – Case Studies by Datafortune](https://datafortune.com/bi-in-real-life-case-studies-showcasing-the-impact-of-business-intelligence-services/)

[Power BI Projects and Practice Ideas – ProjectPro](https://www.projectpro.io/article/power-bi-microsoft-projects-examples-and-ideas-for-practice/533)

Use these resources to explore report layouts, DAX usage, visuals, and storytelling techniques applied in real-world Power BI projects.

---



