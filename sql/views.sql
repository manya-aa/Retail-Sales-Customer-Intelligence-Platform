
CREATE VIEW vw_sales_summary AS
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT product_id) AS total_products,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_sales,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM retail_sales;

CREATE VIEW vw_monthly_sales AS
SELECT
    order_year,
    order_month_number,
    order_month,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY
    order_year,
    order_month_number,
    order_month
ORDER BY
    order_year,
    order_month_number;

CREATE VIEW vw_category_sales AS
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY
    category,
    sub_category;

CREATE VIEW vw_region_sales AS
SELECT
    region,
    state,
    city,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY
    region,
    state,
    city;

CREATE VIEW vw_customer_summary AS
SELECT
    customer_id,
    customer_name,
    segment,
    MAX(customer_order_count) AS total_orders,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS average_order_value
FROM retail_sales
GROUP BY
    customer_id,
    customer_name,
    segment;

CREATE VIEW vw_product_summary AS
SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY
    product_id,
    product_name,
    category,
    sub_category;

CREATE VIEW vw_shipping_summary AS
SELECT
    ship_mode,
    ROUND(AVG(delivery_days), 2) AS average_delivery_days,
    COUNT(*) AS total_shipments,
    SUM(CASE WHEN fast_delivery THEN 1 ELSE 0 END) AS fast_deliveries
FROM retail_sales
GROUP BY
    ship_mode;

CREATE VIEW vw_customer_segments AS
SELECT
    customer_id,
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    CASE
        WHEN MAX(customer_lifetime_sales) >= 10000 THEN 'VIP'
        WHEN MAX(customer_lifetime_sales) >= 5000 THEN 'Premium'
        WHEN MAX(customer_lifetime_sales) >= 2000 THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM retail_sales
GROUP BY
    customer_id,
    customer_name;

CREATE VIEW vw_product_rankings AS
SELECT
    product_id,
    product_name,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    DENSE_RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM retail_sales
GROUP BY
    product_id,
    product_name,
    category;

CREATE VIEW vw_daily_sales AS
SELECT
    order_date,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY
    order_date;

    SELECT * FROM vw_sales_summary;

SELECT * FROM vw_monthly_sales LIMIT 10;

SELECT * FROM vw_category_sales LIMIT 10;

SELECT * FROM vw_region_sales LIMIT 10;

SELECT * FROM vw_customer_summary LIMIT 10;

SELECT * FROM vw_product_summary LIMIT 10;

SELECT * FROM vw_shipping_summary;

SELECT * FROM vw_customer_segments LIMIT 10;

SELECT * FROM vw_product_rankings LIMIT 10;

SELECT * FROM vw_daily_sales LIMIT 10;