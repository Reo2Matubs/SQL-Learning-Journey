-- Topic   : Common Table Expressions (CTEs)
-- Concepts : WITH clause, naming a subquery for reuse,multiple CTEs, column aliasing inside CTE definition

-- A CTE is a named temporary result set defined at the top of a query with the WITH keyword.
-- It can only be referenced by theSELECT that immediately follows it.

-- Basic CTE
-- Define the CTE, then SELECT from it.
with CTE_Example as 
(Select gender, avg(salary), max(salary),min(salary),count(salary)
From employee_demographics Dem
join employee_salary Sal
	on Dem.employee_id = Sal.employee_id
group by gender) 
 
 select* 
 from CTE_example;

-- Using an aggregate on the CTE result
-- The CTE pre-aggregates by gender; the outer query then averages those group averages to get an overall average salary.
with CTE_Example as 
(Select gender, avg(salary) avg_sal, max(salary),min(salary),count(salary)
From employee_demographics Dem
join employee_salary Sal
	on Dem.employee_id = Sal.employee_id
group by gender) 
 select avg(avg_sal) 
 from CTE_example;

-- For comparison — the same logic written as a subquery instead
select avg(avg_sal) 
from (Select gender, avg(salary) avg_sal, max(salary),min(salary),count(salary)
From employee_demographics Dem
join employee_salary Sal
	on Dem.employee_id = Sal.employee_id
group by gender) EG_Subquery
; 

 select avg(avg_sal) 
 from CTE_example;

-- Multiple CTEs
-- Define more than one CTE in the same WITH clause, separated by commas. Each CTE can reference the ones defined before it.
with CTE_Example as 
(Select employee_id, gender, birth_date
From employee_demographics Dem
where birth_date > '1985-01-01'),
CTE_example2 as
(Select employee_id, salary 
from employee_salary
where salary > 50000 )

Select*
from CTE_Example
Join CTE_example2
	on CTE_Example.employee_id = CTE_example2.employee_id
;

-- Naming CTE columns in the WITH clause
-- Instead of aliasing inside the subquery, you can declare the column names directly after the CTE name.
with CTE_Example (Gender, Avg_Sal, Max_Sal,Min_Sal,Count_Sal) as -- this is to change the column names without alliasing
(Select gender, avg(salary), max(salary),min(salary),count(salary)
From employee_demographics Dem
join employee_salary Sal
	on Dem.employee_id = Sal.employee_id
group by gender) 
 
 select* 
 from CTE_example
;

