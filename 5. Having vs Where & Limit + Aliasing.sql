-- Topic   : HAVING vs WHERE, LIMIT, and Aliasing
-- Concepts : Filtering aggregated data with HAVING, restricting row counts with LIMIT, renaming columns with AS


-- HAVING vs WHERE
-- WHERE  filters rows BEFORE grouping (on raw column values).
-- HAVING filters groups AFTER aggregation (on aggregate results).

-- Return genders where the average age exceeds 40
select gender, AVG(age)
From employee_demographics
group by gender
Having AVG(age) > 40
;

-- WHERE first narrows to manager occupations, then HAVING filters groups where the average salary exceeds 75 000
select occupation, AVG(salary)
From employee_salary
where occupation like '%manager%'
group by occupation
having Avg(salary) >75000
;

-- limit and Aliacing 
-- LIMIT — restrict the number of rows returned

-- Return only the first 3 rows
Select*
from employee_demographics
limit 3 
;

-- Return the 2 oldest employees
Select*
from employee_demographics
Order by age desc
limit 2
;

-- LIMIT offset,count — skip 2 rows then return 1
-- Useful for pagination
Select*
from employee_demographics
Order by age desc
limit 2,1
;

-- Aliacing — rename a column in the output using AS
-- e.g Avg(age) As AVG_age --

select gender, AVG(age) As avg_age
From employee_demographics
group by gender
Having avg_age > 40
;