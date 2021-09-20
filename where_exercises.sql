USE `employees`;
 -- 2 - Find employees with first name   'Irena', 'Vidya', or 'Maya'
 SELECT first_name FROM employees
     WHERE first_name IN ('Irena', 'Vidya',  'Maya'); -- 709 records were found
     
-- 3 - find employees with first name 'Irena', 'Vidya', or 'Maya' using OR

SELECT first_name FROM employees 
WHERE first_name = 'Irena' 
OR first_name = 'Vidya'
OR first_name = 'Maya'; -- the answer matches the number of rows in Q2 709


-- 4 find employee with first name 'Irena', 'Vidya', or 'Maya' using who is a male
SELECT first_name FROM employees
     WHERE first_name IN ('Irena', 'Vidya',  'Maya')
     AND gender = "M";  -- 441 records were returned 
     
-- 5 - find current or previous emplyees with last name starting with'E'
SELECT last_name FROM employees 
WHERE last_name LIKE 'E%'; -- 7330 are the number of records with employee name starting with 'E'

-- 6 find current or previous emplyees with last name starting or ending with'E'

SELECT last_name FROM employees 
WHERE last_name LIKE '%E' OR last_name LIKE 'E%'; -- 30723 employees have a lastname staht starts or ends with 'E' 

SELECT last_name FROM employees 
WHERE last_name LIKE '%E' AND ( last_name NOT LIKE 'E%'); -- 23393 employes have last names that ends with E but does not starts with E

-- 7 - Number of employees whose lastnames starts and ends with E

SELECT last_name FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E'; -- 899 Records were found for lastnames starting and ending with E

SELECT last_name FROM employees 
WHERE last_name LIKE '%E';  -- 24292 records were found for lastnames ending with E regardless if the strted with E 

-- 8 Find employees hired in the 90s

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; -- 135214 records found

-- 9 Find number of employees born on Christmas 
SELECT * FROM employees
WHERE birth_date LIKE '%12-25'; -- 842 records were found for people born on Christmas days

-- 10 Find Employees hired in the 90s an born on Christmas day

SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND birth_date LIKE '%12-25'; -- 362 records were found

-- 11 Find all current and previous employees with a q in their last names

SELECT * FROM employees 
WHERE last_name LIKE '%q%'; -- 1873 records were found

-- 12 Find All current and previous employees with q in their last name but not qu

SELECT * FROM employees 
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%'; -- 547 records were found








