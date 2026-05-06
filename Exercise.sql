-- 🟣 SQL Practice Set (Day 6–7 + Subquery + Correlated + ANY/ALL)
--customers

-- Columns:
-- customer_id (Primary Key)
-- customer_name
-- city

--orders

-- Columns:
-- order_id (Primary Key)
-- customer_id (Foreign Key → customers)
-- amount


------------------------------------------------------------
-- 🟢 LEVEL 1 (GROUP BY + BASIC)
------------------------------------------------------------

-- Q1: Har customer ka total amount nikalo

   Select customer_id , sum(amount) as total_sum
   from orders
   group by customer_id

-- Q2: Har customer ke total orders count karo
   
   Select customer_id , count(*) as total_orders 
   from orders 
   group by customer_id

-- Q3: Sirf un customers ko dikhao jinka total amount > 500 hai

   select customer_id , sum(amount) as total_amount
   from orders 
   group by customer_id
   having sum(amount) > 500

-- Q4: Har city ka average order amount nikalo

   Select c.city , AVG(o.amount) as average_amount 
   from orders o
   join customers c 
   on c.customer_id = o.customer_id
   group by city 

-- Q5: Sirf un cities ko dikhao jahan orders count ≥ 3 hai
   Select c.city , count(*) as orders_count
   from orders o
   join customers c 
   on c.customer_id = o.customer_id
   group by city 
   having count(*) >= 3
------------------------------------------------------------
-- 🟡 LEVEL 2 (HAVING + CONDITIONS)
------------------------------------------------------------

-- Q6: Har customer ka average amount nikalo aur sirf unko dikhao jinka avg > 200

   Select customer_id , avg(amount) as average_amount 
   from orders 
   group by customer_id 
   having avg(amount) > 200 

-- Q7: Sirf Delhi ke customers me se unko dikhao jinka total spend > 300

--Order : FROM → JOIN → WHERE → GROUP BY → HAVING
  
   select c.customer_id , sum(o.amount) as total_spend , c.city 
   from orders o 
   join customers c 
   on c.customer_id = o.customer_id
   where c.city = 'Delhi'
   group by c.customer_id 
   having sum(o.amount)> 300
	   

-- Q8: Un customers ko find karo jinke orders exactly 2 hain
   
   select customer_id , Count(*)
   from orders
   group by customer_id
   having  Count(*) = 2

-- Q9: Har city ka total amount nikalo aur sirf un cities ko dikhao jinka total > 500
       
   select c.city , Sum(o.amount) as total_amount 
   from orders o
   join customers c 
   on c.customer_id = o.customer_id
   group by c.city     having sum(o.amount) > 500

-- Q10: Har customer ka max order amount nikalo

   SELECT customer_id, MAX(amount) AS max_amount
   FROM orders
   GROUP BY customer_id;

------------------------------------------------------------
-- 🟠 LEVEL 3 (SUBQUERIES)
------------------------------------------------------------

-- Q11: Un orders ko find karo jinka amount overall average amount se zyada hai
        
   Select order_id 
   from orders 
   where amount > (Select AVG(amount) from orders)

-- Q12: Un customers ko find karo jinka total spend sabse zyada hai 
   
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(amount) = (
        SELECT MAX(total_amount)
        FROM (
            SELECT SUM(amount) AS total_amount
            FROM orders
            GROUP BY customer_id
        ) t
    );
	
-- Q13: Un orders ko find karo jinka amount minimum order amount ke barabar hai
 
   select order_id 
   from orders 
   where amount = (select Min(amount) from orders)

------------------------------------------------------------
-- 🔴 LEVEL 4 (CORRELATED SUBQUERY)
------------------------------------------------------------

-- Q14: Un orders ko find karo jo apne customer ke average se zyada hain

   Select o.order_id , o.customer_id , o.amount from orders 
   where o.amount > ( 
   select AVG(amount) 
   from orders 
   where customer_id = o.customer_id )
   

-- Q15: Har customer ka highest order find karo

   SELECT o.customer_id, o.order_id, o.amount
FROM orders o
WHERE o.amount = (
    SELECT MAX(amount)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- Q16: Un customers ko find karo jinke paas koi order nahi hai

SELECT c.customer_id
FROM customers c
WHERE NOT EXISTS (
    SELECT *
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
------------------------------------------------------------
-- 🔥 LEVEL 5 (ADVANCED: ANY / ALL / EXISTS)
------------------------------------------------------------

-- Q17: Un orders ko find karo jinka amount kisi bhi ek order se zyada hai (ANY)
    
	select order_id from orders where amount > ANY(select amount from orders)

-- Q18: Un orders ko find karo jinka amount sabhi orders se zyada hai (ALL)

    select order_id from orders where amount > ALL(select amount from orders)
--But result empty hoga
--Kyun?
--condition: amount > ALL values
--matlab: amount > maximum
--impossible (koi value khud se badi nahi hoti)
   
   SELECT order_id
   FROM orders
   WHERE amount = (
       SELECT MAX(amount) FROM orders
   );

-- Q19: Un customers ko find karo jinke orders exist karte hain (EXISTS)
   
    select c.customer_id from customers c where exists (select o.customer_id from orders o WHERE o.customer_id = c.customer_id)

-- Q20: Un customers ko find karo jinke orders exist nahi karte (NOT EXISTS)
    
	select c.customer_id from customers c where not exists (select o.customer_id from orders o WHERE o.customer_id = c.customer_id)
------------------------------------------------------------
-- 🎯 BONUS (REAL INTERVIEW LEVEL)
------------------------------------------------------------

-- Q21: Un orders ko find karo jo customer average se zyada hain
--      AND sirf un customers ke liye jinke orders count > 2 hain


       SELECT o.order_id, o.customer_id
       FROM orders o
       WHERE o.amount > (
           SELECT AVG(amount)
           FROM orders
           WHERE customer_id = o.customer_id
       )
       AND (
           SELECT COUNT(*)
           FROM orders
           WHERE customer_id = o.customer_id
       ) > 2;


-- Q22: Har customer ka highest order with order_id batao


       select o.customer_id , o.order_id , o.amount 
       from orders o 
       where o.amount = (
           select max(amount) 
           from orders 
           where customer_id = o.customer_id
       )






















