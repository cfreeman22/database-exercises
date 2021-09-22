use `employees`;
 
 
 -- 2 use distinct to find unique titles
 -- After running the query below , we notice that there are 443308 distinct titlies in the titles table
 SELECT DISTINCT COUNT(title)
 FROM titles; 
 
 -- 3 a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY
SELECT last_name, COUNT(*) FROM employees
GROUP BY last_name 
HAVING last_name LIKE 'E%' 
AND last_name LIKE '%E'; 

-- 4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'

SELECT  last_name FROM employees 
GROUP BY last_name 
HAVING last_name LIKE 'E%' 
AND last_name LIKE '%E'; 

-- 5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code
SELECT last_name
FROM employees 
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;