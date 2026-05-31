-- Topic   : Stored Procedures
-- Concepts : CREATE PROCEDURE, DELIMITER, BEGIN...END,parameters (input variables)

-- A stored procedure saves a block of SQL that can be called repeatedly with CALL. 
-- This avoids rewriting the same logic and makes it easy to centralise business rules.

SELECT*
FROM employee_salary
Where salary >= 50000;

Create procedure large_salaries()
SELECT*
FROM employee_salary
Where salary >= 50000;

-- you can specify which database you are working from to be in the safe side e.g--

call large_salaries();

-- typicaly you will have multiple subqueries when creating stored procedures

Delimiter $$ -- This will now replace ; indicating the end of a query
Create procedure large_salaries3()
Begin
	SELECT*
	FROM employee_salary
	Where salary >= 50000;
	SELECT*
	FROM employee_salary
	Where salary >= 10000;
End $$
Delimiter ; -- you must change it back when you are done
-- Now both queries are a stored procedure 

Call large_salaries3(); -- you will get 2 results here because your stored procedure has 2 queries

-- Perameter-- These are variables that are passed at an input into the stored procedure allows the the stored procedure to accept an input value and place it into your code.

Delimiter $$ 
Create procedure large_salaries4(Eployee_id_peram INT)
Begin
	SELECT salary
	FROM employee_salary
    Where employee_id = Eployee_id_peram
	;
End $$
Delimiter ;

call large_salaries4(1)


