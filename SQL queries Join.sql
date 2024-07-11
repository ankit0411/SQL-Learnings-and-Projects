select first_name , first_name from employee_demographics;
select gender, AVG(age) , count(age) from employee_demographics group by gender;

select * from employee_demographics;

select * from employee_salary;

-- INNER JOIN --
select D.employee_id , age , occupation from employee_demographics as E
INNER JOIN employee_salary as D
ON E.employee_id = D.employee_id;


-- OUTER JOINS

select * from employee_demographics as E
RIGHT JOIN employee_salary as D
ON E.employee_id = D.employee_id;


-- SELF JOIN

select E1.employee_id as emp_santa, E1.first_name as First_Name_Santa,
E1.last_name as Last_Name_Santa,E2.employee_id as emp_santa, E2.first_name as First_Name_Santa,
E2.last_name as Last_Name_Santa
from  employee_salary AS E1
JOIN employee_salary as E2
ON E1.employee_id +1 = E2.employee_id;

-- UNION

Select First_name , Last_name , 'OLD' as Label
from employee_demographics
where age > 40 and gender = 'Male'
UNION
Select First_name , Last_name , 'OLD LADY' as Label
from employee_demographics
where age > 40 and gender = 'Female'
UNION
Select First_name , Last_name , 'highly paid employee' as Label
from employee_salary
where salary > 70000
order by first_name , last_name;
