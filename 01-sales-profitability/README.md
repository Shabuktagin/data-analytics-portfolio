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




