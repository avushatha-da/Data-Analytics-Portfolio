/*==============================================================================
 Project      : Olist E-commerce Business Analysis
 Module       : 05 - Business Understanding
 Author       : Avushatha TN
 Description  : This script answers high-level business questions to understand
                the size, performance, and operational overview of the Olist
                e-commerce marketplace.

 Objective:
    • Understand overall business scale
    • Measure marketplace activity
    • Identify key business KPIs
    • Prepare for Exploratory Data Analysis (EDA)
==============================================================================*/

/*------------------------------------------------------------------------------
 KPI            : Total Customers

 Business Question:
    How many customers have registered on the marketplace?

 Business Value:
    Helps measure the size of the customer base.

 Expected Output:
    One row containing the total number of customers.
------------------------------------------------------------------------------*/

SELECT
    COUNT(*) AS Total_Customers
FROM dim_customers;

/*------------------------------------------------------------------------------
 KPI            : Total Orders

 Business Question:
    How many orders have been placed?

 Business Value:
    Measures overall marketplace activity.

 Expected Output:
    Total number of orders.
------------------------------------------------------------------------------*/

SELECT
    COUNT(*) AS Total_Orders
FROM fact_orders;

/*------------------------------------------------------------------------------
 KPI            : Total Products

 Business Question:
    How many products are available?

 Business Value:
    Measures catalogue size.

 Expected Output:
    Total number of products.
------------------------------------------------------------------------------*/

SELECT
    COUNT(*) AS Total_Products
FROM dim_products;

/*------------------------------------------------------------------------------
 KPI            : Total Sellers

 Business Question:
    How many sellers are active on the platform?

 Business Value:
    Indicates marketplace supply.

 Expected Output:
    Total number of sellers.
------------------------------------------------------------------------------*/

SELECT
    COUNT(*) AS Total_Sellers
FROM dim_sellers;

/*------------------------------------------------------------------------------
 KPI            : Total Revenue

 Business Question:
    What is the total revenue generated?

 Business Value:
    Measures overall sales performance.

 Expected Output:
    Total payment value.
------------------------------------------------------------------------------*/

SELECT
    ROUND(SUM(payment_value),2) AS Total_Revenue
FROM fact_payments;

/*------------------------------------------------------------------------------
 KPI            : Average Order Value

 Business Question:
    What is the average payment amount per order?

 Business Value:
    Measures customer spending behaviour.

 Expected Output:
    Average payment value.
------------------------------------------------------------------------------*/

SELECT
    ROUND(AVG(payment_value),2) AS Average_Order_Value
FROM fact_payments;

/*------------------------------------------------------------------------------
 KPI            : Customer Reviews

 Business Question:
    How many customer reviews have been submitted?

 Business Value:
    Measures customer engagement.

 Expected Output:
    Total review records.
------------------------------------------------------------------------------*/

SELECT
    COUNT(*) AS Total_Reviews
FROM fact_reviews;

/*------------------------------------------------------------------------------
 KPI            : Review Score Distribution

 Business Question:
    How are customer reviews distributed across different review scores?

 Business Value:
    Helps understand customer satisfaction by analysing the frequency of
    each review score.

 Expected Output:
    Number of reviews for each review score.
------------------------------------------------------------------------------*/

SELECT
    review_score,
    COUNT(*) AS Total_Reviews
FROM fact_reviews
GROUP BY review_score
ORDER BY review_score;

/*------------------------------------------------------------------------------
 KPI            : Average Review Score

 Business Question:
    What is the overall customer satisfaction rating?

 Business Value:
    Measures customer experience.

 Expected Output:
    Average review score.
------------------------------------------------------------------------------*/

SELECT
    ROUND(AVG(review_score),2) AS Average_Review_Score
FROM fact_reviews;

/*------------------------------------------------------------------------------
 KPI            : Order Status Distribution

 Business Question:
    How are orders distributed across different statuses?

 Business Value:
    Helps identify fulfilment performance.

 Expected Output:
    Number of orders by status.
------------------------------------------------------------------------------*/

SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM fact_orders
GROUP BY order_status
ORDER BY Total_Orders DESC;

/*------------------------------------------------------------------------------
 KPI            : Payment Method Analysis

 Business Question:
    Which payment methods do customers prefer?

 Business Value:
    Helps understand customer payment behaviour.

 Expected Output:
    Number of payments by payment type.
------------------------------------------------------------------------------*/

SELECT
    payment_type,
    COUNT(*) AS Total_Transactions
FROM fact_payments
GROUP BY payment_type
ORDER BY Total_Transactions DESC;

/*------------------------------------------------------------------------------
 KPI            : Order Purchase Date Range

 Business Question:
    What is the time period covered by customer orders?

 Business Value:
    Identifies the first and last order dates to understand the business
    timeline available for analysis.

 Expected Output:
    First and last purchase dates.
------------------------------------------------------------------------------*/

SELECT
    MIN(order_purchase_timestamp) AS First_Order,
    MAX(order_purchase_timestamp) AS Last_Order
FROM fact_orders;

/*------------------------------------------------------------------------------
 KPI            : Shipping Limit Date Range

 Business Question:
    What is the range of shipping limit dates recorded in the dataset?

 Business Value:
    Helps understand the shipping schedule and delivery commitments.

 Expected Output:
    Earliest and latest shipping limit dates.
------------------------------------------------------------------------------*/

SELECT
    MIN(shipping_limit_date) AS First_Shipping_Date,
    MAX(shipping_limit_date) AS Last_Shipping_Date
FROM fact_order_items;

/*------------------------------------------------------------------------------
 KPI            : Review Score Range

 Business Question:
    What are the highest and lowest review scores received?

 Business Value:
    Confirms the review rating scale used by the marketplace.

 Expected Output:
    Minimum and maximum review scores.
------------------------------------------------------------------------------*/

SELECT
    MIN(review_score) AS Minimum_Review,
    MAX(review_score) AS Maximum_Review
FROM fact_reviews;

/*------------------------------------------------------------------------------
 KPI            : Average Freight Cost

 Business Question:
    What is the average freight cost charged per order item?

 Business Value:
    Helps understand the average shipping cost incurred on customer orders.

 Expected Output:
    Average freight cost.
------------------------------------------------------------------------------*/

SELECT
    ROUND(AVG(freight_value),2) AS Average_Freight_Cost
FROM fact_order_items;

/*------------------------------------------------------------------------------
 KPI            : Average Product Price

 Business Question:
    What is the average selling price of products?

 Business Value:
    Measures the average product selling price across all order items.

 Expected Output:
    Average product price.
------------------------------------------------------------------------------*/

SELECT
    ROUND(AVG(price),2) AS Average_Product_Price
FROM fact_order_items;




