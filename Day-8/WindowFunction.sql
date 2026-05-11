--- OVER (PARTITION BY customer_id)

-- Syntax

FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
)

-- partition by group by jesa hota h but data ko collapse nhi krta 
-- window function m order by sequece banata h 

-- Main categories for Window function
--   Ranking Functions
     | employee | salary |
     | -------- | ------ |
     | A        | 100    |
     | B        | 90     |
     | C        | 90     |
     | D        | 80     |

     
     ROW_NUMBER()
	 | employee | salary | rn |
     | -------- | ------ | -- |
     | A        | 100    | 1  |
     | B        | 90     | 2  |
     | C        | 90     | 3  |
     | D        | 80     | 4  |

     Rank()
	 | employee | salary | rn |
     | -------- | ------ | -- |
     | A        | 100    | 1  |
     | B        | 90     | 2  |
     | C        | 90     | 2  |
     | D        | 80     | 4  |
     DENSE_RANK()
	 | employee | salary | rn |
     | -------- | ------ | -- |
     | A        | 100    | 1  |
     | B        | 90     | 2  |
     | C        | 90     | 2  |
     | D        | 80     | 3  |	 
--   Aggregate Window Functions
     SUM()
     AVG()
     COUNT()
     MIN()
     MAX()	 
--   Value Functions
     LAG()
	 LEAD()
	 FIRST_VALUE()
	 LAST_VALUE()
	 
	 
-- Highest salary employee per department employees
------------------------------------------------
emp_id | emp_name | department | salary
------------------------------------------------
1      | Amit     | IT         | 5000
2      | Riya     | IT         | 7000
3      | Rahul    | HR         | 4000
4      | Sneha    | HR         | 4000
5      | Karan    | Sales      | 6000
6      | Neha     | Sales      | 8000

WITH temp AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM temp
WHERE rn = 1;   

--or 

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
) t
WHERE rn = 1;
-- Here we are using subquery because where rn=1 runs faster then window function because of which it through error as such column doesnt exist if it executes simply

--Q1.Har employee ko salary ke basis pe unique rank do

 select emp_name , salary , 
row_number() over (
order by salary desc
) as rn 
from employees

--Q2.Har department me employees ko salary descending me number do
select emp_name , salary , 
row_number() over (
partition by department
order by salary desc
) as rn 
from employees

--Q3.Har department ka highest salary employee nikalo
SELECT emp_name, department, salary,
ROW_NUMBER() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS rn
FROM employees;

--Q4.Top 2 salaries per department nikalo
select * from
(
    select * ,
           row_number() over (
               partition by department 
               order by salary desc
           ) as rn 
    from employees
) t 
where rn = 1 or rn = 2

--but better version is 
select * from
(
    select * ,
           row_number() over (
               partition by department 
               order by salary desc
           ) as rn 
    from employees
) t 
where rn <= 2

--Q5.Har employee ko salary ke basis pe RANK do
select * ,
RANK() over(
order by salary desc
) as dr 
from employees

--Q6.Har department me salary ke basis pe DENSE_RANK do

select * ,
dense_rank() over(
partition by department 
order by salary desc 
) as dr 
from employees 


--Q7.Har department ki top 2 salaries including ties nikalo
with temp as (
select * ,
dense_rank() over(
partition by department 
order by salary desc 
) as dr 
from employees 
) 
select * from temp where dr <= 2

--Q8.Overall second highest salary find karo using DENSE_RANK
	 
with temp as (
select * ,
DENSE_RANK() over(
order by salary desc
) as dr 
from employees
)
 select * from temp 
where dr = 2
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 