-- Create a Table
/*In this project, I will create my ficticious friends table and add/delete data from it!*/

-- Q1 Create a table named friends with three columns:

/*id that stores INTEGER
name that stores TEXT
birthday that stores DATE*/

CREATE TABLE friends(id INTEGER,
                      name TEXT,
                      birthday DATE );


--Q2 add Ororo Munroe to friends. Her birthday is May 30th, 1940.
INSERT INTO friends(id, name, birthday) values (1, 'Ororo Munroe', 'May 30th, 1940' );


-- Q3 Let’s make sure that Ororo has been added to the database:
SELECT * FROM friends;


-- 4 Let's  Add two of my friends to the table. Insert an id, name, and birthday for each of them.
INSERT INTO friends(id, name, birthday) values (2, 'Eric Smith', 'Jun 13th, 1985' );
INSERT INTO friends(id, name, birthday) values (3, 'Amigo French', 'Dec 9th, 1990' );


--Q5 Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”. Let's'Update her record in friends.
UPDATE friends
SET name = 'Ororo Storm'
WHERE id = 1;


-- Q6 Add a new column named email.
ALTER TABLE friends
ADD COLUMN email TEXT;


-- Q7 Update the email address for everyone in my table with their last name.
UPDATE friends
SET email = "storm@codecademy.com"
WHERE id = 1;

UPDATE friends
SET email = "smith@codecademy.com"
WHERE id = 2;

UPDATE friends
SET email = "french@codecademy.com"
WHERE id = 3;

-- Q8 UPDATE friends .Wait, Storm is fictional Remove her from friends
 
DELETE FROM friends
WHERE id =1;


-- Q9 Let’s take a look at the result one last time:

SELECT * FROM friends;