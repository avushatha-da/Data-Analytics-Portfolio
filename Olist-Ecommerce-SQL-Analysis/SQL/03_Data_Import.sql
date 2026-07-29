/*
==============================================================
Project     : Olist E-Commerce Business Analysis
Module      : 03_Data_Import
Author      : Avushatha TN

Description :
This script imports cleaned CSV files into the database
tables using MySQL import commands. It populates all fact
and dimension tables with Olist e-commerce data.

Objective :
- Load CSV files into database tables.
- Populate fact and dimension tables.
- Ensure accurate data transfer.
- Prepare data for validation and analysis.
==============================================================
*/

Use olist_ecommerce;
TRUNCATE dim_customers;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/dim_customers.csv'
INTO TABLE dim_customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE dim_geolocation;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/dim_geolocation.csv'
INTO TABLE dim_geolocation
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE dim_products;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/dim_products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE dim_sellers;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/dim_sellers.csv'
INTO TABLE dim_sellers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE product_category_translation;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/product_category_translation.csv'
INTO TABLE product_category_translation
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE fact_payments;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/fact_payments.csv'
INTO TABLE fact_payments
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

TRUNCATE fact_orders;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/fact_orders.csv'
INTO TABLE fact_orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
order_id,
customer_id,
order_status,
@purchase,
@approved,
@carrier,
@delivered,
@estimated
)
SET
order_purchase_timestamp =
CASE
    WHEN TRIM(@purchase) = '' THEN NULL
    ELSE STR_TO_DATE(@purchase,'%d/%m/%Y %H:%i')
END,

order_approved_at =
CASE
    WHEN TRIM(@approved) = '' THEN NULL
    ELSE STR_TO_DATE(@approved,'%d/%m/%Y %H:%i')
END,

order_delivered_carrier_date =
CASE
    WHEN TRIM(@carrier) = '' THEN NULL
    ELSE STR_TO_DATE(@carrier,'%d/%m/%Y %H:%i')
END,

order_delivered_customer_date =
CASE
    WHEN TRIM(@delivered) = '' THEN NULL
    ELSE STR_TO_DATE(@delivered,'%d/%m/%Y %H:%i')
END,

order_estimated_delivery_date =
CASE
    WHEN TRIM(@estimated) = '' THEN NULL
    ELSE STR_TO_DATE(@estimated,'%d/%m/%Y %H:%i')
END;

TRUNCATE TABLE fact_order_items;
LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/fact_order_items.csv'
INTO TABLE fact_order_items
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
order_id,
order_item_id,
product_id,
seller_id,
@shipping,
price,
freight_value
)
SET shipping_limit_date = STR_TO_DATE(@shipping,'%d/%m/%Y %H:%i');

TRUNCATE TABLE fact_reviews;

LOAD DATA LOCAL INFILE
'C:/Users/USER/Documents/Data Analytics -Project 1 - Olist Ecommerce/03_SQL/fact_order_reviews.csv'
INTO TABLE fact_reviews
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
review_id,
order_id,
review_score,
review_comment_title,
review_comment_message,
@creation,
@answer
)
SET
review_creation_date =
CASE
WHEN @creation='' THEN NULL
ELSE STR_TO_DATE(@creation,'%d/%m/%Y %H:%i')
END,

review_answer_timestamp =
CASE
WHEN @answer='' THEN NULL
ELSE STR_TO_DATE(@answer,'%d/%m/%Y %H:%i')
END;
