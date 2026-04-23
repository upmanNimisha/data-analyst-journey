-- WHERE aggregate functions (SUM, COUNT, etc.) ke saath use nahi hota
-- WHERE -->	Row filtering (before GROUP BY) [Normal Filter]
-- HAVING -->	Group filtering (after GROUP BY) [Aggregate Filter]





-- Q1:Har customer ka total amount nikalo

 select Customer_id , sum(Amount) as Total amount 
 from customers
 group by Customer_id

-- Q2:Har customer ke orders count karo
 SELECT Customer_id, COUNT(*) AS Order_Count
 FROM customers
 GROUP BY Customer_id;

-- Q3:Har customer ka average order value nikalo
 select Customer_id , AVG(Amount) as Total amount 
 from customers
 group by Customer_id

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Small Challenge (Interview Level Start)
--Table:

-- Customer_id	      city	            amount
--      1    	      Delhi	             100
-- 	    1             Delhi	             200
-- 	    2             Mumbai	         150

-- Question: Har city ka total amount nikalo

select city , sum(amount) as Total_Amount 
from orders 
group by city

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Sirf Delhi ke customers me se unko dikhao jinka total spend > 300”

  select customer_id 
  from orders  
  where city = 'Delhi' 
  group by city 
  having sum(amount) > 300


-- Q1:Har city ka total amount nikalo aur sirf woh cities dikhao jinka total > 200
   Select cities , sum(amount) as Total_Amount
   from orders
   group by city 
   having sum(amount) > 200
   
-- Q2:Har customer ka order count nikalo aur sirf unko dikhao jinke orders ≥ 2
   Select customer_id 
   from orders 
   group by customer_id 
   having count(*) >= 2
   
-- Q3 (Interview):Sirf Mumbai ke customers me se unko dikhao jinka avg amount > 100
   Select customer_id , AVG(amount) AS avg_amount
   from orders 
   where city = 'Mumbai'
   group by customer_id 
   having AVG(amount) > 200