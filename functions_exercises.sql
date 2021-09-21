

-- Function exercises
--  
use employees;
-- 2 use concaat to combine first name and last name as full name
SELECT CONCAT(first_name, '  ', last_name) AS full_name 
FROM employees
WHERE last_name Like '%e';

-- 3 convert the names queries into uppercase
SELECT UPPER(CONCAT(first_name, '  ', last_name)) AS full_name 
FROM employees
WHERE last_name Like '%e';

-- 4 Find employees born in the 90s and on Christmas, then find how many days they have been working with the company

SELECT *, DATEDIFF (NOW(),hire_date)/365 AS num_of_years FROM employees 
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25';

-- 5 Find the smallest and largest salary
SELECT MIN(salary), MAX(salary) 
FROM salaries;

-- 6 Generate username 
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date, 3,2)))
AS user_name, first_name, last_name, birth_date

FROM employees

LIMIT 10;





