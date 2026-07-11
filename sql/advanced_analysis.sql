WITH monthly_sales AS (
    SELECT
        order_year,
        order_month_number,
        order_month,
        SUM(sales) AS monthly_sales
    FROM retail_sales
    GROUP BY order_year, order_month_number, order_month
)
SELECT
    order_year,
    order_month,
    ROUND(monthly_sales,2) AS monthly_sales,
    ROUND(
        SUM(monthly_sales) OVER(
            ORDER BY order_year, order_month_number
        ),
        2
    ) AS running_total
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT
        order_year,
        order_month_number,
        order_month,
        SUM(sales) AS monthly_sales
    FROM retail_sales
    GROUP BY order_year, order_month_number, order_month
)
SELECT
    order_year,
    order_month,
    ROUND(monthly_sales,2) AS monthly_sales,
    ROUND(
        LAG(monthly_sales) OVER(
            ORDER BY order_year, order_month_number
        ),
        2
    ) AS previous_month_sales
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT
        order_year,
        order_month_number,
        order_month,
        SUM(sales) AS monthly_sales
    FROM retail_sales
    GROUP BY order_year, order_month_number, order_month
)
SELECT
    order_year,
    order_month,
    ROUND(monthly_sales,2) AS monthly_sales,
    ROUND(
        monthly_sales -
        LAG(monthly_sales) OVER(
            ORDER BY order_year, order_month_number
        ),
        2
    ) AS sales_difference
FROM monthly_sales;

WITH monthly_sales AS (
    SELECT
        order_year,
        order_month_number,
        order_month,
        SUM(sales) AS monthly_sales
    FROM retail_sales
    GROUP BY order_year, order_month_number, order_month
)
SELECT
    order_year,
    order_month,
    ROUND(monthly_sales,2) AS monthly_sales,
    ROUND(
        AVG(monthly_sales) OVER(
            ORDER BY order_year, order_month_number
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM monthly_sales;

SELECT
    category,
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROW_NUMBER() OVER(
        PARTITION BY category
        ORDER BY SUM(sales) DESC
    ) AS product_rank
FROM retail_sales
GROUP BY category, product_name;

SELECT *
FROM (
    SELECT
        category,
        product_name,
        ROUND(SUM(sales),2) AS total_sales,
        ROW_NUMBER() OVER(
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS product_rank
    FROM retail_sales
    GROUP BY category, product_name
) t
WHERE product_rank <= 3;

SELECT
    region,
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    DENSE_RANK() OVER(
        PARTITION BY region
        ORDER BY SUM(sales) DESC
    ) AS customer_rank
FROM retail_sales
GROUP BY region, customer_name;

SELECT
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    NTILE(4) OVER(
        ORDER BY MAX(customer_lifetime_sales) DESC
    ) AS customer_quartile
FROM retail_sales
GROUP BY customer_name;

SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 /
        SUM(SUM(sales)) OVER(),
        2
    ) AS contribution_percentage
FROM retail_sales
GROUP BY product_name
ORDER BY total_sales DESC;

WITH product_sales AS (
    SELECT
        product_name,
        SUM(sales) AS total_sales
    FROM retail_sales
    GROUP BY product_name
)
SELECT
    product_name,
    ROUND(total_sales,2) AS total_sales,
    ROUND(
        SUM(total_sales) OVER(
            ORDER BY total_sales DESC
        ),
        2
    ) AS cumulative_sales
FROM product_sales
ORDER BY total_sales DESC;

SELECT
    region,
    ROUND(AVG(delivery_days),2) AS average_delivery_days,
    RANK() OVER(
        ORDER BY AVG(delivery_days)
    ) AS delivery_rank
FROM retail_sales
GROUP BY region;

SELECT
    ship_mode,
    ROUND(AVG(delivery_days),2) AS average_delivery_days
FROM retail_sales
GROUP BY ship_mode
ORDER BY average_delivery_days;

SELECT
    customer_name,
    MAX(customer_lifetime_sales) AS lifetime_sales,
    CASE
        WHEN MAX(customer_lifetime_sales) >= 10000 THEN 'VIP'
        WHEN MAX(customer_lifetime_sales) >= 5000 THEN 'Premium'
        WHEN MAX(customer_lifetime_sales) >= 2000 THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM retail_sales
GROUP BY customer_name
ORDER BY lifetime_sales DESC;