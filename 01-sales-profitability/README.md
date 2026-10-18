# Superstore Sales & Profitability Analysis

**End-to-End Data Analytics Portfolio Project**

**Tools:** Python (Pandas) | MySQL | Power BI | DAX | GitHub  
**Analysis Period:** 2014–2017  
**Dataset:** Sample Superstore  
**Records Analyzed:** 9,994

## Project Overview

This project analyzes historical retail sales data to evaluate revenue performance, profitability, regional trends, category performance, and the relationship between discounting and profit margins.

The goal is to move beyond descriptive reporting and identify actionable business opportunities supported by data.

The project follows an end-to-end analytics workflow:

**Data Exploration → Data Cleaning with Python → SQL Validation → Power BI Dashboard → Executive Business Insights**

## Executive Dashboard

![Superstore Executive Dashboard](images/superstore_executive_dashboard.png)

The interactive Power BI dashboard includes:

- Executive KPIs covering total sales, profit, profit margin, and distinct orders.
- Annual sales and profit trends.
- Regional sales comparisons.
- Category-level profit margin analysis.
- Profitability analysis across discount bands.
- Interactive Year and Region slicers, contextual tooltips, and a Reset Filters button.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Overall Profit Margin | 12.47% |
| Distinct Orders | 5,009 |
| Records Analyzed | 9,994 |

*All KPIs reflect the complete 2014–2017 dataset with no dashboard filters applied.*

## Data Preparation & Quality Assurance

### Python Data Cleaning

Python and Pandas were used to inspect, prepare, and validate the Sample Superstore dataset before analysis.

Key preparation tasks included:

- Loaded the source CSV using the appropriate text encoding.
- Converted `Order Date` and `Ship Date` into date formats.
- Created analytical fields including `Shipping Days`, `Order Year`, `Order Month`, `Order Quarter`, and row-level `Profit Margin`.
- Checked record counts, duplicate rows, and missing values in key financial columns.
- Exported a cleaned dataset for database integration.

**Validation Results**

| Validation Check | Result |
|---|---:|
| Source Records | 9,994 |
| Cleaned Records | 9,994 |
| Cleaned Columns | 26 |
| Duplicate Complete Records | 0 |
| Missing Sales Values | 0 |
| Missing Profit Values | 0 |

### SQL Integration and Data Validation

MySQL was used to store the cleaned dataset and validate business metrics.

During the initial import, the MySQL Workbench Table Data Import Wizard loaded only **9,694 of 9,994 records**, leaving **300 records missing**.

Investigation identified embedded quotation marks in product names among the affected records, highlighting the importance of validating CSV imports rather than assuming that a successful import message guarantees complete data.

The dataset was subsequently imported using `LOAD DATA LOCAL INFILE`, resulting in the complete **9,994-record** table.

The validated MySQL table was:

` sales_analytics.superstore_cleaned_v2 `

**Cross-Tool Validation**

| Metric | Validated Result |
|---|---:|
| Total Records | 9,994 |
| Total Sales | $2,297,200.86 |
| Total Profit | $286,397.02 |
| Distinct Orders | 5,009 |
| Overall Profit Margin | 12.47% |

The final SQL totals were reconciled with Python calculations before building the Power BI dashboard.

### Data Quality Lesson

The initial import discrepancy demonstrated that **data validation is a necessary part of the analytics workflow**.

Row counts, financial totals, and data consistency should be verified across tools before results are used for dashboards or business decisions.


## Analytical Methodology

The analysis focuses on four business questions:

1. How have sales and profitability changed over time?
2. Which regions and product categories contribute most to financial performance?
3. How does profitability differ across discount levels?
4. Where do strong sales figures conceal weaker profit margins?

### KPI Definitions

The following measures were developed in Power BI using DAX:

| KPI | Calculation | Business Purpose |
|---|---|---|
| Total Sales | Sum of Sales | Measures revenue performance |
| Total Profit | Sum of Profit | Measures absolute profitability |
| Profit Margin % | Total Profit ÷ Total Sales × 100 | Evaluates profitability relative to revenue |
| Total Orders | Distinct count of Order ID | Measures the number of unique orders |

Profit Margin is calculated using aggregated profit divided by aggregated sales, rather than averaging individual row-level profit margins.

The dataset contains **9,994 order-line records** representing **5,009 unique orders**. This distinction is important when analyzing discount behavior and calculating order counts.

### Discount Band Analysis

To evaluate profitability across discount levels, transactions were grouped into five categories:

| Discount Band | Definition |
|---|---|
| 0% (None) | No discount |
| 1–10% | Discount greater than 0% and up to 10% |
| 11–20% | Discount greater than 10% and up to 20% |
| 21–30% | Discount greater than 20% and up to 30% |
| Over 30% | Discount greater than 30% |

Profit and profit margin were calculated for each group to identify potentially unprofitable discount patterns.

These comparisons are descriptive and do not establish causation.

---

## Power BI Dashboard Development

### Dashboard Design

A single-page, 16:9 executive dashboard was developed in Power BI Desktop using the validated MySQL dataset.

The dashboard was designed to prioritize business readability, consistent formatting, and interactive exploration.

**Dashboard Components**

| Component | Business Purpose |
|---|---|
| Executive KPI Cards | Summarize sales, profit, profit margin, and unique orders |
| Sales & Profit Trend | Compare annual revenue and profit performance |
| Sales by Region | Identify regional revenue contributions |
| Profit Margin by Category | Compare profitability across major product categories |
| Profit by Discount Band | Highlight profitable and loss-making discount groups |

### Interactive Features

- **Year slicer:** Filters dashboard performance by reporting year.
- **Region slicer:** Supports geographical performance comparisons.
- **Reset Filters button:** Restores the dashboard to its unfiltered default view using a Power BI bookmark.
- **Contextual tooltips:** Provide additional sales, profit, and profit margin information without cluttering the visuals.
- **Cross-filtering:** Allows users to explore relationships between business dimensions.

### Visual Design Principles

A consistent visual language was applied throughout the dashboard:

| Element | Color | Meaning |
|---|---|---|
| Sales | Blue `#2563EB` | Revenue performance |
| Positive Profit | Teal `#0F766E` | Profitable performance |
| Negative Profit | Muted Red `#C2414B` | Financial losses |
| Background | Light Gray | Reduced visual clutter |

The design emphasizes clear KPI hierarchy, readable charts, restrained colors, and consistent spacing.

### Data Reliability

The Power BI report was built using the complete, validated MySQL table `sales_analytics.superstore_cleaned_v2`.

Before finalizing the dashboard, its unfiltered totals were reconciled with the Python and SQL results:

**$2,297,200.86 in Sales, $286,397.02 in Profit, a 12.47% Profit Margin, and 5,009 distinct Orders.**

This cross-tool validation helps ensure that the reported business insights are based on complete and consistent data.



