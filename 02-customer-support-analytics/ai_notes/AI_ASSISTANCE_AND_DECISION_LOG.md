# AI Assistance and Analytical Decision Log

## 1. Project purpose

The Customer Support Ticket Analytics project examines a dataset of 4,000 support tickets to understand how a support operation handles incoming requests.

The analysis focuses on:

- Ticket volume and distribution.
- Ticket priority and support channels.
- First-response time.
- Ticket resolution time.
- Performance differences across support queues.
- Reopened tickets.
- Customer satisfaction ratings.
- Data completeness and reliability.

The objective is to turn raw ticket records into useful operational insights while clearly communicating the limitations of the available data.

## 2. How AI assisted the project

AI was used as a supporting research and development assistant throughout the project.

### Project planning
- Helped structure the project into data preparation, exploratory analysis, SQL analysis, documentation, and Power BI reporting.
- Helped organize the analysis around practical customer-support business questions.
- Suggested ways to present the work as a portfolio project.

### Data analysis and Python
- Assisted with planning the data-cleaning and exploratory-analysis workflow.
- Helped reason through missing values, invalid chronology, and metric definitions.
- Assisted with notebook structure, code development, debugging, and interpretation.
- Helped organize findings into understandable analytical outputs.

### SQL
- Assisted with structuring SQL scripts for importing data and answering business questions.
- Helped formulate queries for ticket volume, priority, channels, response times, resolution times, and satisfaction.

### Power BI
- Assisted with KPI definitions, DAX development, data-model considerations, and dashboard layout.
- Helped troubleshoot Boolean field comparisons and measure logic.
- Suggested a consistent visual theme and chart-selection improvements.

### Documentation
- Assisted with drafting the README, business questions, data dictionary, data-quality notes, executive insights, and AI documentation.
- Helped explain analytical decisions and limitations in clear language.

## 3. Data-quality audit and analytical decisions

The dataset contains 4,000 ticket records. The following checks and decisions were important to the analysis.

### Ticket records
- Total tickets: 4,000.
- Unique ticket records: 4,000.
- Duplicate ticket records were not identified in the reported validation.

### Resolution timestamps
- Tickets with recorded resolution timestamps: 3,775 (94.38%).
- Tickets with missing resolution timestamps: 225 (5.62%).

Resolution-time calculations use records with valid recorded resolution information. Missing resolution timestamps are not treated as zero-duration resolutions.

### First-response timestamps
- Tickets with valid first-response values: 3,708 (92.70%).
- Tickets with missing first-response values: 149 (3.73%).
- Chronology conflicts: 143 (3.58%).

The 143 chronology conflicts are records where the first response was recorded after the resolution timestamp.

These records were flagged as chronology conflicts and excluded from the validated first-response KPI calculation. They were not deleted from the dataset.

### Customer satisfaction
- Valid CSAT ratings: 1,226 (30.65% of all tickets).
- Missing CSAT ratings: 2,774 (69.35%).
- Invalid CSAT values: 0.

Average CSAT is calculated only among tickets with valid ratings. It must not be interpreted as the satisfaction score of all 4,000 tickets.

### Reopened tickets
- Reopened tickets: 285.
- Reopening rate: 7.13%.

The reopening rate is calculated using the total number of tickets as the denominator.

## 4. Important KPI results

The following figures were recorded during the project analysis.

| Metric | Result |
|---|---:|
| Total tickets | 4,000 |
| Resolution rate | 94.38% |
| Median first response | 80 minutes |
| Median resolution time | 24.63 hours |
| Reopening rate | 7.13% |
| Average CSAT among rated tickets | 3.99 / 5 |

These figures describe the available dataset and its recorded values. They do not establish causal relationships or prove that a support team met a service-level target.

## 5. Observations explored during analysis

The analysis highlighted several areas for further operational investigation:

- The Technical queue contained 1,282 tickets (32.05% of all tickets).
- The Technical queue had a median recorded resolution time of approximately 39.19 hours.
- The Integrations queue contained 525 tickets and had the highest observed queue-level median recorded resolution time, approximately 42.67 hours.
- Urgent-priority tickets had a median first-response time of approximately 19 minutes.
- Low-priority tickets had a median first-response time of approximately 173.5 minutes.

These are descriptive comparisons. They do not prove that priority, queue assignment, staffing, or any other factor caused the observed differences.

## 6. Important interpretation rules

The following rules were used to avoid misleading conclusions:

1. Missing timestamps are not treated as zero.
2. First-response chronology conflicts are flagged rather than silently removed.
3. The validated first-response KPI excludes the 143 records where the first response was recorded after resolution.
4. Average CSAT is calculated only among tickets with valid ratings.
5. Missing CSAT ratings are not assumed to represent dissatisfied customers.
6. Reopened tickets are counted using the available reopening field.
7. Resolution time is not the same as SLA compliance.
8. Queue-level differences are descriptive and do not establish causation.

## 7. Dataset limitations

The available dataset does not provide sufficient information to establish:

- Whether tickets met a formal SLA target.
- The live open or closed status of tickets.
- The number of unique customers.
- Agent-level productivity or performance.
- Staffing levels or workload distribution.
- The causes of longer resolution times.
- Whether missing CSAT ratings indicate positive or negative customer experiences.

The dataset covers dates from 1 January 2023 through 4 February 2024. February 2024 is therefore a partial month and should be interpreted accordingly.

## 8. Human validation and responsibility

AI assistance was used to support development, but the project author should verify the following before publication:

- Re-run the notebook from beginning to end.
- Confirm that the cleaned dataset matches the documented validation counts.
- Reconcile SQL outputs with Python results.
- Check Power BI measures against the final imported data.
- Verify that dashboard visuals use the intended fields and filters.
- Confirm that all reported figures match the final project files.

The author is responsible for approving the final calculations, interpretations, and portfolio presentation.

## 9. Current project status

The Python analysis, processed dataset, SQL scripts, and analytical documentation have been prepared.

The Power BI dashboard has been under development. Its final exported report and `.pbix` file should only be marked complete after the finished report has been saved, checked, and included in the repository.

## 10. Closing note

This project demonstrates a structured approach to customer-support analytics, combining data preparation, exploratory analysis, SQL, KPI development, and dashboard reporting.

The emphasis is on transparent calculations, careful treatment of incomplete data, and business interpretations that remain within the limits of the available evidence.
