-- =====================================
-- Executive KPI Analysis
-- Project: Sales & Profitability Analytics
-- =====================================

USE sales_analytics;


-- 1. Total Sales

SELECT
    ROUND(SUM(`Sales`),2) AS total_sales
FROM superstore_cleaned;


-- 2. Total Profit

SELECT
    ROUND(SUM(`Profit`),2) AS total_profit
FROM superstore_cleaned;


-- 3. Total Orders

SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM superstore_cleaned;


-- 4. Overall Profit Margin

SELECT
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_cleaned;


-- 5. Average Order Value

SELECT
    ROUND(
        SUM(`Sales`) / COUNT(DISTINCT `Order ID`),
        2
    ) AS average_order_value
FROM superstore_cleaned;


-- 6. Average Discount

SELECT
    ROUND(
        AVG(`Discount`) * 100,
        2
    ) AS average_discount_percentage
FROM superstore_cleaned;


-- 7. Average Shipping Days

SELECT
    ROUND(
        AVG(`Shipping Days`),
        2
    ) AS average_shipping_days
FROM superstore_cleaned;
