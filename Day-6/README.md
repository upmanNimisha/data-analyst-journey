# Day 6 - SQL CASE WHEN

## What is CASE WHEN?

CASE WHEN is used to apply conditional logic in SQL.
It works like IF-ELSE statements.

---

## Syntax

SELECT column,
CASE 
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result
END as new_column
FROM table_name;
## Key Points

- CASE works like IF-ELSE
- Conditions are checked in order
- First matching condition is applied
- ELSE is optional but recommended

---

## Important Rules

- CASE is used inside SELECT
- Can be used with GROUP BY
- Can be used with aggregate functions (SUM, COUNT, AVG)

---

## Real-World Use

- Customer segmentation
- Sales categorization
- Business logic in dashboards
- Data classification

---

## Insight

CASE WHEN helps convert raw data into meaningful categories,
which is important for business analysis.
