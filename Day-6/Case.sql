-- Case


-- Categorize customers:
-- amount ≥ 700 → "Premium"
-- amount ≥ 300 → "Regular"
-- else → "Basic"

select customers , amount ,
Case 
    when amount ≥ 700 then "Premium"
    when amount ≥ 300 then "Regular"
    else  "Basic"
end as category
from customer


--- Create column:

-- If city = Delhi → "North"
-- If city = Mumbai → "West"
-- Else → "Other"

select city , 
cASE 
   when city = 'Delhi' then 'north'
   when city = 'Mumbai' then 'west'
   else 'other'
end as direction
from city  


--- Count how many orders fall into:

-- High (≥ 500)
-- Medium (≥ 200)
-- Low (< 200) 

select  
case 
   when amount >=  500 then 'High'
   when amount >= 200 then 'Medium'
   when amount < 200 then 'Low'
end as categories,
Count(*) as total_orders
from customer
group by categories  


--- Create column:
--If amount > average amount → "Above Avg"
-- Else → "Below Avg" 

select 
case when amount >  (Select AVG(amount) from orders ) then 'Above Avg'
   else 'Below Avg'
   end as Range
   from orders
   
-- Count how many orders are:
-- High (≥ 500)
-- Low (< 500)

select 
case when amount >= 500 then 'High'
     when amount < 500 then 'Low'
	 end as categories ,
	 count (*)
	 from orders 
	 group by 
	 case 
	 when amount >= 500 then 'High'
     when amount < 500 then 'Low'
	 end 
	 
--- Find:
--- Total amount for each category (High, Medium, Low)
 select 
case when amount >= 500 then 'High'
     when amount < 500 then 'Low'
	 end as categories ,
	 sum(amount) as total amount
	 from orders 
	 group by 
	 case 
	 when amount >= 500 then 'High'
     when amount < 500 then 'Low'
	 end


---Create column:
---If customer has more than 2 orders → "Frequent"
--- Else → "Occasional" 

SELECT 
customer_id,
COUNT(order_id) as total_orders,
CASE 
    WHEN COUNT(order_id) > 2 THEN 'Frequent'
    ELSE 'Occasional'
END as category
FROM orders
GROUP BY customer_id;





