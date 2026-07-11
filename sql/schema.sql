CREATE TABLE retail_sales (
    row_id INTEGER,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),

    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),

    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),

    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,

    sales NUMERIC(10,2),

    order_year SMALLINT,
    order_quarter VARCHAR(10),
    order_month VARCHAR(20),
    order_month_number SMALLINT,
    order_weekday VARCHAR(15),
    is_weekend BOOLEAN,

    delivery_days INTEGER,
    fast_delivery BOOLEAN,

    customer_order_count INTEGER,
    customer_lifetime_sales NUMERIC(14,2),
    product_total_sales NUMERIC(14,2)
);