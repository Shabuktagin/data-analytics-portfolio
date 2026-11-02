# AI Assistance and Analyst Decision Log

## Purpose

This note records where AI assistance was used during preparation of this portfolio project and which analytical decisions must remain independently auditable. AI assistance supported drafting, explanation, code organization and dashboard planning; it is not evidence that a result is correct. The notebook, SQL checks and source data are the reproducible evidence.

## AI-assisted work products

- Organized the project into a reproducible Python → MySQL → Power BI workflow.
- Helped draft and explain Pandas cleaning, timestamp parsing, duration calculations, feature engineering and validation checks in the notebook.
- Helped structure MySQL import, typed-table, reporting-view and business-analysis SQL scripts.
- Helped formulate business questions, KPI definitions, data dictionary entries, quality documentation and executive insight summaries.
- Helped plan Power BI KPI cards, operational visuals, theme colors and DAX measures.
- Helped prepare the repository README and portfolio folder structure.

## Analyst verification requirements

Before publishing or changing any reported metric:

1. Re-run the notebook from the raw CSV and check its assertions.
2. Re-run the MySQL reconciliation queries against the typed table and reporting view.
3. Confirm that ticket counts use distinct `ticket_id` where appropriate.
4. Check that Boolean flags in Power BI are compared as `TRUE()` / `FALSE()` if imported as logical values.
5. Compare Power BI KPI totals with the validated SQL/Python totals under the same date filters.
6. Label averages and rates with their actual denominators and coverage.

## Verified data-quality decisions

- The source grain is one row per ticket. There are 4,000 records and 4,000 unique ticket IDs.
- 149 first-response values are missing.
- 143 first-response timestamps violate the chronology check because the recorded response occurs after the corresponding resolution timestamp. These records remain in the dataset but are excluded from the validated first-response metric.
- Therefore, valid first-response observations are `4,000 - 149 - 143 = 3,708`.
- 225 resolution timestamps are missing. This is not a reliable live open/closed status field.
- 2,774 CSAT ratings are missing; only 1,226 tickets have a valid rating (30.65% coverage).
- No invalid CSAT values and no negative first-response durations were found in the validated dataset.
- February 2024 is an incomplete month and should not be compared unqualified with full months.

## KPI interpretation rules

- Resolution rate is the share of tickets with a recorded resolution timestamp. It is not proof of the current ticket status or SLA attainment.
- First-response time is calculated only from the 3,708 validated observations.
- Median resolution duration is calculated from tickets with recorded resolution durations; it does not account for right-censoring of unresolved tickets.
- Reopening rate is the share of tickets marked reopened. It is not a direct measure of dissatisfaction.
- Average CSAT of approximately 3.99/5 applies only to 1,226 respondents, not all 4,000 tickets.
- There is no customer ID, so ticket counts must not be called unique customer counts.
- No staffing or authoritative SLA target is provided; queue and priority comparisons are descriptive, not causal or SLA-compliance claims.

## Repository transparency

The raw and cleaned CSV files, executed notebook, SQL scripts, DAX measures and supporting documentation are retained in the project so reviewers can inspect the work. The dataset is synthetic and its source page lists it as CC0 1.0 public domain. Do not upload database passwords, local connection strings containing credentials, private exports or personal customer information.
