SELECT
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales;

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales;

SELECT
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM retail_sales;

SELECT
    ROUND(AVG(sales), 2) AS average_sales_per_transaction
FROM retail_sales;

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY category, sub_category
ORDER BY total_sales DESC;

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY state
ORDER BY total_sales DESC;

SELECT
    city,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 20;

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY segment
ORDER BY total_sales DESC;

SELECT
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

SELECT
    order_year,
    ROUND(SUM(sales), 2) AS yearly_sales
FROM retail_sales
GROUP BY order_year
ORDER BY order_year;

SELECT
    order_year,
    order_month_number,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM retail_sales
GROUP BY
    order_year,
    order_month_number,
    order_month
ORDER BY
    order_year,
    order_month_number;

SELECT
    order_quarter,
    ROUND(SUM(sales), 2) AS quarterly_sales
FROM retail_sales
GROUP BY order_quarter
ORDER BY order_quarter;

SELECT
    order_weekday,
    ROUND(SUM(sales), 2) AS sales
FROM retail_sales
GROUP BY order_weekday
ORDER BY sales DESC;

SELECT
    is_weekend,
    ROUND(SUM(sales), 2) AS sales
FROM retail_sales
GROUP BY is_weekend;

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales
LIMIT 10;

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;

SELECT
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM retail_sales;

SELECT
    fast_delivery,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY fast_delivery;

SELECT
    order_year,
    ROUND(SUM(sales), 2) AS yearly_sales,
    ROUND(
        SUM(SUM(sales)) OVER (
            ORDER BY order_year
        ),
        2
    ) AS running_total_sales
FROM retail_sales
GROUP BY order_year
ORDER BY order_year;

SELECT
    order_year,
    ROUND(SUM(sales), 2) AS yearly_sales,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM retail_sales
GROUP BY order_year;

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 /
        SUM(SUM(sales)) OVER (),
        2
    ) AS contribution_percentage
FROM retail_sales
GROUP BY category
ORDER BY contribution_percentage DESC;