-- using the use command to use the employees database
use `employees`;
-- Using the show command to show all tables in the database
show tables;
-- looking up data types in the tables
SELECT * from `current_dept_emp`;
-- Looking up the type variables in the database
describe `employees`;
-- there are many data types including int, varchar, and text

select * from salaries;
select * from titles;
select * from departments;
select * from employees;
-- The department number contains a numeric type, the title table contains a string and the date type in the from_date  to to_date 

-- The relationship between employees and departments is that we may identify which employee is a staff of a particular department.
-- 10)
show create table dept_manager;
-- CREATE TABLE `dept_manager` (↵  `emp_no` int NOT NULL,↵  `dept_no` char(4) NOT NULL,↵  `from_date` date NOT NULL,↵  `to_date` date NOT NULL,↵  PRIMARY KEY (`emp_no`,`dept_no`),↵  KEY `dept_no` (`dept_no`),↵  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,↵  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT↵) ENGINE=InnoDB DEFAULT CHARSET=latin1
