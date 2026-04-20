#  SQL Joins 

## What is a JOIN?

JOIN ka use hota hai **multiple tables ko combine karne ke liye** based on a related column.

👉 Real-life example:

* Customers table + Orders table → pata chale kis customer ne kya order kiya

---

## Types of Joins

### INNER JOIN

👉 Sirf matching records return karta hai

```
SELECT C.name, O.order_id
FROM Customers C
INNER JOIN Orders O
ON C.customer_id = O.customer_id;
```

📌 Result:

* Sirf wo customers jinke paas orders hain

---

### LEFT JOIN (LEFT OUTER JOIN)

👉 Left table ke saare records + matching records from right table

```
SELECT C.name, O.order_id
FROM Customers C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id;
```

📌 Result:

* Saare customers
* Jinke orders nahi hain → NULL show hoga

👉 Use case:
"Find all customers, even those who didn't place any order"

---

###  RIGHT JOIN (RIGHT OUTER JOIN)

👉 Right table ke saare records + matching from left table

```
SELECT C.name, O.order_id
FROM Customers C
RIGHT JOIN Orders O
ON C.customer_id = O.customer_id;
```

📌 Result:

* Saare orders
* Even if customer data missing ho

👉 Use case:
"Find all orders, even if customer details are missing"

---

### FULL JOIN (FULL OUTER JOIN)

👉 Dono tables ke saare records

```
SELECT C.name, O.order_id
FROM Customers C
FULL JOIN Orders O
ON C.customer_id = O.customer_id;
```

📌 Result:

* Matching + non-matching from both sides

👉 Note:
MySQL me direct support nahi hota → workaround use hota hai (UNION)

---

###  CROSS JOIN

👉 Har row of table1 × har row of table2

```
SELECT C.name, O.order_id
FROM Customers C
CROSS JOIN Orders O;
```

📌 Result:

* Cartesian product (huge data)

👉 Use case:
Rare, mostly combinations generate karne ke liye

---

### SELF JOIN

👉 Same table ko khud se join karna

```
SELECT A.name AS Employee, B.name AS Manager
FROM Employees A
LEFT JOIN Employees B
ON A.manager_id = B.employee_id;
```

📌 Use case:

* Employee → Manager relation
* Hierarchy data

---

## JOIN Conditions (IMPORTANT 🔥)

👉 Always use:

```
ON table1.column = table2.column
```

⚠️ Galti:

* Wrong column join → wrong data
* Missing ON → CROSS JOIN ho jayega

---

##  When to Use Which JOIN?

| Situation                        | JOIN Type  |
| -------------------------------- | ---------- |
| Only matching data chahiye       | INNER JOIN |
| Left table ka full data chahiye  | LEFT JOIN  |
| Right table ka full data chahiye | RIGHT JOIN |
| Dono tables ka full data         | FULL JOIN  |
| All combinations                 | CROSS JOIN |
| Same table relation              | SELF JOIN  |

