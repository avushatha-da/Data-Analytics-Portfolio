/*
==============================================================
Project     : Olist E-Commerce Business Analysis
Module      : 02_Table_Creation
Author      : Avushatha TN

Description :
This script creates all fact and dimension tables based on
the star schema design. It defines column names, data types,
primary keys, and relationships between tables.

Objective :
- Create fact and dimension tables.
- Define data types for each column.
- Establish primary and foreign key relationships.
- Build an optimized database structure for analytics.
==============================================================
*/

CREATE TABLE dim_customers(
customer_id VARCHAR(50) PRIMARY KEY,
customer_unique_id VARCHAR(50),
customer_zip_code_prefix INT,
customer_city VARCHAR(100),
customer_state CHAR(2)
);
CREATE TABLE dim_geolocation(
geolocation_zip_code_prefix INT,
geolocation_lat DECIMAL(10,8),
geolocation_lng DECIMAL(11,8),
geolocation_city VARCHAR(100),
geolocation_state CHAR(2)
);
CREATE TABLE dim_products(
product_id VARCHAR(50) PRIMARY KEY,
product_category_name VARCHAR(100),
product_name_lenght INT,
product_description_lenght INT,
product_photos_qty INT,
product_weight_g DECIMAL(10,2),
product_length_cm DECIMAL(10,2),
product_height_cm DECIMAL(10,2),
product_width_cm DECIMAL(10,2)
);
CREATE TABLE dim_sellers(
seller_id VARCHAR(50) PRIMARY KEY,
seller_zip_code_prefix INT,
seller_city VARCHAR(100),
seller_state CHAR(2)
);
CREATE TABLE fact_orders(
order_id VARCHAR(50) PRIMARY KEY,
customer_id VARCHAR(50),
order_status VARCHAR(30),
order_purchase_timestamp DATETIME,
order_approved_at DATETIME,
order_delivered_carrier_date DATETIME,
order_delivered_customer_date DATETIME,
order_estimated_delivery_date DATETIME
);
CREATE TABLE fact_order_items(
order_id VARCHAR(50),
order_item_id INT,
product_id VARCHAR(50),
seller_id VARCHAR(50),
shipping_limit_date DATETIME,
price DECIMAL(10,2),
freight_value DECIMAL(10,2),

PRIMARY KEY(order_id,order_item_id)
);
CREATE TABLE fact_payments(
order_id VARCHAR(50),
payment_sequential INT,
payment_type VARCHAR(30),
payment_installments INT,
payment_value DECIMAL(10,2)
);
CREATE TABLE fact_reviews(
review_id VARCHAR(50) PRIMARY KEY,
order_id VARCHAR(50),
review_score INT,
review_comment_title TEXT,
review_comment_message TEXT,
review_creation_date DATETIME,
review_answer_timestamp DATETIME
);
CREATE TABLE product_category_translation(
product_category_name VARCHAR(100),
product_category_name_english VARCHAR(100)
);