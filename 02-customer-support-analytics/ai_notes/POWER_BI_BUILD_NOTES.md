# Power BI Build Notes — Customer Support Ticket Analytics

## 1. Purpose

Power BI is being used to present the customer-support analysis in an interactive dashboard.

The dashboard is intended to help users explore ticket volume, priority, support channels, response times, resolution times, reopening, and customer satisfaction.

**Current status:** Dashboard development is in progress. Do not describe the report as final or publish a `.pbix` file until the report has been completed and validated.

## 2. Data model

The imported Power BI table is named:

`Tickets`

The model includes ticket-level information and calculated or cleaned fields from the processed dataset.

The following fields were identified as Boolean fields in the Power BI model:

- `resolution_recorded`
- `reopened`
- `response_after_resolution_flag`
- `csat_invalid_flag`

DAX comparisons for these fields should use `TRUE()` and `FALSE()` rather than numeric `1` and `0`.

Example:

```dax
CALCULATE(
    COUNTROWS(Tickets),
    Tickets[resolution_recorded] = TRUE()
)
```

The exact field names and data types should be checked against the final Power BI model before using or modifying measures.

## 3. KPI cards

Six headline KPI cards were planned and developed for the dashboard.

| KPI                   | Recorded result | Display |
| --------------------- | --------------: | ------- |
| Total Tickets         |           4,000 | 4K      |
| Resolution Rate       |          94.38% | 94.38%  |
| Median First Response |      80 minutes | 80.00   |
| Median Resolution     |     24.63 hours | 24.63   |
| Reopening Rate        |           7.13% | 7.13%   |
| Average CSAT          |        3.99 / 5 | 3.99    |

### KPI interpretation

- **Total Tickets:** Number of ticket records in the dataset.
- **Resolution Rate:** Share of tickets with a recorded resolution timestamp.
- **Median First Response:** Median among valid first-response observations, excluding missing values and chronology conflicts.
- **Median Resolution:** Median among records with usable resolution-time information.
- **Reopening Rate:** Share of tickets marked as reopened.
- **Average CSAT:** Average among tickets with valid CSAT ratings only.

The KPI values should be reconciled against the final model and filters before publication.

## 4. DAX considerations

The project includes a DAX measures file:

`powerbi/customer_support_measures.dax`

The measures were organized around the main business questions and the six headline KPIs.

Important implementation considerations:

- Use the `Tickets` table name.
- Use Boolean comparisons with `TRUE()` and `FALSE()` for Boolean columns.
- Exclude first-response chronology conflicts from the validated first-response measure.
- Do not treat missing timestamps as zero.
- Calculate average CSAT only from valid ratings.
- Check the filter context of every measure.
- Reconcile Power BI results against the Python and SQL analysis.

The DAX file is a development reference. Measures must be tested in the actual Power BI model.

## 5. Dashboard theme

The dashboard uses a dark navy visual theme.

| Element            | Hex color |
| ------------------ | --------- |
| Background / cards | `#152235` |
| Main text          | `#F8FAFC` |
| Secondary text     | `#9FB0C5` |
| Accent             | `#38BDF8` |

The theme file is stored at:

`powerbi/customer_support_theme.json`

The purpose of the theme is to maintain consistent contrast, readability, and visual identity across the report.

## 6. Visuals explored

The dashboard development included the following visual ideas:

### Ticket volume by priority

A bar chart to compare ticket counts across priority levels.

### Ticket volume by support channel

A bar chart to compare how tickets enter the support operation.

### Ticket volume over time

A line chart using the ticket opening month to show changes in incoming volume.

The February 2024 period must be interpreted carefully because the dataset ends on 4 February 2024.

### Median first-response time by priority

A horizontal bar chart to compare response times across priority levels.

### Customer satisfaction distribution

Use the numeric valid CSAT rating categories (1–5) to show the distribution of ratings.

Do not use a grouped field such as `csat_group` if it combines all valid ratings into one category, because that would hide the distribution between individual rating values.

### Further visual improvements

Avoid repeating the same information in multiple charts. Each visual should answer a distinct business question.

## 7. Business questions for the dashboard

The report is intended to help answer:

1. How many support tickets were received?
2. Which priority levels generate the most tickets?
3. Which channels are used most frequently?
4. How does ticket volume change over time?
5. How does first-response time vary by priority?
6. How long do tickets take to resolve?
7. Which support queues have longer recorded resolution times?
8. What proportion of tickets are reopened?
9. What does the distribution of valid CSAT ratings look like?

## 8. Data-quality considerations for visuals

- Do not interpret missing resolution timestamps as unresolved tickets unless an authoritative ticket-status field supports that conclusion.
- Do not use the resolution rate as an SLA-compliance rate.
- Do not interpret missing CSAT ratings as negative ratings.
- Display CSAT coverage or explain that the average is based only on rated tickets.
- Exclude chronology-conflict records from validated first-response calculations.
- Label time units clearly: minutes for first response and hours for resolution.
- Avoid implying that queue or priority differences establish causation.

## 9. Current report status and remaining work

Before the Power BI report is considered complete:

- [ ] Finish the dashboard layout.
- [ ] Check all six KPI cards against the analytical results.
- [ ] Validate the DAX measures in the final model.
- [ ] Check all chart fields, filters, and aggregations.
- [ ] Confirm that CSAT ratings display individually from 1 to 5.
- [ ] Review titles, labels, units, and formatting.
- [ ] Check readability and consistency of the theme.
- [ ] Save the final `.pbix` file.
- [ ] Export a dashboard preview image if appropriate.
- [ ] Add the final report and preview to the repository.

Suggested final file locations:

```text
powerbi/
├── README.md
├── customer_support_measures.dax
├── customer_support_theme.json
├── dashboard_design_guide.md
├── customer_support_dashboard.pbix
└── dashboard_preview.png
```

The `.pbix` and preview image are suggested future additions, not files confirmed as included in the current project package.

## 10. Reproducibility

The Power BI report should be reproducible from the processed ticket dataset and documented measures.

A future reviewer should be able to identify:

- Which dataset was imported.
- Which table and fields were used.
- How the KPIs were defined.
- Which data-quality exclusions were applied.
- What each dashboard visual represents.

This documentation should be updated whenever the data model, measures, or dashboard design changes.

