INSERT INTO Artists (Artist_name) VALUES
('Aparshakti Khurana'),
('Ed Sheeran'),
('Shreya Ghoshal'),
('Arijit Singh'),
('Tanishk Bagchi');

SET IDENTITY_INSERT Albums OFF;

INSERT INTO Albums (Album_id, Album_title, Artist_id, Release_year) VALUES
(1001, 'Album1', 1, 2019),
(1002, 'Album2', 2, 2015),
(1003, 'Album3', 3, 2018),
(1004, 'Album4', 4, 2020),
(1005, 'Album5', 2, 2020),
(1006, 'Album6', 1, 2009);

SET IDENTITY_INSERT Songs ON;

INSERT INTO Songs (Song_id, Song_title, Duration, Genre, Album_id) VALUES
(101, 'Zaroor', 2.55, 'Feel good', 1001),
(102, 'Espresso', 4.10, 'Rhythmic', 1002),
(103, 'Shayad', 3.20, 'Sad', 1003),
(104, 'Roar', 4.05, 'Pop', 1002),
(105, 'Everybody Talks', 3.35, 'Rhythmic', 1003),
(106, 'Dwapara', 3.54, 'Dance', 1002),
(107, 'Sa Re Ga Ma', 4.20, 'Rhythmic', 1004),
(108, 'Tauba', 4.05, 'Rhythmic', 1005),
(109, 'Perfect', 4.23, 'Pop', 1002),
(110, 'Good Luck', 3.55, 'Rhythmic', 1004);



SELECT * FROM ARTISTS;
SELECT * FROM Albums;
SELECT * FROM Songs;



-- Part – A
-- 1. Retrieve a unique genre of songs.
SELECT DISTINCT genre FROM Songs;
-- 2. Find top 2 albums released before 2010.
SELECT TOP 2 Album_title FROM Albums 
WHERE Release_year<2010
-- 3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SongS VALUES (1245, 'Zaroor', 2.55, 'Feel good', 1005)
-- 4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS 
SET Genre = 'Happy'
WHERE Song_title = 'Zaroor'

-- 5. Delete an Artist ‘Ed Sheeran’
DELETE FROM Artists 
WHERE Artist_name = 'Ed Sheeran'

SELECT * FROM Artists
-- 6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SongS
ADD Ratings decimal(3,2)

SELECT * FROM SongS
-- 7. Retrieve songs whose title starts with 'S'.
SELECT * FROM SONGS 
WHERE Song_title LIKE 'S%'

-- 8. Retrieve all songs whose title contains 'Everybody'.
SELECT * FROM SongS
WHERE Song_title LIKE '%Everybody%'
-- 9. Display Artist Name in Uppercase.
SELECT UPPER(Artist_name) 
FROM Artists
-- 10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(Duration)
FROM SONGS
WHERE Song_title='Good Luck'
-- 11. Find Current Date.
SELECT GETDATE()
-- 12. Find the number of albums for each artist.
SELECT A2.Artist_name,COUNT(*) AS NUMBER_OF_ALBUMS FROM Albums A1
JOIN Artists A2 ON A1.Artist_id=A2.Artist_id
GROUP BY A2.Artist_name;
-- 13. Retrieve the Album_id which has more than 5 songs in it.
SELECT A.Album_id FROM Albums A 
JOIN Songs S ON A.Album_id=S.Album_id
GROUP BY A.Album_id
HAVING COUNT(*)>5

-- 14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT * FROM Songs S
WHERE S.Album_id IN (
    SELECT A.Album_id FROM Albums A
    WHERE A.Album_title='Album1'
)

-- 15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)

SELECT * FROM Albums A1
WHERE A1.Artist_id = (
    SELECT A2.Artist_id FROM Artists A2
    WHERE A2.Artist_name = 'Aparshakti Khurana'
);

-- 16. Retrieve all the song titles with its album title.
SELECT S.Song_title,A.Album_title FROM Songs S 
JOIN Albums A ON A.Album_id=S.Album_id;
-- 17. Find all the songs which are released in 2020.
SELECT S.* FROM Songs S 
JOIN Albums A ON A.Album_id=S.Album_id
WHERE A.Release_year=2020;
-- 18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW VW_FAV_SONGS
AS SELECT * FROM Songs S 
WHERE S.Song_id BETWEEN 101 AND 105;

SELECT * FROM VW_FAV_SONGS;
-- 19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE VW_FAV_SONGS
SET Song_title='Jannat'
WHERE Song_id=101;

SELECT * FROM VW_FAV_SONGS
-- 20. Find all artists who have released an album in 2020.
SELECT A1.* FROM Artists A1
JOIN Albums A2 ON A1.Artist_id=A2.Artist_id
WHERE A2.Release_year=2020;
-- 21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT S.* FROM Artists A1
JOIN Albums A2 ON A1.Artist_id=A2.Artist_id
JOIN Songs S ON A2.Album_id=S.Album_id
WHERE A1.Artist_name='Shreya Ghoshal';
-- Part – B
-- 22. Retrieve all song titles by artists who have more than one album.
SELECT A1.Artist_name,S.Song_title 
FROM Artists A1
JOIN Albums A2 ON A1.Artist_id=A2.Artist_id
JOIN Songs S ON A2.Album_id=S.Album_id
WHERE A1.Artist_id IN (
    SELECT A2.Artist_id 
    FROM Albums A2 
    GROUP BY A2.Artist_id
    HAVING COUNT(A2.Artist_id) > 1
)
-- 23. Retrieve all albums along with the total number of songs.
SELECT A.Album_title,COUNT(S.Song_id) AS SONGS_COUNT
FROM Albums A 
JOIN Songs S ON A.Album_id=S.Album_id
GROUP BY A.Album_title
-- 24. Retrieve all songs and release year and sort them by release year.
SELECT S.Song_title,A.Release_year
FROM Albums A 
JOIN Songs S ON A.Album_id=S.Album_id
ORDER BY A.Release_year
-- 25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT S.Genre,COUNT(S.Song_id) AS COUNT_SONG
FROM Songs S
GROUP BY S.Genre
HAVING COUNT(S.Song_id)>2
-- 26. List all artists who have albums that contain more than 3 songs.
SELECT A1.Artist_name FROM Artists A1
JOIN Albums A2 ON A1.Artist_id=A2.Artist_id
WHERE A2.Album_id IN (
    SELECT S1.Album_id
    FROM Songs S1
    GROUP BY S1.Album_id
    HAVING COUNT(S1.Song_id) > 3
)
-- Part – C
-- 27. Retrieve albums that have been released in the same year as 'Album4'
SELECT A.*
FROM Albums A 
WHERE A.Release_year IN (
    SELECT Release_year
    FROM Albums
    WHERE Album_title='Album4'
)
-- 28. Find the longest song in each genre
SELECT S.Genre,MAX(S.Duration) AS LONGEST_SONG
FROM Songs S 
GROUP BY S.Genre;
-- 29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
SELECT S.Song_title 
FROM Albums A 
JOIN Songs S ON A.Album_id = S.Album_id
WHERE A.Album_title LIKE '%ALBUM%';
-- 30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
SELECT A1.Artist_name,SUM(S.Duration) AS TOTAL_DURATION
FROM Artists A1
JOIN Albums A2 ON A1.Artist_id=A2.Artist_id
JOIN Songs S ON A2.Album_id=S.Album_id
GROUP BY A1.Artist_name
HAVING SUM(S.Duration) > 15
