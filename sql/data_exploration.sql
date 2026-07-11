SELECT *
FROM retail_sales
LIMIT 10;

SELECT *
FROM retail_sales
ORDER BY row_id DESC
LIMIT 10;

SELECT
    COUNT(*) AS total_records
FROM retail_sales;

SELECT
    COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_name = 'retail_sales';

SELECT
    ordinal_position,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'retail_sales'
ORDER BY ordinal_position;

SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM retail_sales;

SELECT DISTINCT category
FROM retail_sales
ORDER BY category;

SELECT DISTINCT sub_category
FROM retail_sales
ORDER BY sub_category;

SELECT DISTINCT segment
FROM retail_sales
ORDER BY segment;

SELECT DISTINCT region
FROM retail_sales
ORDER BY region;

SELECT DISTINCT state
FROM retail_sales
ORDER BY state;

SELECT DISTINCT city
FROM retail_sales
ORDER BY city;

SELECT DISTINCT ship_mode
FROM retail_sales
ORDER BY ship_mode;

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT customer_name) AS customer_names,
    COUNT(DISTINCT product_id) AS total_products,
    COUNT(DISTINCT product_name) AS product_names,
    COUNT(DISTINCT category) AS total_categories,
    COUNT(DISTINCT sub_category) AS total_subcategories,
    COUNT(DISTINCT state) AS total_states,
    COUNT(DISTINCT city) AS total_cities,
    COUNT(DISTINCT region) AS total_regions
FROM retail_sales;

SELECT
    order_year,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY order_year
ORDER BY order_year;

SELECT
    order_quarter,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY order_quarter
ORDER BY order_quarter;

SELECT
    order_month_number,
    order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY order_month_number, order_month
ORDER BY order_month_number;

SELECT
    order_weekday,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY order_weekday
ORDER BY total_orders DESC;

SELECT
    is_weekend,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY is_weekend;

SELECT
    ship_mode,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_orders DESC;

SELECT
    region,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY region
ORDER BY total_orders DESC;

SELECT
    category,
    COUNT(*) AS total_products
FROM retail_sales
GROUP BY category
ORDER BY total_products DESC;

SELECT
    sub_category,
    COUNT(*) AS total_products
FROM retail_sales
GROUP BY sub_category
ORDER BY total_products DESC;

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS customers
FROM retail_sales
GROUP BY segment
ORDER BY customers DESC;

SELECT
    ROUND(MIN(sales), 2) AS minimum_sale,
    ROUND(MAX(sales), 2) AS maximum_sale,
    ROUND(AVG(sales), 2) AS average_sale,
    ROUND(STDDEV(sales), 2) AS standard_deviation
FROM retail_sales;

SELECT
    MIN(delivery_days) AS minimum_delivery_days,
    MAX(delivery_days) AS maximum_delivery_days,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM retail_sales;

SELECT
    fast_delivery,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY fast_delivery;

SELECT
    customer_name,
    customer_order_count
FROM retail_sales
ORDER BY customer_order_count DESC
LIMIT 10;

SELECT
    product_name,
    product_total_sales
FROM retail_sales
ORDER BY product_total_sales DESC
LIMIT 10;