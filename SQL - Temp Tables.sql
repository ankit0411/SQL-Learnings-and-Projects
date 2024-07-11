-- Using Temparory Tables
-- Temporary tables are tables that are only visible to the session that created them. 
-- They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.
-- There's 2 ways to create temp tables:
-- way 1 : 
create TEMPORARY TABLE temp_table
( first_name varchar (50),
last_name varchar (50),
gender varchar(10)
);

-- if we execute this it gets created and we can actualyl query it.

select * from temp_table;
-- If we see the Database hierarchy these tables does not exist as these are not an actual table.

-- We can insert data in the temp table

INSERT INTO temp_table
VALUES ('Alex','Freberg','Lord of the Rings: The Twin Towers');

-- now when we run it and execute it again we have our data
SELECT *
FROM temp_table;

-- the second way is much faster and my preferred method
-- 2. Build it by inserting data into it - easier and faster

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

-- if we run this query we get our output
SELECT *
FROM temp_table_2;
