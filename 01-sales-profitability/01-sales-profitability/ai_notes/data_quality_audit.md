# Data Quality Audit

## Dataset Overview

- Records: 9,994
- Columns: 21

## Duplicate Analysis

- Exact duplicate rows: 0

## Missing Value Analysis

- No missing values detected.
- Dataset completeness: 100%

## Data Type Issues

- Order Date and Ship Date are stored as text.
- Conversion to datetime is required.

## Profit Analysis

- Average profit: 28.66
- Minimum profit: -6599.978
- Maximum profit: 8399.976

Large profit variation suggests further investigation into loss-making transactions.

## Discount Analysis

- Average discount: 15.6%
- Median discount: 20%
- Maximum discount: 80%

High discounts require investigation to understand their relationship with profitability.

## AI-Assisted Review

AI was used to:
- organize audit findings
- suggest investigation questions
- review analytical reasoning

All conclusions were verified using pandas outputs.
