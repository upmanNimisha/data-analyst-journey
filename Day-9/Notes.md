
## Introduction to Power BI
Power BI is a Business Intelligence and Data Visualization tool used to:
- Analyze data
- Create dashboards
- Generate reports
- Find business insights

It helps convert raw data into interactive visuals and dashboards.

---

#  Power BI Basics

## Topics Covered
- Introduction to Power BI
- Importing Data
- Creating Basic Visuals
- Dashboard Basics

---

# Importing Data

## Methods
Home → Get Data

OR

Home → Enter Data

Supported sources:
- Excel
- CSV
- SQL Database
- APIs
- Manual Data Entry

---

# Basic Visuals

## 1. Card Visual
Used to display a single KPI (Key Performance Indicator).

### Examples:
- Total Sales
- Total Orders
- Total Customers

### Common Aggregations:
| Aggregation | Meaning |
|------------|----------|
| Sum | Total value |
| Count | Number of records |
| Distinct Count | Unique values |
| Average | Mean value |

---

## 2. Bar Chart
Used for comparison between categories.

### Example:
Sales by City

### Structure:
- Axis → city
- Values → amount (SUM)

---

## 3. Pie Chart
Used to show contribution/distribution.

### Example:
Orders by City

### Structure:
- Legend → city
- Values → order_id (COUNT)

---

## 4. Table Visual
Used to display detailed/raw data.

### Example Fields:
- customer_id
- city
- amount

---

# Interactive Dashboarding

## Topics Covered
- KPI Cards
- Distinct Count
- Slicers
- Interactive Filtering
- Dashboard Formatting
- Values vs Categories vs Tooltip

---

# KPI Cards

## KPI Meaning
KPI = Key Performance Indicator

Used to track important business metrics.

### KPI Examples:
- Total Sales = 5250
- Total Orders = 10
- Total Customers = 5

---

# Distinct Count

Used to count unique values.

### Example:
customer_id → Distinct Count

Result:
5 unique customers

Unique Customers:
- C1
- C2
- C3
- C4
- C5

---

# Slicers

Slicers are interactive filters used in dashboards.

### Example:
City slicer

When selecting Delhi:
- Cards update
- Charts update
- Tables update

---

# Interactive Filtering

Interactive filtering means:
One visual automatically affects another visual.

### Example:
Selecting a city changes:
- KPI cards
- Pie charts
- Bar charts
- Tables

This makes dashboards dynamic and interactive.

---

# Values vs Categories vs Tooltip

## Values
Used for calculations and measures.

### Examples:
- Sales
- Profit
- Count
- Average

Usually numeric fields.

---

## Categories / Axis / Legend
Used for grouping data.

### Examples:
- city
- category
- month
- region

---

## Tooltip
Used for extra information shown on hover.

### Example:
Hovering over a bar can show:
- customer_id
- sales
- order count

---

# Aggregation in Power BI

Aggregation defines how Power BI calculates data.

## Common Aggregations

| Aggregation | Purpose |
|-------------|----------|
| Sum | Total |
| Count | Number of records |
| Distinct Count | Unique values |
| Average | Mean |
| Max | Highest value |
| Min | Lowest value |

---

# Dashboard Built

## Dashboard Components

### KPI Cards
- Total Sales
- Total Orders
- Total Customers

### Charts
- Bar Chart → Sales by City
- Pie Chart → Orders by City

### Table
- Customer transaction details

### Slicer
- City filter

---

# Important Learnings

- Power BI dashboards should be interactive.
- KPI cards help track business performance.
- Slicers improve dashboard usability.
- Aggregations are important for calculations.
- Visuals should clearly communicate insights.

---

# Beginner Mistakes Learned

## Incorrect:
Using text fields in Categories inside Card visuals.

This displays:
C1
C2
C3

instead of a number.

---

## Correct:
Use:
Values → Distinct Count

for unique customer calculation.

---

# Key Concepts Learned

✅ Data Visualization  
✅ KPI Tracking  
✅ Interactive Dashboards  
✅ Distinct Count  
✅ Slicers and Filtering  
✅ Aggregation  
✅ Dashboard Formatting  
✅ Dynamic Visual Interaction

---

# Final Understanding

Power BI combines:
- Data
- Analysis
- Visualization
- Storytelling

to help businesses make better decisions using dashboards and reports.
