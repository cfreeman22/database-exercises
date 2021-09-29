-- Q1 Write a query that returns all employees (emp_no), their department number, their start date, their end date,
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
use employees;

SELECT  emp_no, dept_no, from_date, to_date,
      CASE 
            WHEN dept_emp.to_date > CURDATE() THEN 1
            
              ELSE   0
              
               END AS is_current_employee  
FROM dept_emp;    

--Q2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
--that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT  first_name, last_name,
   CASE 
        WHEN last_name BETWEEN 'A%' AND 'I%' THEN 'A-H'
          WHEN last_name BETWEEN 'I%' AND 'R%' THEN 'I-Q'
          WHEN last_name BETWEEN 'R%' AND 'Z%' OR last_name LIKE 'Z%' THEN 'R-Z'
          
          ELSE 'Not found in Alpha_group'
          
          END AS Alpha_group
FROM employees
ORDER BY last_name;

-- Q3 How many employees (current or previous) were born in each decade?
use employees;


-- We will start off by finding the number of employees born per year 
select birth_date,  count(*) as num_of_employees_per_birthyear  FROM employees 
WHERE birth_date LIKE '195%' OR birth_date LIKE '196%'
group by birth_date;

-- Now we will use the result to build our case by aliassing the first relect query in our case


SELECT   SUM(num_of_employees_per_birthyear) AS num_of_employees,
   CASE 
        WHEN birth_date LIKE '195%' THEN 'Born in the 1950s'
          WHEN birth_date LIKE'196%' THEN 'Born in the 1960s'
           ELSE 'Birth year Not found'
          
          END AS birth_decade
FROM (select birth_date,  count(*) as num_of_employees_per_birthyear  FROM employees 
        WHERE birth_date LIKE '195%' OR birth_date LIKE '196%'
         group by birth_date) AS E
GROUP BY birth_decade;
    

 -- 182886 employees wereborn in the 1950's
 -- and 117138 employees were born in the 1960's



