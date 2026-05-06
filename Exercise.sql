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

-- Q7: Sirf Delhi ke customers me se unko dikhao jinka total spend > 300

-- Q8: Un customers ko find karo jinke orders exactly 2 hain

-- Q9: Har city ka total amount nikalo aur sirf un cities ko dikhao jinka total > 500

-- Q10: Har customer ka max order amount nikalo

------------------------------------------------------------
-- 🟠 LEVEL 3 (SUBQUERIES)
------------------------------------------------------------

-- Q11: Un orders ko find karo jinka amount overall average amount se zyada hai

-- Q12: Un customers ko find karo jinka total spend sabse zyada hai

-- Q13: Un orders ko find karo jinka amount minimum order amount ke barabar hai

------------------------------------------------------------
-- 🔴 LEVEL 4 (CORRELATED SUBQUERY)
------------------------------------------------------------

-- Q14: Un orders ko find karo jo apne customer ke average se zyada hain

-- Q15: Har customer ka highest order find karo

-- Q16: Un customers ko find karo jinke paas koi order nahi hai

------------------------------------------------------------
-- 🔥 LEVEL 5 (ADVANCED: ANY / ALL / EXISTS)
------------------------------------------------------------

-- Q17: Un orders ko find karo jinka amount kisi bhi ek order se zyada hai (ANY)

-- Q18: Un orders ko find karo jinka amount sabhi orders se zyada hai (ALL)

-- Q19: Un customers ko find karo jinke orders exist karte hain (EXISTS)

-- Q20: Un customers ko find karo jinke orders exist nahi karte (NOT EXISTS)

------------------------------------------------------------
-- 🎯 BONUS (REAL INTERVIEW LEVEL)
------------------------------------------------------------

-- Q21: Un orders ko find karo jo customer average se zyada hain
--      AND sirf un customers ke liye jinke orders count > 2 hain

