-- =====================================
-- Loss-Making Subcategory Analysis
-- Project: Sales & Profitability Analytics
-- =====================================

USE sales_analytics;


SELECT
    `Sub-Category`,
    ROUND(SUM(`Sales`),2) AS total_sales,
    ROUND(SUM(`Profit`),2) AS total_loss

FROM superstore_cleaned

GROUP BY `Sub-Category`

HAVING SUM(`Profit`) < 0

ORDER BY total_loss ASC;
