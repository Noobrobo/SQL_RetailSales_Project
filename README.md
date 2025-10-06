# 🛍️ Retail Sales Analysis SQL Project

## 📋 Project Overview
This comprehensive SQL project provides an in-depth analysis of retail sales data, offering powerful insights into sales performance, customer behavior, and transactional patterns.

---

## 🚀 Key Features
- Data Cleaning  
- Null Value Handling  
- Detailed Sales Analysis  
- Shift-based Order Tracking  
- Customer Segmentation  

---

## 📦 Project Structure

### 1️⃣ Data Preparation Queries
```sql
-- Select all data from RetailSalesAnalysis
SELECT * FROM [RetailSalesAnalysis];

-- Count the rows in the RetailSalesAnalysis
SELECT COUNT(*) FROM [RetailSalesAnalysis];

-- Find the null values in the table
SELECT * 
FROM [RetailSalesAnalysis]
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;
````

### 2️⃣ Null Value Handling

```sql
-- Delete the null values in the table
DELETE FROM [RetailSalesAnalysis]
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;
```

### 3️⃣ Data Exploration Queries

```sql
-- What are the sales?
SELECT COUNT(*) FROM [RetailSalesAnalysis];

-- How many unique customers we have?
SELECT COUNT(DISTINCT customer_id) AS Total_Uniq_Customers
FROM [RetailSalesAnalysis];

-- How many unique categories we have?
SELECT DISTINCT category AS Uniq_Category
FROM [RetailSalesAnalysis];
```

---

## 🔍 Analysis Queries

### Q1️⃣ Sales on Specific Date

```sql
SELECT *
FROM [RetailSalesAnalysis]
WHERE sale_date = '2022-11-05';
```

### Q2️⃣ Category-based Transactions

```sql
SELECT *
FROM [RetailSalesAnalysis]
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;
```

### Q3️⃣ Total Sales by Category

```sql
SELECT
    category,
    SUM(total_sale) AS Total_Sale,
    COUNT(*) AS Total_Orders
FROM [RetailSalesAnalysis]
GROUP BY category;
```

### Q4️⃣ Customer Age Analysis

```sql
SELECT AVG(age) AS Average_Age
FROM [RetailSalesAnalysis]
WHERE category = 'BEAUTY';
```

### Q5️⃣ High-value Transactions

```sql
SELECT *
FROM [RetailSalesAnalysis]
WHERE total_sale > 1000;
```

### Q6️⃣ Gender-based Sales

```sql
SELECT
    category,
    gender,
    COUNT(*) AS Total_Trans
FROM [RetailSalesAnalysis]
GROUP BY category, gender;
```

### Q7️⃣ Top 5 Customers

```sql
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS Total_Sale 
FROM [RetailSalesAnalysis]
GROUP BY customer_id
ORDER BY Total_Sale DESC;
```

### Q8️⃣ Unique Customers per Category

```sql
SELECT
    COUNT(DISTINCT transactions_id) AS Uniq_Cust,
    category
FROM [RetailSalesAnalysis]
GROUP BY category;
```

### Q9️⃣ Shift-based Order Analysis

```sql
WITH hourly_sale AS 
(
    SELECT *,
    CASE 
        WHEN DATEPART(HOUR, CONVERT(DATETIME, sale_time)) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, CONVERT(DATETIME, sale_time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift
    FROM [RetailSalesAnalysis]
)
SELECT Shift, COUNT(*) AS Total_Orders, SUM(total_sale) AS Total_Sales
FROM hourly_sale
GROUP BY Shift;
```

---

## 💡 Project Insights

### 1️⃣ Customer Insights

#### Customer Segmentation

* **Total Unique Customers**: Provides comprehensive understanding of customer base
* **Gender Distribution**: Reveals purchasing patterns across different genders
* **Age-based Analysis**: Highlights buying behaviors in specific categories like *Beauty*

---

### 2️⃣ Category Performance

#### Sales Analysis

* **Revenue Distribution**: Identifies top-performing product categories
* **Transaction Volumes**: Highlights which categories drive most business
* **Product Category Trends**:

  * Reveals most profitable product lines
  * Helps in inventory and marketing strategies

---

### 3️⃣ Sales Temporal Patterns

#### Shift-based Sales Breakdown

* **Morning Shift (< 12 PM)**

  * Lowest sales volume
  * Opportunity for targeted morning promotions
  * Potential for increasing customer engagement

* **Afternoon Shift (12–5 PM)**

  * Peak sales period
  * Highest transaction volumes
  * Prime time for retail operations

* **Evening Shift (> 5 PM)**

  * High-value transactions
  * Significant revenue generation
  * Strategic sales opportunities

---

### 4️⃣ High-Value Transaction Analysis

* **Premium Sales** (Transactions > $1000):

  * Indicate luxury product purchases
  * Highlight high-value customer segments
  * Useful for premium marketing strategies

---

### 5️⃣ Top Customer Insights

#### Customer Value Analysis

* **Top 5 Customers**

  * Identify most valuable customers
  * Potential for:

    * Personalized loyalty programs
    * Targeted marketing campaigns
    * VIP customer retention strategies

---

### 6️⃣ Key Business Metrics

| Metric                        | Significance                          |
| ----------------------------- | ------------------------------------- |
| **Total Unique Customers**    | Measures customer base growth         |
| **Sales by Category**         | Reveals revenue distribution          |
| **Average Transaction Value** | Indicates customer spending patterns  |
| **Top Customer Segments**     | Highlights high-value customer groups |

---

### 7️⃣ Strategic Recommendations

#### Business Optimization

1. **Inventory Management**

   * Focus on high-performing categories
   * Optimize stock levels
   * Reduce low-performing product lines

2. **Marketing Strategies**

   * Develop gender-specific campaigns
   * Create age-group targeted promotions
   * Personalize customer experiences

3. **Sales Enhancement**

   * Improve morning shift sales
   * Capitalize on afternoon peak hours
   * Develop evening sales strategies
