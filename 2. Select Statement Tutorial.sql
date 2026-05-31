-- Topic: Select Statement
-- Concepts: Basic Select, Arithmetic Expressions, Distinct

-- Retrieve all columns from employee_demographics

Select *
FROM parks_and_recreation.employee_demographics;

-- Retrieve specific columns and apply an arithmetic expression
-- Note: SQL follows PEMDAS / BODMAS operator precedence

Select first_Name, 
last_name,
birth_date,
age,
(age + 10)*10 
From parks_and_recreation.employee_demographics;

-- DISTINCT removes duplicate combinations of the selected columns

Select distinct first_name, gender
FROM parks_and_recreation.employee_demographics;

