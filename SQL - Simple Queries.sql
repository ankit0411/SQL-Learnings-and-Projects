select first_name , first_name from employee_demographics;

select gender, AVG(age) , count(age) from employee_demographics group by gender;

select LENGTH ('ankit');

select first_name , LENGTH (first_name)
from employee_demographics
order by LENGTH( first_name);

select UPPER ('ankit');
select LOWER ( 'ANKIT');

select first_name , UPPER (first_name) 
from employee_demographics;

select RTRIM('     ANKIT         ');

-- Left and Right String Select and SUBSTRING

Select first_name , 
LEFT(First_name, 4) AS 'left',
RIGHT(First_name, 4) AS 'Right',
SUBSTRING( First_name,3,4),
birth_date,
SUBSTRING( birth_date,6,2)
from employee_demographics;


-- REPLACE
select first_name , REPLACE (first_name, 'a','z')
from employee_demographics;

-- LOCATE
Select LOCATE('i', 'ANKIT');

select first_name , LOCATE ('an',first_name)
from employee_demographics;

-- CONCAT
select first_name , last_name,
CONCAT (first_name,' ', last_name) AS 'full_name'
from employee_demographics;
