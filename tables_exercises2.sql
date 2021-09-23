  USE albums_db;
  
  -- Lets find the number of rows in album table
  select * from albums;
  
  select COUNT(*) albums from albums; -- There are 31 rows in the albums table
  
  -- Lets find unique artis names from the albums table
  SELECT COUNT(DISTINCT artist) FROM albums; -- there are 23 artists in the album table
  
  -- lets find the primary key
  show create table albums; -- the PRIMARY KEY  is id 
  
  -- lets find the oldest release day for any album
  
 SELECT * FROM albums
ORDER BY release_date ASC; -- the oldest release date for any album is 1967

-- lets The name of all albums by Pink Floyd

SELECT name FROM albums
WHERE artist = 'Pink Floyd'; -- this displays the name of all albums by Pink Floyd
/*The Dark Side of the Moon
The Wall */

SELECT * FROM albums 
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; -- The year of the release was 1967

SELECT * FROM albums 
WHERE name = 'Nevermind'; -- The genre for thee Nevermind song is Grunge / Alternative Rock

SELECT * FROM albums 
WHERE release_date >= 1990 AND release_date < 2000; -- Album release in the 1990 was The immaculate collection by Madonna

SELECT name  FROM albums -- The Albums that had less than 20 millions sales are 
WHERE sales < 20;
/* Grease: The Original Soundtrack from the Motion Picture
Bad
Sgt. Pepper's Lonely Hearts Club Band
Dirty Dancing
Let's Talk About Love
Dangerous
The Immaculate Collection
Abbey Road
Born in the U.S.A.
Brothers in Arms
Titanic: Music from the Motion Picture
Nevermind
The Wall */
 SELECT genre FROM albums;
 SELECT *  FROM albums 
 Where genre like '%rock%'; -- We have to use the '%' to display all the other types of rocks 
  
 SHOW KEYS FROM albums;
  
 