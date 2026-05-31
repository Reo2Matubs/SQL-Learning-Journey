-- Topic   : UNION
-- Concepts : Combining result sets vertically, UNION DISTINCT vs UNION ALL, adding label columns

-- UNION DISTINCT (default)
-- Combines rows from both SELECT statements and removes duplicate rows across the combined result set.

select first_name, last_name
from employee_demographics
union distinct
select first_name, last_name
from employee_salary;

-- UNION ALL
-- Combines rows from both SELECT statements and keeps ALL rows, including duplicates.

select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary;

-- Adding a label column to identify the source of each row
-- Label employees who are over 50 OR earn above 70 000
select first_name, last_name, '0ld' as label
from employee_demographics
where age > 50 
union all -- shows all even duplicates--
select first_name, last_name, 'High payed'
from employee_salary
where salary > 70000;

-- Combine three segments and sort the final result
select first_name, last_name, '0ld lady' as label
from employee_demographics
where age > 40 and gender = 'female'
union
select first_name, last_name, '0ld man' as label
from employee_demographics
where age > 40 and gender = 'male'
union  
select first_name, last_name, 'High payed' as label 
from employee_salary
where salary > 70000
order by first_name, last_name;
