# Day 3 - Pivot Table (Excel)

## What is a Pivot Table?

A Pivot Table is a tool in Excel used to summarize and analyze large datasets quickly.

It helps in:
- Grouping data
- Calculating totals and averages
- Comparing categories

---

## Steps to Create Pivot Table

1. Select the entire dataset
2. Go to Insert → Pivot Table
3. Click OK
4. Drag fields into:
   - Rows
   - Columns
   - Values

---

## Analysis Performed

### 1. Average Salary by Department
- Rows → Department
- Values → Salary (Average)

### 2. Average Experience by Department
- Rows → Department
- Values → Experience (Average)

---

## Key Learnings

- Pivot Tables help summarize data quickly
- No need to write complex formulas
- Sorting helps identify highest and lowest values

---

## Insight

- The IT department has the highest average salary and experience
- Method 1:Pivot Table + Sorting
            1- Create Pivot Table (same as you did)
            2- Get:Avg Salary by Department
            3- Now:Right-click on any number in Avg Salary column
            4- Click Sort → Largest to Smallest
			
- METHOD 2: Value Filters In Pivot Table:
              1- Click dropdown on Row Labels (Department)
              2- Go to:Value Filters → Top 10
              3- Select:Top 1
              4- By: Average of Salary
			  or 
			  4- By: Average of Experience
			  
- Departments with more experience tend to have higher salaries

- ----------------------------------------------------------------------------------------------------------------------------------------
#  Pivot Chart (Excel)

## What is a Pivot Chart?

A Pivot Chart is a visual representation of a Pivot Table.  
It helps in understanding data quickly using graphs instead of numbers.

---

## Steps to Create a Pivot Chart

1. Select any cell inside the Pivot Table
2. Go to Insert tab
3. Click on PivotChart
4. Choose chart type (Column Chart or Bar Chart)
5. Click OK

---

## Chart Used

- Chart Type: Column Chart

---

## Analysis Performed

- Visualized Average Salary by Department
- Compared different departments easily

---

## Insight

- The IT department has the highest average salary
- Higher experience leads to higher salary
