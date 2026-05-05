#  SQL Subquery Notes (Complete Guide)

##  1. What is a Subquery?

A **subquery** is a query inside another SQL query.

```sql
SELECT *
FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);
```

* Inner query → Subquery
* Outer query → Main query

---

##  2. Why Use Subqueries?

Use subqueries when:

* You need **dynamic values** (AVG, MAX, etc.)
* You want to use result of one query inside another
* Filtering based on aggregated data

---

##  3. Types of Subqueries

###  3.1 Single Row Subquery

Returns only **one value**

```sql
SELECT *
FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders);
```

✔ Operators:
`=`, `>`, `<`, `>=`, `<=`

---

###  3.2 Multiple Row Subquery

Returns **multiple values**

```sql
SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id FROM customers
);
```

✔ Operators:
`IN`, `ANY`, `ALL`

ANY : Compare with one one of the all
ALL : Compare with all values : satisfy if all are correct

---

###  3.3 Correlated Subquery 🔥

Depends on outer query and runs **for each row**

```sql
SELECT *
FROM orders o
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
```

 Runs once per row of outer query

---

###  3.4 EXISTS Subquery

Checks if records exist

```sql
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

---

###  3.5 NOT EXISTS

```sql
SELECT *
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

---

##  4. Subquery vs JOIN

| Feature     | Subquery           | JOIN           |
| ----------- | ------------------ | -------------- |
| Readability | Easy               | Medium         |
| Performance | Slower (sometimes) | Faster         |
| Use Case    | Simple logic       | Large datasets |

---

##  5. Common Use Cases

* Above average values
* Max/Min per group
* Missing data detection
* Aggregate-based filtering

---

##  6. Important Rules ⚠️

* Subquery must return correct number of columns
* Use single value with `>`, `<`
* Use `IN` for multiple values
* Correlated subquery uses outer alias

---

##  7. Common Mistakes ❌

* Wrong table usage
* Multiple columns in scalar subquery
* Alias in WHERE
* Confusing correlated vs normal subquery

---

##  8. Interview Examples

###  Orders above customer average

```sql
SELECT o.order_id, o.customer_id, o.amount
FROM orders o
WHERE o.amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
```

---

###  Customers with no orders

```sql
SELECT customer_id
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

---

###  Highest order per customer

```sql
SELECT o.customer_id, o.amount
FROM orders o
WHERE o.amount = (
    SELECT MAX(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
```

---



