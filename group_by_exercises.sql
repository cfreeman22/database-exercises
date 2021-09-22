
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

-- 6 The number of employees with the respective last name in quey no 5
SELECT COUNT(last_name)
FROM employees 
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

-- 7 Count employees with  and group by first name and the number of employees
SELECT first_name, gender, COUNT(*) FROM employees
WHERE first_name IN ('Irena', 'Vidya',  'Maya')
GROUP BY first_name, gender; 

-- 8 Generate username a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name,1,4),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date, 3,2)))
AS user_name, COUNT(*)
FROM employees 
GROUP BY user_name
HAVING COUNT(*) = 4; -- Number of duplicates  24916 + 2115 + 288 + 60 = 27 379
-- 

-- 9 More practice with aggregate functions
-- 9a Find the historic average salary for all employees. And actual average

SELECT AVG(salary) AS historic_average_salary -- Average historic salary 63810.74
FROM salaries
ORDER BY from_date, to_date;

SELECT AVG(salary)
FROM salaries
WHERE to_date LIKE '999%';     -- Average current salary is 72012.23

SELECT * FROM salaries;

-- 9b Now find the historic average salary for each employee

SELECT emp_no, AVG(salary) 
FROM salaries
WHERE to_date < NOW()
GROUP BY emp_no;

-- 9c Find the current average salary for each employee.

SELECT emp_no, AVG(salary)
FROM salaries
WHERE to_date > now()
GROUP BY emp_no;

-- 9d Find the maximum salary for each employee

SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

-- 9e Now find the max salary for each current employee where that max salary is greater than $150,000.
SELECT emp_no, MAX(salary)
FROM salaries
WHERE to_date > CURDATE()
GROUP BY emp_no
HAVING MAX(salary) > 150000;

-- 9f Find the current average salary for each employee where that average salary is between $80k and $90k
SELECT emp_no, AVG(salary)
FROM salaries
WHERE to_date > CURDATE()
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 90000;

