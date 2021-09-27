-- Q1  Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT hire_date
FROM employees
WHERE emp_no = 101010; 


SELECT first_name, last_name, hire_date

FROM  employees 
WHERE hire_date = 
(SELECT hire_date
FROM employees
WHERE emp_no = 101010 
);

--Q2 Find all the titles ever held by all current employees with the first name Aamod
SELECT emp_no 
FROM employees 
WHERE first_name = "Aamod";


SELECT DISTINCT title 
FROM titles 
WHERE emp_no in (
SELECT emp_no 
FROM employees 
WHERE first_name = "Aamod")
AND to_date > now();

-- Q3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SSELECT COUNT(*)

FROM employees 

WHERE emp_no IN (SELECT emp_no 

FROM dept_emp

WHERE to_date < now());

--Q4 Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name 
FROM employees
WHERE emp_no IN (SELECT emp_no 

FROM dept_manager

WHERE to_date > now()) 
AND gender ='F';
-- their names are: Isamu Legleitner, Karsten Sgstam, Leon DasSarma, and Hilary Kambil

--Q5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT first_name, last_name, AVG(salary)
FROM salaries
JOIN employees using(emp_no)
WHERE salary > (SELECT AVG(salary) FROM salaries)
AND to_date > now()
GROUP BY first_name, last_name;

--Q6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.)
-- What percentage of all salaries is this?

SELECT MAX(salary)
FROM salaries
WHERE to_date > now();

SELECT STD(salary)
FROM salaries
WHERE to_date > now();


SELECT COUNT(salary)
FROM salaries
WHERE to_date > now()
AND salary > ((SELECT MAX(salary)
FROM salaries
WHERE to_date > now()) - (SELECT STD(salary)
FROM salaries
WHERE to_date > now()));

SELECT COUNT(salary)
FROM salaries
WHERE to_date > now();

SELECT (SELECT COUNT(salary)
FROM salaries
WHERE to_date > now()
AND salary > ((SELECT MAX(salary)
FROM salaries
WHERE to_date > now()) - (SELECT STD(salary)
FROM salaries
WHERE to_date > now())))/ (SELECT COUNT(salary)
FROM salaries
WHERE to_date > now()
) * 100;

-- the percentage is 0.0346 %