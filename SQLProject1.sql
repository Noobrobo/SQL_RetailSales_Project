--Retails Sales Analysis


-- Select all data from RetailSalesAnalysis
SELECT *
FROM [ RetailSalesAnalysis]

--Count the rows in the RetailSalesAnalysis

SELECT COUNT(*)
FROM [ RetailSalesAnalysis]

-- Find the null values in the table
SELECT * 
FROM [ RetailSalesAnalysis]
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL

--Delete the null values in the table
DELETE from [ RetailSalesAnalysis]
WHERE transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL

--Data Exploaration 

-- What are the sales we have?
SELECT COUNT(*)
FROM [ RetailSalesAnalysis]

-- How many uniq customers we have?
SELECT count(distinct (customer_id)) AS Total_Uniq_Customes
FROM [ RetailSalesAnalysis]

--How many uniq categery we have?
SELECT DISTINCT category AS Uniq_Category
FROM [ RetailSalesAnalysis]

-- Data analysis

-- My Analysis & Findings

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.9 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM [ RetailSalesAnalysis]
WHERE sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT *
FROM [ RetailSalesAnalysis]
WHERE category = 'Clothing'
	AND  quantiy >= 4
	AND MONTH(sale_date) = 11
	AND YEAR(sale_date) = 2022

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT
	category,
	SUM(total_sale) AS Total_Sale,
	COUNT(*) AS Total_Orders
FROM
[ RetailSalesAnalysis]
GROUP BY category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty'
SELECT
AVG(age) AS Average_age
FROM [ RetailSalesAnalysis]
WHERE category = 'BEAUTY'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT*
FROM [ RetailSalesAnalysis]
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT
category,
gender,
count(*) AS Total_Trans
FROM [ RetailSalesAnalysis]
GROUP BY category,
gender

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT TOP 5
	customer_id,
	sum(total_sale) as Total_sale 
FROM [ RetailSalesAnalysis]
GROUP BY customer_id
ORDER BY total_sale Desc

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.

select
count(distinct(transactions_id)) AS Uniq_Cust,
category
FROM [ RetailSalesAnalysis]
GROUP BY category

-- Q.9 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale AS 
(
SELECT *,
    CASE 
        WHEN DATEPART(HOUR, CONVERT(DATETIME, sale_time)) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, CONVERT(DATETIME, sale_time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift
FROM [ RetailSalesAnalysis]
)
SELECT shift,
COUNT(*) AS total_Orders
FROM hourly_sale
GROUP BY shift


