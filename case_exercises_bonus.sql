-- BONUS Question  What is the current average salary for each of the following department groups:
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

 SELECT 
      CASE 
         WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
          WHEN dept_name IN ('Sales', 'Marketing') THEN  'Sales & Marketing'
          WHEN dept_name IN ('Finance', 'Human Resources') THEN  'Finance & HR'
          WHEN dept_name IN ('Quality Management', 'Production') THEN 'Prod & QM'
          ELSE dept_name
          END AS dept_group,
          AVG(salary) AS avg_salary
  FROM departments
  JOIN dept_emp USING(dept_no)
  JOIN salaries USING(emp_no)
  WHERE salaries.to_date > now() AND dept_emp.to_date > now()
  GROUP BY dept_group
  ORDER BY dept_group;       
