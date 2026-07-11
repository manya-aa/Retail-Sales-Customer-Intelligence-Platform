🛍️ Retail Sales & Customer Intelligence Dashboard
Project Overview

The Retail Sales & Customer Intelligence Dashboard is an end-to-end data analytics project developed using Python, PostgreSQL and Power BI to analyze retail sales performance, customer purchasing behavior, product performance, regional trends, and delivery efficiency.

The project demonstrates the complete data analytics workflow, from data cleaning and feature engineering to SQL analysis and interactive dashboard development, providing actionable business insights for data-driven decision-making.

🎯 Objectives
Analyze overall sales performance.
Identify top-performing products and categories.
Evaluate customer purchasing behavior.
Measure customer lifetime value and order frequency.
Analyze sales across regions, states, and cities.
Evaluate delivery performance.
Build interactive Power BI dashboards.
Generate business insights using SQL and DAX.
🛠️ Tools & Technologies
Python
Pandas
PostgreSQL
Power BI
DAX
Power Query
Git
GitHub
📂 Dataset

The dataset contains retail order transaction information, including:

Order ID
Order Date
Ship Date
Customer ID
Customer Name
Segment
Region
State
City
Product Name
Category
Sub-Category
Sales
Engineered Features
Delivery Days
Customer Lifetime Sales
Customer Order Count
Product Total Sales
Fast Delivery
Order Year
Order Quarter
Order Month
Order Weekday
Is Weekend
📊 Key Business Questions Answered
1. Executive Sales Analysis
What are the total sales, customers, and orders?
How have monthly sales changed over time?
What is the average order value?
2. Product Performance
Which products generate the highest sales?
Which categories and sub-categories perform best?
What are the top-selling products?
3. Customer Analysis
Who are the highest-value customers?
Which customer segment contributes the most revenue?
What is the average customer lifetime value?
Which customers place the highest number of orders?
4. Regional Analysis
Which regions, states, and cities generate the highest sales?
How does sales performance vary geographically?
5. Delivery Analysis
What is the average delivery time?
Which regions achieve the highest number of fast deliveries?
🗄️ SQL Analysis

The project includes SQL scripts for:

Database Schema Creation
Data Quality Checks
Data Exploration
Sales Analysis
Customer Analysis
Advanced Analysis
SQL Views
SQL Concepts Used
Aggregate Functions
GROUP BY
CASE Statements
Window Functions
Common Table Expressions (CTEs)
Joins
Views
Date Functions
Subqueries
📈 Dashboard Visualizations

The Power BI report contains three interactive dashboard pages.

Executive Dashboard
KPI Cards
Total Sales
Total Orders
Total Customers
Average Order Value
Average Delivery Days
Fast Delivery Orders
Visualizations
Monthly Sales Trend
Sales by Category
Sales by Region
Top 10 Products
Orders by Customer Segment
Customer Analysis Dashboard
KPI Cards
Total Customers
Average Customer Lifetime Sales
Average Customer Order Count
Average Order Value
Visualizations
Top Customers by Lifetime Sales
Customer Lifetime Sales by Segment
Customer Distribution by Region
Customer Order Analysis
Product & Regional Analytics Dashboard
Visualizations
Sales by Category
Sales by Sub-Category
Top 10 Products
Sales by State
Sales by City
Delivery Performance by Region
Fast Delivery Analysis
🔍 Key Insights
Technology and Office Supplies generate the highest overall sales.
A small group of repeat customers contributes a significant portion of total revenue.
Customer Lifetime Sales highlights the importance of customer retention.
Sales performance varies across regions, states, and cities.
Delivery efficiency differs across regions, indicating opportunities for logistics optimization.
Product sales are concentrated among a limited number of high-performing products.
📁 Project Structure
DA_PROJECT_1/
│
├── dashboard/
├── data/
├── notebooks/
├── screenshots/
├── sql/
├── src/
├── README.md
├── pyproject.toml
├── requirements.txt
└── main.py
🚀 How to Run the Project
1. Clone the Repository
git clone https://github.com/manya-aa/Retail-Sales-Customer-Intelligence-Platform.git
cd Retail-Sales-Customer-Intelligence Platform
2. Install Dependencies

Using uv
uv sync

3. Generate the Processed Dataset

Run the notebooks (or corresponding Python scripts) in the following order:

Data Cleaning
Exploratory Data Analysis
Feature Engineering

This generates:

cleaned_data.csv
featured_data.csv
4. Execute SQL Scripts

Run the SQL files in PostgreSQL in the following order:

schema.sql
data_quality.sql
data_exploration.sql
sales_analysis.sql
customer_analysis.sql
advanced_analysis.sql
views.sql
5. Open the Power BI Dashboard

Open the Power BI file inside the dashboard folder.

If Power BI asks for the data source, update the file path to featured_data.csv and refresh the report.

The dashboard contains three interactive pages:

Executive Dashboard
Customer Analysis Dashboard
Product & Regional Analytics Dashboard

👩‍💻 Author
Manya Chauhan