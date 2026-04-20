-- ================================
-- 🟢 EASY LEVEL
-- ================================

-- Q1. Customers aur Orders
-- Tables:
-- customers (customer_id, name)
-- orders (order_id, customer_id, amount)
-- Question:
-- Find all customers jinhone order place kiya hai


   select distinct c.name 
   from orders o
   inner join customers c
   on c.customer_id = o.customer_id

-- Q2. 
-- Question:
-- Find all customers including those who have NOT placed any order
   select distinct c.name 
   from customers c
   left join orders o
   on c.customer_id = o.customer_id 


-- Q3. Missing Data
-- Question:
-- Find customers jinhone koi order nahi diya
   select distinct c.name 
   from customers c
   left join orders o
   on c.customer_id = o.customer_id where o.customer_id is Null


-- ================================
-- 🟡 MEDIUM LEVEL
-- ================================

-- Q4. Total Spend per Customer
-- Question:
-- Har customer ka total amount spent nikaalo
   --select customer_id , sum(amount) as amount_spent from orders group by customer_id
   
   select c.customer_id , 
          c.name ,
		  o.coalesce(sum(o.amount) , 0)
   from customers c 
   left join orders o 
   on c.customer_id=o.customer_id 
   group by customer_id , c.name    
		  

-- Q5. Orders with Customer Name
-- Question:
-- Har order ke saath customer name show karo

   select C.name , O.order_id 
   From orders O
   Join customers C
   on c.customer_id = o.customer_id 



-- Q6. Highest Spending Customer
-- Question:
-- Sabse zyada spend karne wala customer kaun hai?

   Select C.name
   from customers  C
   join orders O
   ON c.customer_id = o.customer_id
   GROUP BY c.customer_id, c.name
   ORDER BY SUM(o.amount) DESC
   LIMIT 1;

