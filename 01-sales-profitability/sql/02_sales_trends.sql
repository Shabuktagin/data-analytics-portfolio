-- =====================================
-- Sales Trend Analysis
-- Project: Sales & Profitability Analytics
-- =====================================

USE sales_analytics;


-- Yearly Sales and Profit Performance

SELECT
    `Order Year`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_profit
FROM superstore_cleaned
GROUP BY `Order Year`
ORDER BY `Order Year`;


SELECT
    `Order Year`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_cleaned
GROUP BY `Order Year`
ORDER BY `Order Year`;
