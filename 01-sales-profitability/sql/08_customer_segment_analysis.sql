-- =====================================
-- Customer Segment Profitability Analysis
-- Project: Sales & Profitability Analytics
-- =====================================

USE sales_analytics;


SELECT
    `Segment`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_profit,
    ROUND(
        SUM(`Profit`) / SUM(`Sales`) * 100,
        2
    ) AS profit_margin_percentage

FROM superstore_cleaned

GROUP BY `Segment`

ORDER BY total_profit DESC;
