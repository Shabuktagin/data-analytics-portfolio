# Power BI Troubleshooting Notes

## Issue:
Power BI could not connect to MySQL.

## Investigation:
The MySQL database connector was missing from Power BI Desktop.

Power BI requires appropriate database drivers/connectors to communicate with external data sources.

## Resolution:
Installed MySQL Connector/NET.

Restarted Power BI Desktop.

The MySQL Database option became available under:

Home → Get Data → Database → MySQL Database

## Lesson Learned:
BI tools depend on database drivers to establish connections.

When a data source is unavailable:

1. Identify the connection error.
2. Check whether the required driver/connector is installed.
3. Install the correct connector.
4. Restart the BI tool.
5. Validate the connection.

## Analyst Skill Demonstrated:
Troubleshooting data connectivity issues between BI tools and databases.
