 /* Hacker News is a popular website run by Y Combinator. 
It’s widely known by people in the tech industry as a community site for sharing news, showing off projects, asking questions, among other things.

In this project, you will be working with a table named hacker_news that contains stories from Hacker News since its launch in 2007. 
It has the following columns:

title: the title of the story
user: the user who submitted the story
score: the score of the story
timestamp: the time of the story
url: the link of the story
This data was kindly made publicly available under the MIT license.

Let’s get started! */

-- Q1 Start by getting a feel for the hacker_news table! Let’s find the most popular Hacker News stories:
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- What are the top five stories with the highest scores?
/* The most popular stories are:
 - Penny Arcade - Surface Pro 3 update
 - Hacking The Status Game’
 - Postgres CLI with autocompletion and syntax highlighting’
 - Stephen Fry hits out at ‘infantile’ culture of trigger words and safe spaces’
 - Reversal: Australian Govt picks ODF doc standard over Microsoft’ */

 -- Q2 
 /* Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).

Is this true of Hacker News?

Is a small percentage of Hacker News submitters taking the majority of the points?

First, find the total score of all the stories.*/
SELECT SUM(score)
FROM hacker_news;

-- The total score of this table is 6366.

--Q3 Next, we need to pinpoint the users who have accumulated a lot of points across their stories.

-- Find the individual users who have gotten combined scores of more than 200, and their combined scores.
ELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY score DESC;

-- Result
/*
-- user vxNsr, score = 517
-- user amirkhella	score = 309
-- user dmmalam score =	304
-- user metafunctor	score = 282

*/
-- Q4
-- Then, we want to add these users’ scores together and divide by the total to get the percentage.
-- So, is Hacker News dominated by these users?
SELECT (517.0 + 309.0 + 304.0 + 282.0/ 6366.0;

-- we notice that 4 hackers have a combined 22%  of the total score

--Q5
/*
Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.

The url of the video is:

https://www.youtube.com/watch?v=dQw4w9WgXcQ

How many times has each offending user posted this link?
*/
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%/watch?v=dQw4w9WgXcQ%'
GROUP BY user
ORDER BY COUNT(*) DESC;
-- user sonnynomnom	 posteted 2 such links and user scorpiosister posted 1

-- Alternative answer
SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

 -- Q6 Which of these sites feed Hacker News the most: GitHub, Medium, or New York Times?

 -- First, we want to categorize each story based on their source.
SELECT CASE
WHEN url LIKE '%github.com%' THEN 'GitHub'
WHEN url LIKE '%medium.com%' THEN 'Medium'
WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
ELSE 'Other'
END AS 'Source'
FROM hacker_news;

-- Q7 Next, build on the previous query: Add a column for the number of stories from each URL 

SELECT CASE
WHEN url LIKE '%github.com%' THEN 'GitHub'
WHEN url LIKE '%medium.com%' THEN 'Medium'
WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
ELSE 'Other'
END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY Source;
 
 /*
 The number of times stories are linked to:

GitHub - 23
Medium - 12
New York Times - 13
 */

 --Q8 Every submitter wants their story to get a high score so that the story makes it to the front page, but…

-- What’s the best time of the day to post a story on Hacker News?

-- Before we get started, let’s run this query and take a look at the timestamp column:
SELECT timestamp
FROM hacker_news
LIMIT 10;

/* we notice how the timestamp is formatted
2014-01-27T17:31:13Z
2011-10-23T18:46:40Z
2016-02-28T06:26:56Z
2014-08-12T22:13:10Z
2013-03-06T12:28:02Z
2011-04-16T21:04:23Z
2014-03-18T21:44:46Z
2012-11-19T11:54:38Z
2016-11-04T13:55:30Z
2016-07-02T22:54:47Z

If we ignore the T and Z, the format is:

YYYY-MM-DD HH:MM:SS
*/
 
 --Q9 
 /*
 Let’s Round the average scores (ROUND()).

Rename the columns to make it more readable (AS).

Add a WHERE clause to filter out the NULL values in timestamp.
What are the best hours to post a story on Hacker News?
 */
  SELECT timestamp,
   strftime('%H', timestamp), ROUND(AVG(score),1) AS 'Average Score', COUNT(*) AS 'The Number OF Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY timestamp 
ORDER BY timestamp;

-- We notice that the best time to post a story is 7 AM and between 6 and 8 PM