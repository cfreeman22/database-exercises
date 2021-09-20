-- LIMIT Exercise
-- 2 Info on how to use distinct
-- 3 limit to 5 records for employeeSELECT * FROM employees
SELECT * FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;       -- The first person hired in the 90s is 'Alsem Capello' andthe 5th person is 'Petter Stroustrup'


-- 4 using OFFset limit the page by 5 results skipping the first 45
SELECT * FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;    



