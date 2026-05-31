-- Topic   : Subqueries
-- Concepts : A query nested inside another query. Can appear in WHERE, SELECT, and FROM clauses.

-- Subquery in WHERE clause
-- Use the inner query to build a list of employee_ids, then
-- filter the outer query against that list.
-- Returns demographics for all employees in department 1.
select*
from employee_demographics
where employee_id in 
					(select employee_id
						from employee_salary
                        where dept_id =1)
;

-- Subquery in SELECT clause
-- The inner query returns a single scalar value (the overall
-- average salary) that is displayed alongside every row.
select first_name, 
	(select avg(salary)
		From employee_salary)
from employee_salary;

-- Subquery in FROM clause (derived table)
-- First, aggregate demographics by gender.
-- Then query that derived table as if it were a regular table.

-- Step 1 — the inner aggregation
select gender, avg(age),max(age),count(age)
from employee_demographics
group by gender;

-- Step 2 — wrap it as a derived table and query it
select gender, avg(max_age)
from
(select gender, avg(age),max(age) as Max_age,count(age)
from employee_demographics
group by gender) as agg_table 
group by gender
;
