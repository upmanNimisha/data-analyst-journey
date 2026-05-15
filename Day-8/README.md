# SQL Window Functions Notes

---

# What are Window Functions?

Window Functions perform calculations across a set of rows related to the current row without collapsing rows.

Unlike GROUP BY, window functions keep all rows visible.

---

# Basic Syntax

```sql
FUNCTION_NAME(column_name)
OVER(
    PARTITION BY column_name
    ORDER BY column_name
)
---
# Components of Window Functions
#### 1. OVER()

Defines the window on which the function works.

SUM(salary) OVER()
#### 2. PARTITION BY

Divides rows into groups.

Similar to GROUP BY but does not reduce rows.

SUM(salary) OVER(
    PARTITION BY department
)
#### 3. ORDER BY

Defines ordering inside the window.

SUM(salary) OVER(
    ORDER BY emp_id
)
Difference Between GROUP BY and Window Functions
GROUP BY	Window Function
Collapses rows	Keeps rows
One row per group	All rows remain
---

# Aggregation	Analytics
#### 1. ROW_NUMBER()

Assigns unique row numbers.

SELECT *,
ROW_NUMBER() OVER(
    ORDER BY salary DESC
) AS rn
FROM employees;
ROW_NUMBER with PARTITION
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS rn
FROM employees;

Each department numbering starts from 1.

#### 2. RANK()

Provides ranking with gaps.

SELECT *,
RANK() OVER(
    ORDER BY salary DESC
) AS rnk
FROM employees;

Example:

Salary	Rank
100	1
100	1
90	3
#### 3. DENSE_RANK()

Provides ranking without gaps.

SELECT *,
DENSE_RANK() OVER(
    ORDER BY salary DESC
) AS drnk
FROM employees;

Example:

Salary	Dense Rank
100	1
100	1
90	2
Difference Between RANK and DENSE_RANK
RANK	DENSE_RANK
Skips ranks	No skipping
1,1,3	1,1,2
#### 4. Running Total

Cumulative total till current row.

SELECT *,
SUM(salary) OVER(
    ORDER BY emp_id
) AS running_total
FROM employees;

Example:

emp_id	salary	running_total
1	1000	1000
2	2000	3000
3	1500	4500
#### 5. AVG() Window Function

Department-wise average salary.

SELECT *,
AVG(salary) OVER(
    PARTITION BY department
) AS avg_salary
FROM employees;
#### 6. COUNT() Window Function
SELECT *,
COUNT(*) OVER(
    PARTITION BY department
) AS employee_count
FROM employees;
#### 7. MAX() and MIN()
SELECT *,
MAX(salary) OVER(
    PARTITION BY department
) AS max_salary
FROM employees;
#### 8. LAG()

Gets previous row value.

SELECT *,
LAG(salary, 1, 0) OVER(
    ORDER BY emp_id
) AS previous_salary
FROM employees;
Syntax
LAG(column, offset, default_value)
column → value to fetch
offset → how many rows back
default_value → returned if no row exists
#### 9. LEAD()

Gets next row value.

SELECT *,
LEAD(salary, 1, 0) OVER(
    ORDER BY emp_id
) AS next_salary
FROM employees;
#### 10. FIRST_VALUE()

Gets first value from the window.

SELECT *,
FIRST_VALUE(salary) OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS highest_salary
FROM employees;
#### 11. LAST_VALUE()

Gets last value from the window.

SELECT *,
LAST_VALUE(salary) OVER(
    PARTITION BY department
    ORDER BY salary
) AS last_salary
FROM employees;
#### Finding Top Employee Per Department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn = 1;
Why Subquery is Needed?

This query does NOT work:

SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS rn
FROM employees
WHERE rn = 1;

Reason:

WHERE executes before window functions.

### SQL Execution Order
FROM
WHERE
GROUP BY
HAVING
Window Functions
SELECT
ORDER BY
Correct Way Using Subquery
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn = 1;
Correct Way Using CTE
WITH temp AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM temp
WHERE rn = 1;
Important Rule

#### Window function results cannot be directly used in:

WHERE
GROUP BY
HAVING

#### Use:

Subquery ,CTE instead.

#### Real-World Use Cases
Running sales total
Employee ranking
Top N employees
Growth analysis
Trend analysis
Previous month comparison
