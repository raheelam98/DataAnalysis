
## Statics - Data Science

- Understand what’s happening in the data  
- Predict what might happen next

---

#### Session 01

### Types of Statistics in Data Science

- **Descriptive Statistics**: What’s happening?  
- **Inferential Statistics**: What’s likely to happen next?

#### Descriptive Statistics – Understanding the Data

- Find the average number of items bought  
- Identify top-selling products  
- Measure spread in customer spending

#### Inferential Statistics – Predicting from the Data

- Predict what customers might buy next  
- Test which webpage layout boosts sales  
- Estimate future sales from a sample

#### Real-World Example – Amazon

**Descriptive:**
- Average order value  
- Most-viewed products  

**Inferential:**
- Will a user buy again next week?  
- Which offer increases conversions?  

#### Descriptive vs Inferential
[Descriptive - Inferential](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-01%20-%20descriptive%20-%20inferential.png)

---

#### Session 02

### Central Tendency in Descriptive Statistics

#### Measures of Central Tendency

- **A measure that defines the center or typical value of a dataset**  
- Summarizes large datasets and gives a clear overview  
- Key in Data Science: Simplifies complex data for meaningful comparisons

#### Key Metrics to Summarize Central Point

- **Mean**: Average of all values  
- **Median**: Middle value of ordered data  
- **Mode**: Most frequent value in the dataset

#### Mean: Average Value of Data

- Helps identify overall trends in continuous datasets  
- Application in Data Science: Critical for analyzing large datasets  

**Example:**

Monthly Sales: $5000, $6000, $7000, $8000, $9000

**Mean Sales** = (5000 + 6000 + 7000 + 8000 + 9000) / 5 = 7000

- **Why It’s Important**: Serves as a baseline for model predictions, like sales forecasting

#### Median: Middle Value of Data

- Essential for skewed data distributions  
- Used when data contains outliers or isn't normally distributed  

**Example:**

Salary: $30K, $50K, $75K, $100K, $200K

Median Salary = $75K (**resistant to the $200K outlier**)

- **Why It’s Important**: Ideal for income/property data with common outliers

#### Mode: Most Frequent Value

- Identifies most frequent occurrence in data  
- **Helps find patterns and trends in categorical data**  

**Example:**

Survey Ratings: 1, 2, 3, 4, 4, 4, 5

Mode = 4

- **Why It’s Important**: Critical for understanding customer preferences

---

#### Session 03

### Descriptive Statistics: Measures of Dispersion

#### Measures of Dispersion

- Understands variability within data  
- Crucial for determining data consistency and model performance 
- Detects outliers and data distribution  
- Essential for model selection, preprocessing, and risk assessment

#### Types of Dispersion Measures

- **Range**: Max - Min  
- **Variance**: Average squared deviation from the mean  
- **Standard Deviation**: Square root of variance

[Mean - Variance - Standard Deviations](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-03%20-%20mean%20-%20median%20-%20mode.png)


#### Range

- Spread between minimum and maximum values  
- Simple measure of variability  

**Example:**

Product Prices: $50, $100, $200, $500

Range = $500 - $50 = $450

- **Why It’s Important**: Useful for identifying outliers

#### Variance

- Measures average squared deviation from the mean  
- Application: Understands consistency or variability

**Example:**

Monthly Sales: $10, $20, $30

Mean = $20

Variance = 66.67

- **Why It’s Important**: Essential for modeling and risk analysis

#### Standard Deviation

- Square root of variance, same units as data  
- Assesses precision of data and model performance

**Example:**

Monthly Sales: $10, $20, $30

Mean = $20

Variance = 66.67

Std Dev ≈ $8.16

(The sales figures deviate from the mean by $8.16 or $8)

[Standard Deviation](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-03%20-%20standard%20deviation.png)

- **Why It’s Important**: Evaluates predictions and data precision

---

#### Session 04

### Data Visualization

- Understand, interpret, and present data effectively  
- Uncovers patterns, trends, and outliers  
- Communicates data findings clearly  
- Enables faster decision-making

#### Common Visualization Types

- **Histograms**: Show data distribution  
- **Boxplots**: Show spread and outliers  
- **Scatter Plots**: Show relationships between variables

#### Histograms

- Visualizes frequency distribution of continuous data  
- Application: Pattern and outlier detection  

**Example:**

Monthly Sales: $100, $200, $300, $400, $500

Histogram shows the frequency of sales in each price range

- **Why It’s Important**: Essential for EDA , and understanding data distribution before modeling

[Histograms](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-04%20-%20histograms.png)

#### Boxplots

- Summarizes data distribution, median, quartiles, and outliers  
- Application: Outlier detection and dataset comparison  

**Example:**

Data: {10, 20, 30, 40, 50}

**Boxplot shows the median, quartiles, and any data points outside of the upper and lower whiskers (outliers)**

- **Why It’s Important**: Critical for data cleaning

[Boxplots](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-04%20-%20boxplots.png)

#### Scatterplots

- Shows relationship between two continuous variables  
- Application: Identifies trends and correlations  

**Example:**

Advertising Spend ($) vs Sales ($)

- **Why It’s Important**: Key for feature selection and trend analysis

[Scatter Plots](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-04%20-%20scatter%20plots.png)

---

#### Session 05

### Data Shape & Distribution

- Helps understand how data behaves  
- Informs transformation choices and model selection  
- Affects outlier detection and risk evaluation  

**Application**: Improves model accuracy by aligning analysis with data shape

#### Key Concepts

- **Skewness**: Direction of asymmetry  
- **Kurtosis**: Tailedness or peakiness of data

#### Skewness

- Measures asymmetry of distribution  

**Example:**

Housing Prices: $50K, $150K, $200K, $1M

→ Positive skew (right-tailed) : A few extremely high property prices

- **Why It’s Important**: Indicates need for transformation before modeling

[Skewnes](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-05%20-%20skewnes.png)

#### Kurtosis

- Measures concentration and presence of outliers  

**Example:**

Stock Returns: 5%, -2%, 10%, 3%, 30%

→ High kurtosis = (heavy tails) :  A few extreme values outside the usual range

- **Why It’s Important**: Key for risk assessment and anomaly handling

[Kurtosis](https://github.com/raheelam98/DataAnalysis/blob/main/Statistics/Statistics_images/sec-05%20-%20kurtosis.png)





