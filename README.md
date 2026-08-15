# 🛍️ Retail Sales & Customer Intelligence Platform

An end-to-end data analytics project — from raw transaction data to an interactive Power BI dashboard — analyzing retail sales performance, customer behavior, product performance, regional trends, and delivery efficiency.

## Overview

The project covers the full analytics workflow: data cleaning and feature engineering in Python/Pandas, exploratory and business-question SQL analysis in PostgreSQL, and a 3-page interactive Power BI dashboard for decision-making.

**Dataset at a glance**

| Metric | Value |
|---|---|
| Transaction records | 9,800 |
| Unique orders | 4,922 |
| Unique customers | 793 |
| Unique products | 1,861 |
| Total sales | $2,261,536.78 |
| Average order value | $459.48 |
| Average delivery time | 3.96 days |
| Regions / states / cities | 4 / 49 / 529 |

## 🎯 Objectives

- Analyze overall sales performance and trends over time
- Identify top-performing products and categories
- Evaluate customer purchasing behavior and lifetime value
- Analyze sales across regions, states, and cities
- Evaluate delivery performance
- Build interactive Power BI dashboards with actionable KPIs

## 🛠️ Tools & Technologies

Python · Pandas · PostgreSQL · Power BI · DAX · Power Query · Git/GitHub

## 📂 Dataset

Retail order transaction data including order/ship dates, customer, segment, region/state/city, product, category, and sales amount, enriched with engineered features:

- Delivery Days, Fast Delivery flag
- Customer Lifetime Sales, Customer Order Count
- Product Total Sales, Product Order Count
- State/City Total Sales
- Order Year, Quarter, Month, Weekday, Is Weekend

## 🗄️ SQL Analysis

Seven SQL scripts (~1,000 lines total) cover the analytics workflow end-to-end:

`schema.sql` → `data_quality.sql` → `data_exploration.sql` → `sales_analysis.sql` → `customer_analysis.sql` → `advanced_analysis.sql` → `views.sql`

**SQL concepts used:** aggregate functions, `GROUP BY`, `CASE` statements, window functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`, `LAG`, running totals via `SUM() OVER`), CTEs, joins, views, date functions, subqueries.

Highlights from `advanced_analysis.sql`: a monthly MRR-style running-total trend, month-over-month deltas, a 3-month moving average, top-3-products-per-category ranking, customer quartile segmentation (`NTILE(4)`), revenue contribution percentage per product, and a VIP/Premium/Regular/Low-Value customer tiering built with `CASE`.

## 📈 Dashboard

Three interactive Power BI pages:

**Executive Dashboard** — Total Sales, Total Orders, Total Customers, Average Order Value, Average Delivery Days, Fast Delivery Orders; monthly sales trend, sales by category/region, top 10 products, orders by segment.

**Customer Analysis Dashboard** — Total Customers, Average Customer Lifetime Sales, Average Order Count/Value; top customers by lifetime sales, lifetime sales by segment, customer distribution by region.

**Product & Regional Analytics** — Sales by category/sub-category, top 10 products, sales by state/city, delivery performance and fast-delivery rate by region.

## 🔍 Key Insights

- Technology and Office Supplies generate the highest overall sales.
- A small group of repeat customers contributes a disproportionate share of total revenue — Customer Lifetime Sales highlights the value of retention.
- Sales performance varies meaningfully across regions, states, and cities.
- Delivery efficiency differs by region, pointing to logistics optimization opportunities.
- Product sales are concentrated among a limited number of high-performing SKUs.

## 📁 Project Structure

```
.
├── dashboard/        # Power BI .pbix report
├── data/             # raw.csv, cleaned_data.csv, featured_data.csv
├── notebooks/         # data_cleaning, eda, feature_engineering
├── screenshots/       # dashboard page exports
├── sql/               # schema, quality, exploration, analysis, views
├── src/da_project_1/  # reusable cleaning & feature-engineering functions
├── README.md
├── pyproject.toml
└── main.py
```

## 🚀 How to Run

**1. Clone the repository**
```bash
git clone https://github.com/manya-aa/Retail-Sales-Customer-Intelligence-Platform.git
cd Retail-Sales-Customer-Intelligence-Platform
```

**2. Install dependencies**
```bash
uv sync
```

**3. Generate the processed dataset**

Run the notebooks (or corresponding scripts) in order: Data Cleaning → Exploratory Data Analysis → Feature Engineering. This produces `cleaned_data.csv` and `featured_data.csv`.

**4. Execute SQL scripts**

In PostgreSQL, run in order: `schema.sql` → `data_quality.sql` → `data_exploration.sql` → `sales_analysis.sql` → `customer_analysis.sql` → `advanced_analysis.sql` → `views.sql`.

**5. Open the Power BI dashboard**

Open `dashboard/Retail_Sales_Customer_Intelligence.pbix`. If prompted for a data source, point it at `featured_data.csv` and refresh.

## 👩‍💻 Author

Manya Chauhan
