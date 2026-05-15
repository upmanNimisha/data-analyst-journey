
--1. Find total sales

select 
sum(amount) as total_sales
from orders 

--o/p : 5250

--2. Find average order amount

select 
AVG(amount) as average_amount
from orders 

--o/p :525

--3. Find top customer by total spending

SELECT customer_id, SUM(amount) as total_spending
FROM orders
GROUP BY customer_id
ORDER BY total_spending DESC
LIMIT 1;
--o/p :
| customer_id | total_spending |
| ----------- | -------------- |
| C5          | 2000           |


--4. Find city-wise total sales

select city , sum(amount)as total_sales from orders 
group by city 
--o/p :
| city      | total_sales |
| --------- | ----------- |
| Bangalore | 2000        |
| Delhi     | 1500        |
| Mumbai    | 1200        |
| Pune      | 550         |



--5. Categorize orders into High, Medium, Low

SELECT order_id,
CASE
    WHEN amount >= 700 THEN 'High'
    WHEN amount >= 300 THEN 'Medium'
    ELSE 'Low'
END as category
FROM orders; 
--o/p :
| order_id | category |
| -------- | -------- |
| 1        | Medium   |
| 2        | Medium   |
| 3        | High     |
| 4        | Low      |
| 5        | High     |
| 6        | Low      |
| 7        | High     |
| 8        | Medium   |
| 9        | Low      |
| 10       | High     |


--6. Count orders in each category

WITH temp AS (
SELECT 
CASE
    WHEN amount >= 700 THEN 'High'
    WHEN amount >= 300 THEN 'Medium'
    ELSE 'Low'
END as category
FROM orders
)

SELECT category, COUNT(*) as orders_count
FROM temp
GROUP BY category;

--o/p :
| category | orders_count |
| -------- | ------------ |
| High     | 4            |
| Medium   | 3            |
| Low      | 3            |


--7. Rank customers by spending

SELECT 
customer_id,
SUM(amount) as spending,
DENSE_RANK() OVER(
ORDER BY SUM(amount) DESC
) as ranking
FROM orders
GROUP BY customer_id;

--o/p :
| customer_id | spending | ranking |
| ----------- | -------- | ------- |
| C5          | 2000     | 1       |
| C1          | 1300     | 2       |
| C2          | 1200     | 3       |
| C3          | 550      | 4       |
| C4          | 200      | 5       |


--8. Find customers spending above average

SELECT customer_id, 
SUM(amount) as spending
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(total_spending)
    FROM (
        SELECT SUM(amount) as total_spending
        FROM orders
        GROUP BY customer_id
    ) t
);

--o/p :
| customer_id | spending |
| ----------- | -------- |
| C1          | 1300     |
| C2          | 1200     |
| C5          | 2000     |


--9. Calculate running total of sales

select *,
sum(amount) over(
order by order_id)as running_total
from orders

--o/p :
| order_id | customer_id | amount | running_total |
| -------- | ----------- | ------ | ------------- |
| 1        | C1          | 500    | 500           |
| 2        | C2          | 300    | 800           |
| 3        | C1          | 700    | 1500          |
| 4        | C3          | 150    | 1650          |
| 5        | C2          | 900    | 2550          |
| 6        | C4          | 200    | 2750          |
| 7        | C5          | 1200   | 3950          |
| 8        | C3          | 400    | 4350          |
| 9        | C1          | 100    | 4450          |
| 10       | C5          | 800    | 5250          |

