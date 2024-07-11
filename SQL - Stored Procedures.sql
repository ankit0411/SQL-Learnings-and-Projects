-- Create procedures

-- first use the database

USE `parks_and_recreation`;

-- Now create procedure

create procedure high_salaries()
select * from employee_salary
where salary >= 50000;

-- Now if we run this it will work and create the stored procedure
-- we can click refresh on the database and see that it is there

-- If we want to call it and use it we can call it by saying:
call high_salaries();

-- Procedure with multiple queries
-- Here the best practise is to change the delimeter as there are multiple queries in the procedure

DELIMITER $$
create procedure high_salary1()
begin
select * from employee_salary
where salary >= 50000;
select * from employee_salary
where salary >= 100000;
END $$
-- now we change the delimiter back after we use it to make it default again
DELIMITER ;

CALL high_salary1();

-- Stored Procedure with Parameter

DELIMITER $$
create procedure high_salary2(employee_id_salary INT)
begin
select salary from employee_salary
where employee_id = employee_id_salary;
END $$
DELIMITER ;

CALL high_salary2(1);