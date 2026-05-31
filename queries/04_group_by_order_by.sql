-- Topic   : GROUP BY and ORDER BY
-- Concepts : Grouping rows, aggregate functions (AVG, MAX, MIN,COUNT), sorting results

-- GROUP BY--
-- Groups rows that share the same value in the specified column.
-- Must be used with aggregate functions when selecting non-grouped columns.

-- Count of employees grouped by gender
Select Gender
From employee_demographics
group by gender
;

-- Group by both occupation and salary to see unique combinations
select occupation, salary
From employee_salary
group by occupation, salary 
;

-- agrigate function--
-- Average, maximum, minimum and count of age, grouped by gender
Select gender, 
	AVG(age) As avg_age, 
    Max(age) As max_age, 
    min(age) As min_age, 
    count(age) As count_age
From employee_demographics
Group By gender
;

-- Order by--
-- Sorts the result set. Default direction is ASC (ascending).

-- Sort all employees alphabetically by first name
Select*
From employee_demographics
order by first_Name
;

-- Sort by gender first, then by age within each gender group
Select*
From employee_demographics
order by gender, Age
;





