-- Join Example Database 

use `join_example_db`;

select * From roles;

select * from users;


-- 2 Use join,  left join , right joint, 
-- join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- right join

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

--
-- Employee Database


-- 2 write a query that shows each department along with the name of the current manager for that department.
use employees;


select dept_name AS 'Department Name', CONCAT(first_name,' ', last_name) AS 'Department Manager'
from dept_manager
join employees ON dept_manager.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > now();

-- 3 Find the name of all departments currently managed by women.

select dept_name AS 'Department Name', CONCAT(first_name,' ', last_name) AS 'Department Manager'
from dept_manager
join employees ON dept_manager.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > now()
AND gender = 'F';

-- 4 Find the current titles of employees currently working in the Customer Service department.
select title AS Title, COUNT(title) AS Count
from employees
join titles 
ON titles.emp_no =  employees.emp_no
join dept_emp 
ON dept_emp.emp_no = employees.emp_no
join departments 
on  departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Customer Service'
AND dept_emp.to_date > now()
AND titles.to_date >now()
GROUP BY title;

-- 5 Find the current salary of all current managers.
select dept_name AS 'Department Name', CONCAT(employees.first_name,' ', employees.last_name) AS Name, salary AS 
Salary
from employees
join dept_manager ON dept_manager.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_manager.dept_no
join salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name, Name, Salary;

-- 6 Find the number of current employees in each department.
select departments.dept_no, departments.dept_name AS 'Department Name',  COUNT(*) AS num_employees
from employees
join dept_emp ON dept_emp.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date > now()
GROUP BY dept_name
ORDER BY dept_no;


-- 7 Which department has the highest average salary? Hint: Use current not historic information.
select departments.dept_name AS 'Department Name', AVG(salaries.salary)
from departments
join dept_emp ON dept_emp.dept_no = departments.dept_no
join salaries ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date > now()
GROUP BY dept_name
ORDER BY AVG(salaries.salary) DESC
LIMIT 1;

-- 8 Who is the highest paid employee in the Marketing department?
select dept_name AS 'Department Name', CONCAT(employees.first_name,' ', employees.last_name) AS Name from employees

join dept_emp ON dept_emp.emp_no = employees.emp_no
join salaries ON salaries.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_emp.dept_no

WHERE dept_name = 'Marketing'
AND salaries.to_date >now()
ORDER BY salary DESC
LIMIT 1;


-- 9 Which current department manager has the highest salary?
select dept_name AS 'Department Name', CONCAT(employees.first_name,' ', employees.last_name) AS Name, salary AS 
Salary
from employees
join dept_manager ON dept_manager.emp_no = employees.emp_no
join departments ON departments.dept_no = dept_manager.dept_no
join salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > now()
AND salaries.to_date > now()
GROUP BY dept_name, Name, Salary
ORDER BY MAX(Salary) DESC
LIMIT 1;

-- 10 a) Bonus Find the names of all current employees, their department name, and their current manager's name.


-- 10 b) Bonus Find the names of all current employees, their department name, and their current manager's name.

