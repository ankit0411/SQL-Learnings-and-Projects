-- Trigger and Events

-- a Trigger is a block of code that executes automatically executes when an event takes place in a table.


SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;

-- We need a trigger to update the the correct invoice when we get a new row or data is inserted into the employee_salary table

USE parks_and_recreation;
DELIMITER $$
Create Trigger employee_insert
	AFTER INSERT ON employee_salary
    for each row
BEGIN
	insert into employee_demographics(employee_id, first_name, last_name)
    values(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Now insert a value in employee_salary table

Insert into employee_salary (employee_id, first_name, last_name, occupation,
salary, dept_id)
VALUES (13,'joseph','daniels','sports director', 100000, NULL);
-- After this query is run the trigger is triggered to update the employee_demographics table


select * from employee_salary;

select * from employee_demographics;


-- EVENTS
-- Events are task or block of code that gets executed according to a schedule. 


SELECT * 
FROM parks_and_recreation.employee_demographics;

DROP EVENT IF EXISTS retiree_employee;
DELIMITER $$
create event retiree_employee
on schedule every 20 second
do
begin
	delete
    FROM employee_demographics
    where age >=60;
END $$
DELIMITER ;