/*==============================================================================
 Project      : Olist E-commerce Business Analysis
 Module       : 04 - Data Validation
 Author       : Avushatha TN

 Description  :
 Validate that all datasets have been imported successfully and that
 date/time columns were converted correctly.

==============================================================================*/

USE olist_ecommerce;

-- =============================================================================
-- 1. Verify Row Count for Each Table
-- =============================================================================

SELECT COUNT(*) AS Customers FROM dim_customers;

SELECT COUNT(*) AS Geolocations FROM dim_geolocation;

SELECT COUNT(*) AS Products FROM dim_products;

SELECT COUNT(*) AS Sellers FROM dim_sellers;

SELECT COUNT(*) AS Orders FROM fact_orders;

SELECT COUNT(*) AS Order_Items FROM fact_order_items;

SELECT COUNT(*) AS Payments FROM fact_payments;

SELECT COUNT(*) AS Reviews FROM fact_reviews;

SELECT COUNT(*) AS Product_Categories
FROM product_category_translation;

-- =============================================================================
-- 2. Check Primary Key Duplicates
-- =============================================================================

-- Customers
SELECT customer_id, COUNT(*)
FROM dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Products
SELECT product_id, COUNT(*)
FROM dim_products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Sellers
SELECT seller_id, COUNT(*)
FROM dim_sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- Orders
SELECT order_id, COUNT(*)
FROM fact_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Reviews
SELECT review_id, COUNT(*)
FROM fact_reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- =============================================================================
-- 3. Check NULL Values in Primary Keys
-- =============================================================================

SELECT COUNT(*) AS Null_Customers
FROM dim_customers
WHERE customer_id IS NULL;

SELECT COUNT(*) AS Null_Orders
FROM fact_orders
WHERE order_id IS NULL;

SELECT COUNT(*) AS Null_Products
FROM dim_products
WHERE product_id IS NULL;

SELECT COUNT(*) AS Null_Sellers
FROM dim_sellers
WHERE seller_id IS NULL;

SELECT COUNT(*) AS Null_Reviews
FROM fact_reviews
WHERE review_id IS NULL;

-- =============================================================================
-- 4. Validate Date Ranges
-- =============================================================================

SELECT
MIN(order_purchase_timestamp) AS First_Order,
MAX(order_purchase_timestamp) AS Last_Order
FROM fact_orders;

SELECT
MIN(order_approved_at) AS First_Approval,
MAX(order_approved_at) AS Last_Approval
FROM fact_orders;

SELECT
MIN(order_delivered_customer_date) AS First_Delivery,
MAX(order_delivered_customer_date) AS Last_Delivery
FROM fact_orders;

SELECT
MIN(review_creation_date) AS First_Review,
MAX(review_creation_date) AS Last_Review
FROM fact_reviews;

SELECT
MIN(review_answer_timestamp) AS First_Answer,
MAX(review_answer_timestamp) AS Last_Answer
FROM fact_reviews;

SELECT
MIN(shipping_limit_date) AS First_Shipping_Date,
MAX(shipping_limit_date) AS Last_Shipping_Date
FROM fact_order_items;

-- =============================================================================
-- 5. Check Missing Dates
-- =============================================================================

SELECT
SUM(order_purchase_timestamp IS NULL) AS Missing_Purchase_Date,
SUM(order_approved_at IS NULL) AS Missing_Approval_Date,
SUM(order_delivered_customer_date IS NULL) AS Missing_Delivery_Date
FROM fact_orders;

SELECT
SUM(review_creation_date IS NULL) AS Missing_Review_Date,
SUM(review_answer_timestamp IS NULL) AS Missing_Answer_Date
FROM fact_reviews;

SELECT
SUM(shipping_limit_date IS NULL) AS Missing_Shipping_Date
FROM fact_order_items;

-- =============================================================================
-- 6. Verify Review Scores
-- =============================================================================

SELECT
review_score,
COUNT(*) AS Reviews
FROM fact_reviews
GROUP BY review_score
ORDER BY review_score;

-- =============================================================================
-- 7. Verify Payment Types
-- =============================================================================

SELECT
payment_type,
COUNT(*) AS Payments
FROM fact_payments
GROUP BY payment_type
ORDER BY Payments DESC;

-- =============================================================================
-- 8. Verify Order Status
-- =============================================================================

SELECT
order_status,
COUNT(*) AS Orders
FROM fact_orders
GROUP BY order_status
ORDER BY Orders DESC;