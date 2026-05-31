-- Topic: Where Clause
-- Concepts : Comparison operators, logical operators (AND / OR / NOT), LIKE with wildcards (% and _)

-- Filter by an exact name match
Select *
From employee_salary
WHERE first_name = 'leslie'
;

-- Filter employees earning less than 50 000
Select *
From employee_salary
WHERE Salary < 50000 
;

-- Filter employees earning 50 000 or less
Select *
From employee_salary
WHERE Salary <= 50000 
;

-- Filter by gender
Select *
From employee_demographics 
WHERE Gender = 'Female'
;

-- Exclude a specific gender using the not-equal operator
Select *
From employee_demographics
WHERE Gender != 'Female'
;

-- Filter by date — employees born after 1 January 1985
Select *
From employee_demographics
WHERE birth_date > '1985-01-01'
;

-- Logical Operators : AND / OR / NOT--
-- Employees born after 1985-01-01 AND who are Male
Select *
From employee_demographics
WHERE birth_date > '1985-01-01' 
and gender = 'male'
;

-- Using parentheses to control operator precedence:
-- Returns Leslie (age 44) OR anyone over 50
Select *
From employee_demographics
WHERE (first_name = 'leslie') and age = 44 or Age > 50
;

-- LIKE Statement — pattern matching with wildcards--
-- % = any sequence of characters
-- _ = exactly one character

-- Names that start with 'Jer' (anything can follow)
Select *
From employee_demographics
WHERE first_name like 'jer%' 
; 

-- Names that start with 'a', skip two characters, then anything
Select *
From employee_demographics
WHERE first_name like 'a___%'
; 
