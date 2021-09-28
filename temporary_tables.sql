-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. 

-- 1 
CREATE TEMPORARY TABLE  hopper_1553.employees_with_departments AS (
SELECT first_name, last_name, dept_no
from employees
join dept_emp using(emp_no));

use hopper_1553;

-- 1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE employees_with_departments
ADD COLUMN full_name VARCHAR(255);

-- 1b Update the table so that full name column contains the correct data

UPDATE employees_with_departments
SET full_name  = CONCAT(first_name,'  ',last_name);

-- 1c Remove the first_name and last_name columns from the table
ALTER TABLE employees_with_departments
DROP COLUMN first_name;

ALTER TABLE employees_with_departments
DROP COLUMN last_name;

-- 1d What is another way you could have ended up with this same table?
-- WITH the CREATE  TABLE 
-- let's check if our table was created
SELECT * FROM employees_with_departments;

-- Q2 Create a temporary table based on the payment table from the sakila database.
use sakila;


--Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

SELECT TRUNCATE((amount* 100),0) AS 'Amount in Cents'
from payment;

CREATE TEMPORARY TABLE hopper_1553.amount_as_integer_values AS
SELECT TRUNCATE((amount * 100),0) AS 'Amount in Cents'
FROM payment;
  
  -- Instructor's answer 
  -- use alter to alter the table and add a column cent and set cents to column(amount *100)
 -- Q3

 use employees;


-- Finding standard deviation
SELECT STD(salary)
FROM salaries;

-- Findiing Historic avreage salary
SELECT AVG(salary)
FROM salaries;

CREATE TEMPORARY TABLE hopper_1553.comparing_salaries AS
SELECT dept_name, AVG(salary) AS current_avg
FROM salaries s
JOIN dept_emp de USING(emp_no) 
JOIN departments d USING (dept_no)
WHERE s.to_date > now() AND de.to_date > now()
GROUP BY dept_name;

SELECT * from  hopper_1553.comparing_salaries;

-- ALter table 
ALTER TABLE  hopper_1553.comparing_salaries
DROP COLUMN z_score;

ALTER TABLE  hopper_1553.comparing_salaries
ADD COLUMN std float(10,2);

ALTER TABLE  hopper_1553.comparing_salaries
ADD COLUMN z_score float(10,2);

UPDATE hopper_1553.comparing_salaries
SET historic_avg = (SELECT AVG(salary)
FROM salaries);

UPDATE hopper_1553.comparing_salaries
SET std = current
FROM salaries);

UPDATE hopper_1553.comparing_salaries
SET z_score = (current_avg - historic_avg)/ std;

-- Partial Instructor's answers

-- Find average historic salary

use employees;

SELECT round(avg(salary)) from salaries;

-- Find average historic salary

SELECT ROUND(stddev(salary)) FROM salaries;

-- Find current average pay by department

SELECT dept_name, round(av(salary))
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE salaries.to_date > now() AND dept_emp.to_date >now()
GROUP BY dept_name;



 