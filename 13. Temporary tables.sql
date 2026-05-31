-- Topic   : Temporary Tables
-- Concepts : CREATE TEMPORARY TABLE, inserting rows, populating from a SELECT statement

-- Temporary tables are only visible within the session in which
-- they are created. They are automatically dropped when the
-- session ends. Common uses:
--   Storing intermediate results before inserting into apermanent table.
--   Breaking a complex query into manageable steps.

-- Method 1 : Define the structure manually, then insert rows
CREATE temporary table temp_table
(first_name varchar (50),
last_name varchar (50),
favorite_movie varchar(100) 
);

select*
from temp_table;

insert into temp_table
values ('Reo', 'Matubatuba', 'wedding things');

select*
from temp_table;

-- Method 2 : Populate directly from a SELECT statement
-- The table structure is inferred from the query result.
Select*
From employee_salary;

Create Temporary Table salary_over_50k
select*
from employee_salary
Where salary >= 50000;

Select*
From salary_over_50k;