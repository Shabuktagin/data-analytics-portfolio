-- =====================================
-- Product Profitability Analysis
-- Project: Sales & Profitability Analytics
-- =====================================

USE sales_analytics;


-- Top 10 Most Profitable Products

SELECT
    `Product Name`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_profit

FROM superstore_cleaned

GROUP BY `Product Name`

ORDER BY total_profit DESC

LIMIT 10;
