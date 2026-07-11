SELECT
    COUNT(*) FILTER (WHERE row_id IS NULL) AS row_id_nulls,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS order_id_nulls,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS order_date_nulls,
    COUNT(*) FILTER (WHERE ship_date IS NULL) AS ship_date_nulls,
    COUNT(*) FILTER (WHERE ship_mode IS NULL) AS ship_mode_nulls,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
    COUNT(*) FILTER (WHERE customer_name IS NULL) AS customer_name_nulls,
    COUNT(*) FILTER (WHERE segment IS NULL) AS segment_nulls,
    COUNT(*) FILTER (WHERE country IS NULL) AS country_nulls,
    COUNT(*) FILTER (WHERE city IS NULL) AS city_nulls,
    COUNT(*) FILTER (WHERE state IS NULL) AS state_nulls,
    COUNT(*) FILTER (WHERE postal_code IS NULL) AS postal_code_nulls,
    COUNT(*) FILTER (WHERE region IS NULL) AS region_nulls,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,
    COUNT(*) FILTER (WHERE category IS NULL) AS category_nulls,
    COUNT(*) FILTER (WHERE sub_category IS NULL) AS sub_category_nulls,
    COUNT(*) FILTER (WHERE product_name IS NULL) AS product_name_nulls,
    COUNT(*) FILTER (WHERE sales IS NULL) AS sales_nulls
FROM retail_sales;

SELECT
    COUNT(*) AS duplicate_rows
FROM (
    SELECT *,
           COUNT(*) OVER (
               PARTITION BY
               row_id,
               order_id,
               order_date,
               ship_date,
               ship_mode,
               customer_id,
               customer_name,
               segment,
               country,
               city,
               state,
               postal_code,
               region,
               product_id,
               category,
               sub_category,
               product_name,
               sales,
               order_year,
               order_quarter,
               order_month,
               order_month_number,
               order_weekday,
               is_weekend,
               delivery_days,
               fast_delivery,
               customer_order_count,
               customer_lifetime_sales,
               product_total_sales
           ) AS cnt
    FROM retail_sales
) t
WHERE cnt > 1;

SELECT
    COUNT(*) AS invalid_ship_dates
FROM retail_sales
WHERE ship_date < order_date;

SELECT
    COUNT(*) AS invalid_sales
FROM retail_sales
WHERE sales <= 0;

SELECT
    COUNT(*) AS invalid_delivery_days
FROM retail_sales
WHERE delivery_days < 0;

SELECT
    MIN(sales) AS min_sales,
    MAX(sales) AS max_sales,
    AVG(sales) AS avg_sales,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sales) AS median_sales,
    STDDEV(sales) AS std_sales
FROM retail_sales;

SELECT
    MIN(delivery_days) AS min_delivery_days,
    MAX(delivery_days) AS max_delivery_days,
    AVG(delivery_days) AS avg_delivery_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY delivery_days) AS median_delivery_days,
    STDDEV(delivery_days) AS std_delivery_days
FROM retail_sales;

SELECT
    order_id,
    customer_name,
    sales
FROM retail_sales
WHERE sales >
(
    SELECT
        PERCENTILE_CONT(0.99)
        WITHIN GROUP (ORDER BY sales)
    FROM retail_sales
)
ORDER BY sales DESC;

SELECT
    product_name,
    delivery_days
FROM retail_sales
WHERE delivery_days >
(
    SELECT
        PERCENTILE_CONT(0.99)
        WITHIN GROUP (ORDER BY delivery_days)
    FROM retail_sales
)
ORDER BY delivery_days DESC;

SELECT
    order_year,
    COUNT(*) AS records
FROM retail_sales
GROUP BY order_year
ORDER BY order_year;

SELECT
    region,
    COUNT(*) AS records
FROM retail_sales
GROUP BY region
ORDER BY records DESC;

SELECT
    category,
    COUNT(*) AS records
FROM retail_sales
GROUP BY category
ORDER BY records DESC;