SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

SELECT
    segment,
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
GROUP BY segment
ORDER BY total_customers DESC;

SELECT
    region,
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
GROUP BY region
ORDER BY total_customers DESC;

SELECT
    state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales
GROUP BY state
ORDER BY total_customers DESC;

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    ROUND(AVG(sales), 2) AS average_order_value
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY average_order_value DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY lifetime_sales DESC
LIMIT 10;

SELECT
    ROUND(AVG(customer_lifetime_sales), 2) AS average_customer_lifetime_sales
FROM (
    SELECT
        customer_id,
        MAX(customer_lifetime_sales) AS customer_lifetime_sales
    FROM retail_sales
    GROUP BY customer_id
) t;

SELECT
    customer_id,
    customer_name,
    MAX(customer_order_count) AS total_orders
FROM retail_sales
GROUP BY customer_id, customer_name
HAVING MAX(customer_order_count) = 1;

SELECT
    customer_id,
    customer_name,
    MAX(customer_order_count) AS total_orders
FROM retail_sales
GROUP BY customer_id, customer_name
HAVING MAX(customer_order_count) > 1
ORDER BY total_orders DESC;

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
GROUP BY customer_id, customer_name
ORDER BY lifetime_sales DESC;

SELECT
    customer_id,
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    RANK() OVER(
        ORDER BY MAX(customer_lifetime_sales) DESC
    ) AS customer_rank
FROM retail_sales
GROUP BY customer_id, customer_name;

SELECT
    customer_id,
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    DENSE_RANK() OVER(
        ORDER BY MAX(customer_lifetime_sales) DESC
    ) AS customer_rank
FROM retail_sales
GROUP BY customer_id, customer_name;

SELECT
    customer_id,
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    ROW_NUMBER() OVER(
        ORDER BY MAX(customer_lifetime_sales) DESC
    ) AS customer_rank
FROM retail_sales
GROUP BY customer_id, customer_name;

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 /
        SUM(SUM(sales)) OVER(),
        2
    ) AS contribution_percentage
FROM retail_sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC;

WITH customer_sales AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY customer_id, customer_name
)

SELECT
    customer_id,
    customer_name,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        SUM(total_sales) OVER(
            ORDER BY total_sales DESC
        ),
        2
    ) AS cumulative_sales
FROM customer_sales
ORDER BY total_sales DESC;