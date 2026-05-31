-- Topic   : String Functions
-- Concepts : LENGTH, UPPER, LOWER, TRIM, LEFT, RIGHT, SUBSTRING, REPLACE, LOCATE, CONCAT

-- LENGTH — returns the number of characters in a string
select length('skyfall');

select first_name, length(first_name)
from employee_demographics
order by 2
;

-- UPPER / LOWER — change character case
select upper('sky');
select lower('sky');

select first_name, upper( first_name)
from employee_demographics;

-- TRIM / LTRIM / RTRIM — remove leading and/or trailing spaces
-- LTRIM   -- removes leading spaces only
-- RTRIM -- removes trailing spaces only

SELECT TRIM('          sky        ');
SELECT LTRIM('          sky        ');   -- removes leading spaces only
SELECT RTRIM('          sky        ');   -- removes trailing spaces only

-- LEFT / RIGHT — extract characters from either end of a string
Select first_name,left(first_name,4),
right(first_name,4)
from employee_demographics;

-- SUBSTRING(string, start, length) start is 1-indexed; returns 'length' characters from 'start'
Select first_name,left(first_name,4),
right(first_name,4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month 
from employee_demographics;

-- Replace(string, from, to) — swap all occurrences of a substring
select first_name, replace(first_name,'a','z')
from employee_demographics;

-- LOCATE(substring, string) — returns the starting position of a
-- substring (1-indexed); returns 0 if not found
select locate('x','alex');

select first_name, locate('an', first_name)
from employee_demographics;

-- CONCAT — joins two or more strings / columns into one
select first_name,last_name,
concat(first_name,last_name) -- connects 2 colums into 1 or 1 into multiple
from employee_demographics;

