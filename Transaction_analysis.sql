/*
Project: E-commerce Transaction Data Analysis
Dataset: Online Retail Dataset
Goal: Clean and analyze transaction data to identify revenue trends and sales patterns
Tool: PostgreSQL (pgAdmin)
*/

-- Create Clean Dataset

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity::INT AS quantity,
    TO_TIMESTAMP(invoice_date, 'MM/DD/YY HH24:MI') AS invoice_date,
    unit_price::NUMERIC AS unit_price,
    customer_id,
    country
FROM transactions_raw
WHERE quantity::INT > 0
AND unit_price::NUMERIC > 0;

-- Check Clean Data Size

SELECT COUNT(*) AS total_clean_transactions
FROM transactions_clean;

-- Total Revenue

SELECT
SUM(quantity * unit_price) AS total_revenue
FROM transactions_clean;

-- Daily Revenue Trend

SELECT
DATE(invoice_date) AS order_date,
SUM(quantity * unit_price) AS daily_revenue
FROM transactions_clean
GROUP BY DATE(invoice_date)
ORDER BY order_date;

-- Top Selling Products

SELECT
description,
SUM(quantity) AS total_units_sold
FROM transactions_clean
GROUP BY description
ORDER BY total_units_sold DESC
LIMIT 10;

-- Revenue by Country

SELECT
country,
SUM(quantity * unit_price) AS total_revenue
FROM transactions_clean
GROUP BY country
ORDER BY total_revenue DESC;

-- Top Customers by Spending

SELECT
customer_id,
SUM(quantity * unit_price) AS customer_revenue
FROM transactions_clean
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 10;

-- Average Order Value

SELECT
AVG(quantity * unit_price) AS avg_order_value
FROM transactions_clean;

-- Detect Large Transactions

SELECT *
FROM transactions_clean
WHERE quantity > 500
ORDER BY quantity DESC;

-- Monthly Revenue Trend

SELECT
DATE_TRUNC('month', invoice_date) AS month,
SUM(quantity * unit_price) AS monthly_revenue
FROM transactions_clean
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month;

-- Monthly Revenue Trend

SELECT
DATE_TRUNC('month', invoice_date) AS month,
SUM(quantity * unit_price) AS monthly_revenue
FROM transactions_clean
GROUP BY DATE_TRUNC('month', invoice_date)
ORDER BY month;

-- STEP 12: Customer Purchase Frequency

SELECT
customer_id,
COUNT(invoice_no) AS number_of_orders
FROM transactions_clean
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY number_of_orders DESC
LIMIT 10;

-- Customer RFM Analysis

SELECT
customer_id,
MAX(invoice_date) AS last_purchase_date,
COUNT(DISTINCT invoice_no) AS purchase_frequency,
SUM(quantity * unit_price) AS total_spent
FROM transactions_clean
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 20;

SELECT * FROM transactions_clean;