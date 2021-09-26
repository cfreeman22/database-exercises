-- SQL Project on Trends in Startups . Working with a file that contains a table called startups
--Tasks consisit of Writing queries with aggregate functions to retrieve insights about satrtup  companies.

--Q1 lets slook atrt the startup table

SELECT *
FROM startups;

--Q2 Calculate the total number of companies in the table.
SELECT COUNT(*)
FROM startups;

--Q3 We want to know the total value of all companies in this table.

-- Calculate this by getting the SUM() of the valuation column.
SELECT SUM(valuation)
FROM startups;

--Q4 What is the highest amount raised by a startup? Return the maximum amount of money raised.

SELECT MAX(raised)
FROM startups;

-- Q5 Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

--Q6 In what year was the oldest company on the list founded?
elect founded 
from startups
order by founded asc
limit 1;

--Alternative answer
SELECT MIN(founded)
FROM startups;

--Q7 Return the average valuation.
SELECT AVG(valuation)
FROM startups;

--Q8 Return the average valuation, in each category.
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

--Q9 Return the average valuation, in each category. Round the averages to two decimal places.
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

--Q10 Return the average valuation, in each category. Round the averages to two decimal places.

-- Lastly, order the list from highest averages to lowest.
SELECT category, round(avg(valuation),2) AS rounded_avg_valuation
FROM startups
GROUP BY category
ORDER BY rounded_avg_valuation DESC;

-- alternative answer 
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

--Q11 First, return the name of each category with the total number of companies that belong to it.
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

--Q12 Next, filter the result in Q11 to only include categories that have more than three companies in them.

--What are the most competitive markets?
SELECT category, COUNT(*) 
FROM startups
GROUP BY category 
HAVING COUNT(*) > 3;

-- The most competitive markets are Education(5 startups), Mobile(10 startups), and Social(12 startups)


--Q13 What is the average size of a startup in each location?

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

-- Q14 What is the average size of a startup in each location, with average sizes above 500?
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;