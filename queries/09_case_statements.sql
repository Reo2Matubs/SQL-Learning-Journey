-- Topic   : CASE Statements
-- Concepts : Adding conditional logic inside a SELECT statement, similar to IF / ELSE in other languages

-- Basic CASE — assign an age bracket label to each employee
select first_name, last_name,age,
case
	when age <= 30 then 'young'
    when age between 31 and 50 then 'old' 
    when age >= 50 then 'Senior'
end as age_bracket    
from employee_demographics;

-- CASE for salary calculations
-- Pay increase and bonus
-- < 50000 = 5% 
-- > 50000 = 7%
-- Finace dpt. = 10% 
-- find finance dept no. = 6 

select first_name, last_name,salary,
case 
	when salary<50000 then salary +(salary*0.05)
    when salary>50000 then salary +(salary*0.07)
end
from employee_salary
;
-- Multiple CASE columns in one query
-- Salary raise (above) PLUS a Finance department bonus
-- Finance department id = 6 → 10 % bonus

select first_name, last_name,salary,
case 
	when salary<50000 then salary +(salary*0.05)
    when salary>50000 then salary +(salary*0.07)
end as new_salary, -- note to always end case statements 
case
	when dept_id = 6 then salary * 0.10
end as bounus 
from employee_salary;
