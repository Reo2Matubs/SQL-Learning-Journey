-- Topic   : JOINs
-- Concepts : INNER JOIN, LEFT / RIGHT OUTER JOIN, Self Join, joining multiple tables

-- Preview both tables before joining
Select*
From employee_demographics;

Select*
From employee_salary;

 -- INNER JOIN--
-- Returns only rows where a matching employee_id exists in BOTH tables.
Select*
From employee_demographics as ED
Inner Join employee_salary as ES
	On ED.employee_id = ES.employee_id 
;

Select ED.employee_id, age, occupation
From employee_demographics as ED
Inner Join employee_salary as ES
	On ED.employee_id = ES.employee_id 
;

-- OUTER JOINs
-- LEFT  JOIN : all rows from the LEFT  table + matched rows from right
-- RIGHT JOIN : all rows from the RIGHT table + matched rows from left
-- Unmatched columns from the other table return NULL.

-- LEFT OUTER JOIN — keeps all demographics, even if no salary record
Select *
From employee_demographics as ED
left outer Join employee_salary as ES
	On ED.employee_id = ES.employee_id;

-- RIGHT OUTER JOIN — keeps all salary records, even if no demographics row
Select *
From employee_demographics as ED
right outer Join employee_salary as ES
	On ED.employee_id = ES.employee_id;

-- Self Join
-- Join a table to itself. Useful for comparisons within one table.
-- Here we pair each employee with the one whose ID is one higher (a simple "Secret Santa" pairing example).

Select 
 t1.employee_id,
    t1.first_name AS santa_first_name,
    t1.last_name  AS santa_last_name,
    t2.employee_id,
    t2.first_name AS recipient_first_name,
    t2.last_name  AS recipient_last_name
FROM employee_salary AS t1
JOIN employee_salary AS t2
    ON t1.employee_id + 1 = t2.employee_id;

-- Joining Multiple Tables
-- When two tables share no direct common column, bridge them through a third table that relates to both.
select*
From employee_demographics as ED
Inner Join employee_salary as ES
	on ED.employee_id = ES.employee_id
Inner Join parks_departments as PD
	on ES.dept_id = PD.department_id;