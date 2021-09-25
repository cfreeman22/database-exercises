-- This project consist of performing a series of queries in a reatuarant database

-- Q1 Lets Start by getting a feel for the nomnom table:

SELECT * FROM nomnom;

--Q2 What are the distinct neighborhoods?
SELECT DISTINCT(neighborhood)
FROM nomnom;

--Q3 What are the distinct cusines?
SELECT DISTINCT(cusine)
FROM nomnom;


-- Q4 Suppose we would like some Chinese takeout.What are our options?
SELECT * 
FROM nomnom
WHERE cuisine = 'Chinese';

-- Q5 Return all the restaurants with reviews of 4 and above.

SELECT * 
FROM nomnom
WHERE review >= 4;

--Q6 Suppose Abbi and Ilana want to have a fancy dinner date. Return all the restaurants that are Italian and $$$.

SELECT *
FROM nomnom
WHERE price ='$$$'
AND cuisine ='Italian';

-- Q7 Your coworker Trey can’t remember the exact name of a restaurant he went to but he knows it contains the word ‘meatball’ in it.
-- Can you find it for him using a query?
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

-- Q8 Let’s order delivery to the house! Find all the close by spots in Midtown, Downtown or Chinatown.(OR can be used more than once)
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown' 
OR neighborhood ='Downtown'
OR neighborhood ='Chinatown' ;

-- Q9 Find all the health grade pending restaurants (empty values).
SELECT *
FROM nomnom
WHERE health IS NULL;

-- Q10 Create a Top 10 Restaurants Ranking based on reviews.

SELECT *
FROM nomnom
ORDER BY REVIEW DESC
LIMIT 10;

--Q11 Use a CASE statement to change the rating system and rename the new column as Quality
SELECT name,
CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
END AS Quality 
FROM nomnom;

