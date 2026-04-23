# Day 5 - SQL (WHERE, GROUP BY, HAVING)

## 1. WHERE Clause

The WHERE clause is used to filter rows before any grouping or aggregation.

### Example:
SELECT * 
FROM Orders
WHERE amount > 300;

### Key Point:
- Works on individual rows
- Cannot use aggregate functions like SUM, COUNT

---

## 2. GROUP BY Clause

The GROUP BY clause is used to group data based on one or more columns.

### Example:
SELECT city, SUM(amount) as total_amount
FROM Orders
GROUP BY city;

### Key Point:
- Groups rows into categories
- Used with aggregate functions (SUM, COUNT, AVG)

---

## 3. HAVING Clause

The HAVING clause is used to filter grouped data (after aggregation).

### Example:
SELECT city, SUM(amount) as total_amount
FROM Orders
GROUP BY city
HAVING SUM(amount) > 200;

### Key Point:
- Works on grouped data
- Used with aggregate functions

---

## Difference Between WHERE and HAVING

| Feature        | WHERE              | HAVING               |
|---------------|-------------------|---------------------|
| Works on      | Rows              | Groups              |
| Used Before   | GROUP BY          | After GROUP BY      |
| Aggregates    | Not allowed       | Allowed             |

---

## Real-World Use Case

- WHERE → Filter raw data (e.g., amount > 300)
- GROUP BY → Group data (e.g., city-wise sales)
- HAVING → Filter groups (e.g., cities with sales > 200)

---

## Insight

- WHERE is used for row-level filtering
- HAVING is used for group-level filtering
- GROUP BY helps summarize large datasets
