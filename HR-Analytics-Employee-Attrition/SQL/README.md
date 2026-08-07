# HR Employee Attrition Analysis — SQL

## Overview

This folder contains the complete SQL analysis for the **HR Employee Attrition Analysis** project.

The analysis was performed using **MySQL** to clean, validate, explore, and analyse employee data to identify workforce patterns and factors associated with employee attrition.

The SQL workflow progresses from database setup and data validation to exploratory analysis, advanced SQL techniques, business insights, reusable views, and stored procedures.

---

## Objectives

The SQL analysis was designed to:

- Understand the overall workforce structure
- Measure employee attrition
- Identify departments and job roles with higher attrition
- Analyse the relationship between attrition and overtime
- Explore employee satisfaction and work-life balance
- Analyse employee demographics and compensation
- Identify potential high-risk employee segments
- Apply advanced SQL techniques
- Create reusable SQL views
- Create parameterized stored procedures
- Generate insights that support HR decision-making

---

## SQL Project Structure

| Module | File | Purpose |
|---|---|---|
| 01 | `01_Database_Creation.sql` | Creates the HR analysis database |
| 02 | `02_Table_Creation.sql` | Creates the employee data table |
| 03 | `03_Data_Import.sql` | Imports the cleaned HR dataset |
| 04 | `04_Data_Validation.sql` | Validates records, NULL values, duplicates, and data consistency |
| 05 | `05_Business_Understanding.sql` | Calculates key HR business KPIs |
| 06 | `06_Exploratory_Data_Analysis.sql` | Explores employee attrition patterns |
| 07 | `07_Advanced_SQL_Analysis.sql` | Applies CTEs, ranking, window functions, and advanced SQL |
| 08 | `08_Business_Insights.sql` | Converts analysis into actionable HR insights |
| 09 | `09_Views.sql` | Creates reusable analytical SQL views |
| 10 | `10_Stored_Procedures.sql` | Creates reusable parameterized stored procedures |

---

## Key SQL Techniques Used

### Basic SQL

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- Aggregate functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

### Conditional Analysis

- `CASE`
- Conditional aggregation
- Attrition rate calculations

### Advanced SQL

- Common Table Expressions (CTEs)
- Window Functions
- `RANK()`
- `DENSE_RANK()`
- Multi-dimensional analysis
- Employee risk classification

### Database Objects

- SQL Views
- Stored Procedures
- Input parameters
- `CREATE OR REPLACE VIEW`
- `CREATE PROCEDURE`
- `CALL`

---

## Key Business KPIs

The SQL analysis calculates important HR metrics including:

- Total Employees
- Employees Left
- Active Employees
- Attrition Rate
- Average Monthly Income
- Average Employee Age
- Total Employees by Department
- Employees by Job Role
- Employee Attrition by Department
- Employee Attrition by Job Role
- Overtime Distribution
- Business Travel Distribution
- Job Satisfaction Distribution
- Work-Life Balance Distribution
- Salary Band Analysis
- Age Group Analysis

---

## Exploratory Data Analysis

Employee attrition was explored across multiple workforce dimensions, including:

- Department
- Job Role
- Gender
- Marital Status
- Age Group
- Salary Band
- Years at Company
- Overtime
- Business Travel
- Job Satisfaction
- Work-Life Balance
- Education Field
- Job Level

The analysis calculates employee counts, employees who left, and attrition rates across these categories.

---

## Advanced SQL Analysis

The project applies advanced SQL techniques to identify and rank higher-risk workforce segments.

Examples include:

- Departments ranked by attrition rate
- Job roles ranked by attrition rate
- Salary bands ranked by attrition
- Age groups ranked by attrition
- Overtime-based attrition comparison
- Job satisfaction and overtime analysis
- Multi-factor employee risk classification
- Top job roles based on observed attrition rates

These analyses demonstrate the use of CTEs, window functions, ranking functions, conditional aggregation, and `CASE` statements.

---

## Business Insights

The SQL analysis was used to identify employee groups with higher observed attrition and potential retention risks.

Areas investigated include:

- Departments with higher attrition
- Job roles with higher turnover
- Employees working overtime
- Employees with lower job satisfaction
- Early-tenure employees
- Lower salary groups
- Business travel categories
- Combined overtime and satisfaction conditions

The results are intended to support HR decision-making and retention strategies.

> **Note:** The analysis identifies relationships and patterns in the dataset. It does not establish that a particular factor directly causes employee attrition.

---

## SQL Views

Reusable analytical views were created to simplify recurring analysis and provide structured datasets for reporting.

### Views Created

```text
vw_employee_attrition_summary
vw_department_attrition
vw_jobrole_attrition
vw_employee_risk
vw_overtime_attrition
vw_satisfaction_attrition
