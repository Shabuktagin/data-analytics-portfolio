# Data Preparation & Feature Engineering

## Objective

Transform the raw dataset into an analysis-ready dataset while preserving the original data.

## Dataset Copy

A working copy was created:

Raw dataset:
df

Analysis dataset:
clean_df

This ensures the original data remains unchanged.

---

## Date Transformation

Converted:

- Order Date
- Ship Date

From:

Text format

To:

Datetime format

Purpose:

Enable time-based analysis such as:
- yearly trends
- monthly sales patterns
- shipping analysis

---

## Feature Engineering

### Shipping Days

Formula:

Ship Date - Order Date

Purpose:

Measure delivery performance and identify operational issues.

---

### Profit Margin

Formula:

Profit / Sales

Purpose:

Measure profitability efficiency.

Insight:

High sales volume does not always indicate business success. Some transactions generate revenue but negative profitability.

---

## AI-Assisted Workflow

AI was used to:
- suggest analytical features
- explain business relevance
- review documentation structure

All transformations were implemented and verified using Python/pandas.
