## E-Commerce Sales Analytics Dashboard

## Project Overview

This project analyzes **540K+ e-commerce transactions** to uncover insights about **sales performance, customer behavior, and product demand**.

The project demonstrates an **end-to-end data analytics workflow** starting from raw data cleaning to interactive business intelligence visualization.

The goal is to transform raw transactional data into **actionable business insights using SQL, Excel, and Power BI**.

# Dataset

Dataset used in this project:

**Online Retail Dataset – UCI Machine Learning Repository**

Dataset Link:
[https://archive.ics.uci.edu/ml/datasets/online+retail](https://archive.ics.uci.edu/ml/datasets/online+retail)

Dataset contains:

* Invoice numbers
* Product descriptions
* Quantity purchased
* Transaction date
* Unit price
* Customer IDs
* Country of purchase

Total records analyzed:

**540,000+ transactions**

# Tools & Technologies

* **PostgreSQL** → Data cleaning & transformation
* **Excel** → Exploratory analysis & pivot tables
* **Power BI** → Dashboard & visualization
* **GitHub** → Project documentation & version control
  
# Project Workflow

## Step 1 – Data Collection

Download the **Online Retail Dataset** from UCI.

Import the dataset into **PostgreSQL** for analysis.

## Step 2 – Data Cleaning (SQL)

Data cleaning was performed using PostgreSQL to prepare the dataset for analysis.

Key steps:

* Convert text columns into numeric values
* Remove invalid records
* Convert date fields
* Create clean transaction table

Example SQL transformation:

```sql
CREATE TABLE transactions_clean AS
SELECT
invoice_no,
stock_code,
description,
quantity::INT AS quantity,
TO_TIMESTAMP(invoice_date,'MM/DD/YY HH24:MI') AS invoice_date,
unit_price::NUMERIC AS unit_price,
customer_id,
country
FROM transactions_raw
WHERE quantity::INT > 0
AND unit_price::NUMERIC > 0;
```

---

## Step 3 – Data Exploration (Excel)

Excel was used for quick exploratory analysis.

Tasks performed:

* Create revenue column
* Build pivot tables
* Analyze product sales
* Identify revenue trends

---

## Step 4 – Data Visualization (Power BI)

An **interactive dashboard** was built using Power BI to visualize business insights.

Dashboard components include:

* KPI metrics
* Sales trends
* Product performance
* Customer analysis
* Geographic sales distribution

---

# Dashboard Features

The Power BI dashboard includes:

* **Total Revenue**
* **Total Orders**
* **Average Order Value**
* **Monthly Revenue Trend**
* **Top Selling Products**
* **Revenue by Country**
* **Top Customers by Revenue**
* **Interactive Filters**

---

# Dashboard Preview

Click the image below to open the dashboard file.

```markdown
[![Dashboard Preview](dashboard/dashboard_screenshot.png)](dashboard/ecommerce_sales_dashboard.pbix)
```

# Key Insights

Some key findings from the analysis:

* Certain products dominate transaction volume
* A small group of customers generates a large share of revenue
* Sales show seasonal patterns
* Revenue distribution varies significantly across countries

---

# Skills Demonstrated

This project demonstrates the following analytics skills:

* Data cleaning and transformation
* SQL data analysis
* Business intelligence reporting
* Dashboard development
* Data storytelling
* End-to-end analytics workflow
