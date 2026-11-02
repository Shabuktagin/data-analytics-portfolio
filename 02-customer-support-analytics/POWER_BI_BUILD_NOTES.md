# Power BI Build Notes — Working Record

## Current model

- Imported model table name in the report: `Tickets`.
- The source SQL view is `vw_customer_support_powerbi` in database `customer_support_analytics`.
- In the current Power BI model, `resolution_recorded`, `reopened`, `response_after_resolution_flag` and `csat_invalid_flag` were imported as Boolean fields. Use `TRUE()` and `FALSE()` in DAX comparisons.

## KPI cards and validated values

| KPI | Expected value | Unit / interpretation |
|---|---:|---|
| Total Tickets | 4,000 | Tickets |
| Resolution Rate | 94.38% | Recorded resolution timestamps / total tickets |
| Median First Response | 80 | Minutes, valid observations only |
| Median Resolution Hours | 24.63 | Hours, recorded resolution durations |
| Reopening Rate | 7.13% | Reopened tickets / total tickets |
| Average CSAT | 3.99 | Out of 5, among rated tickets only |

Additional coverage values: valid first responses 3,708 (92.70%); CSAT responses 1,226 (30.65%). Response timing conflicts: 143 (3.58%).

## Visuals planned / under development

- Ticket volume by priority.
- Ticket volume by channel (bar chart).
- Ticket volume by opened month (line chart; February 2024 is partial).
- Median first-response time by priority (horizontal bar chart).
- CSAT rating distribution using numeric `csat_valid` values 1–5, excluding blanks.
- A separate workload/outcome breakdown such as ticket distribution by support queue or resolution status.

Avoid duplicating the same channel comparison with both a bar chart and pie/donut chart unless the second view answers a clearly different question. A `csat_group` value that collapses every nonblank rating to `Rated` will produce one 100% slice; use `csat_valid` to show the 1–5 rating distribution.

## Theme

- Chart/card navy: `#152235`
- Main text: `#F8FAFC`
- Secondary text: `#9FB0C5`
- Cyan accent: `#38BDF8`
- CSAT 1–5 palette: `#F87171`, `#FB923C`, `#FBBF24`, `#38BDF8`, `#34D399`

## Publishing status

The report layout is being refined in Power BI Desktop. The final `.pbix` and a final exported PNG should be added to `powerbi/` only after the dashboard is complete and the visuals have been checked against the validated measures. A working screenshot should not be described as the final report.
