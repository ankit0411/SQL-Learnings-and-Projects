-- Subqueries
-- subqueries are queries within queries.

SELECT *
FROM employee_demographics;

-- Now let's say we wanted to look at employees who actually work in the Parks and Rec Department,we could use a subquery
-- We can do that like this:

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id
				FROM employee_salary
                WHERE dept_id = 1);

select AVG (avg_age) from
(select gender , 
AVG(age) as avg_age,
MAX(age) AS max_age,
MIN(age) as min_age,
Count(age) AS count
from employee_demographics
group by gender) as employee;