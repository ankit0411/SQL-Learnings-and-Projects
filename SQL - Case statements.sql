-- Case Statement
-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel


select first_name, last_name, age,
CASE
	WHEN age <=30 THEN 'Young'
    WHEN age BETWEEN 30 and 50 THEN 'OLD'
    WHEN age >= 50 THEN 'Super Old'
END AS 'Age Category'
from employee_demographics;

-- Another scenario where we can use case after comparing salaries
-- Salary < 50000 = 5%
-- Salary > 50000 = 7%
-- Finance = 10% Bonus

select * from employee_salary;
select * from parks_departments;

select first_name, last_name, salary,
CASE
	WHEN salary <50000 THEN salary + (salary * 0.05)
    WHEN salary >50000 THEN salary + (salary * 0.07)
END AS New_Salary,
CASE
WHEN dept_id = 6 THEN salary + (salary *0.01)
END AS Bonus
from employee_salary;