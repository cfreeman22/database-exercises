-- ORDER BY Clause
-- 2 
SELECT * FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name; -- The first name and last name of the 1st person ids 'Irena Reutenauer' and the first an last name of the last person is 'Vidya Simmen'

-- 3  Find all employees with first name 'Irena', 'Vidya', or 'Maya' and order by first name
SELECT * FROM employees
     WHERE first_name IN ('Irena', 'Vidya',  'Maya')
     ORDER BY first_name, last_name; -- The first row has 'Irena Acton' as first and last name and the last row has 'Vidya Zweizig' as lat name and first name
     
-- 4 order by last name then first name
SELECT * FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name; -- The first row has 'Irena Acton' as first and last name and the last row has 'Maya Zyda' as lat name and first name

-- 5 Query of all employees name ending with E 
SELECT * FROM employees 
WHERE last_name LIKE '%E'
ORDER BY emp_no; -- 24292 records returned - first employee number is 10021 with 'Ramzi Erde' as first and last name and the last employee number is 499994 with 'Navin Argence' as first and last name


-- 6 Query of all employees name ending with E and sorted by hire date
SELECT * FROM employees 
WHERE last_name LIKE '%E'
ORDER BY hire_date DESC; -- 24292 records returned - newest employee number is 499553 with 'Hideyuki Delgrande' as first and last name and the oldest employee hired number is 110725 with 'Peternela Onuegbe' as first and last name

-- 7 employees hired in the 90s sort by oldest employee

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND birth_date LIKE '%12-25'
ORDER BY  birth_date ASC, hire_date DESC; -- 362 records returned The oldest employee hired is 'Khun Bernini' and the yougest employee hired first is 'Douadi Pettis'








