-- Using CTE's Common table expression
-- A CTE allows us to define a subquery block that can be referenced within the main query. 
-- It is particularly useful for recursive queries or queries that require referencing a higher level

With CTE_Example AS
(
select gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal,COUNT(salary) count_sal
from employee_demographics dem
JOIN employee_salary sal
where dem.employee_id = sal.employee_id
group by gender
)
select AVG(avg_sal) from CTE_Example;

-- Using Multiple CTE'

With CTE_Example AS
(
select employee_id , gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 AS
(
select employee_id , salary
from employee_salary
where salary > 50000
)
select * from CTE_Example
JOIN CTE_Example2
ON CTE_Example.employee_id = CTE_Example2.employee_id;