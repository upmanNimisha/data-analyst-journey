-- Show orders greater than average amount

select * from orders where amount = (select AVG(Amount) from orders)


--Find customer with highest total spending

select sum(amount) as total from customers group by customer_id

select Max(total) from (.....)t

select customer_id from customer group by customer_id having sum(amount) = (Max)

SELECT customer_id, SUM(amount) as total
FROM orders
GROUP BY customer_id
HAVING SUM(amount) = (
    SELECT MAX(total)
    FROM (
        SELECT SUM(amount) as total
        FROM orders
        GROUP BY customer_id
    ) t
);

-- Types of Subqueries
-- 1: Scalar Value 

-- It gives single value : AVG(), MAX()

-- 2: Multiple Value 
-- Use IN
   SELECT *
   FROM orders
   WHERE customer_id IN (SELECT customer_id FROM customers);
   
-- 3: Correlated   
-- Runs for each row ; like for loop 


   -- 3.1 Comparison 
   -- details of the orders of customer jiska amount uske avg amount se jyada ho
          SELECT *
          FROM orders o
          WHERE amount > (
              SELECT AVG(amount)
              FROM orders
              WHERE customer_id = o.customer_id
          );

    -- 3.2 EXISTS : if record exists or not 
	-- Un customers ko find karo jinke orders exist karte hain
	      SELECT *
          FROM customers c
          WHERE EXISTS (
              SELECT *
              FROM orders o
              WHERE o.customer_id = c.customer_id
          );
    -- for fast results 
          SELECT *
          FROM customers c
          WHERE EXISTS (
              SELECT 1
              FROM orders o
              WHERE o.customer_id = c.customer_id
          );
    -- 3.3 Not EXISTS : if record not exists 
	-- Un customers ko find karo jinke orders exist nahi karte hain
	      SELECT *
          FROM customers c
          WHERE NOT EXISTS (
              SELECT *
              FROM orders o
              WHERE o.customer_id = c.customer_id
          );


-- Q1:Find customers whose order amount is highest in their group
SELECT o.customer_id, o.amount
FROM orders o
WHERE o.amount = (
    SELECT MAX(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
-- Q2:Find customers who never ordered
SELECT o.customer_id, o.amount
FROM orders o
WHERE o.amount = (
    SELECT MAX(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- Q3:Find orders which are greater than the average order amount of that same customer
-- orders table:| order_id | customer_id | amount
      
SELECT o.order_id, o.customer_id, o.amount
FROM orders o
WHERE o.amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
	  
	  
-- Find orders which are greater than customer average AND only for customers having more than 2 orders	  
SELECT o.order_id, o.customer_id, o.amount
FROM orders o
WHERE o.amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE customer_id = o.customer_id
)
AND o.customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
);




















