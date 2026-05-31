-- Topic   : Triggers and Events
-- Concepts : AFTER INSERT trigger, scheduled Events

-- Trigger : A block of code that executes automatically in response to a DML event (INSERT, UPDATE, DELETE)  on a specified table.

-- Event   : A block of code scheduled to run automatically at a set time or interval (like a cron job inside MySQL).

-- Preview both tables before demonstrating the trigger
Select*
From employee_demographics; 

Select* 
From employee_salary;

-- TRIGGER : employee_insert
-- Problem : New hire data can be added to employee_salary without a matching row in employee_demographics, leaving the tables out of sync.
-- Solution : An AFTER INSERT trigger automatically inserts the basic demographic row whenever a salary row is added.
-- NEW.column_name references the values from the row just inserted.

Delimiter $$
Create Trigger employee_insert
	After Insert On employee_salary
    For Each Row
Begin
	Insert Into employee_demographics (employee_id, first_name,last_name)
    values (New.employee_id, New.first_name, New.last_name);
End $$
Delimiter ;

insert into employee_salary (employee_id,first_name,last_name,occupation,
salary,dept_id)
Values(13,'Reho', 'Papta', 'Intrim CEO', 1000000, Null);

Select*
From employee_salary;

-- EVENT : delete_retirees
-- Scheduled to run every 30 seconds.
-- Automatically removes employees aged 60 or older from employee_demographics (simulating a retirement cleanup job).

-- NOTE: Events require the event scheduler to be enabled.
-- Check its status with the SHOW VARIABLES query below.

Select*
From employee_demographics;

Delimiter $$
Create Event delete_retirees
On Schedule Every 30 Second
Do
Begin
	 Delete
     From employee_demographics
     Where age >= 60;
End $$
Delimiter ;

Show Variables Like 'event%';
