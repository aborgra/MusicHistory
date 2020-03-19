INSERT INTO Genre (Label) VALUES ('Techno');

SELECT SongLength from Song WHERE Id = 18;


UPDATE Song
SET SongLength = 515
WHERE Id = 18;

SELECT SongLength from Song WHERE Id = 18;

DELETE from Song WHERE Id = 18;

SELECT * from Genre;

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Queen', 1979);

INSERT INTO Album(Title, ReleaseDate, AlbumLength,[Label], ArtistId, GenreId) VALUES ('Queen', 1979, 2000, 'Columbia', 28, 2);

INSERT INTO Song(Title, SongLength, ReleaseDate, AlbumId, GenreId, ArtistId) VALUES ('Bohemian Rhapsody',360, 1979, 23, 2, 28);

SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

SELECT s.Title, a.Title, art.ArtistName, g.[Label]
from Song s
LEFT JOIN Album a on s.AlbumId = a.Id
LEFT JOIN Artist art on s.ArtistId = art.Id
LEFT JOIN Genre g on s.GenreId = g.Id;

SELECT COUNT(AlbumId) as 'Song Count', a.Title 
from Song s
LEFT JOIN Album a on s.AlbumId = a.Id
GROUP BY AlbumId, a.Title;

SELECT COUNT(GenreId) as 'Song Count', g.Label
from Song s
LEFT JOIN Genre g on s.GenreId = g.Id
GROUP BY GenreId, g.Label;


SELECT COUNT(ArtistId) as 'Song Count', art.ArtistName
from Song s
LEFT JOIN Artist art on s.ArtistId = art.Id
GROUP BY ArtistId, art.ArtistName;


SELECT Title, AlbumLength as 'Album Length'
from Album
WHERE AlbumLength=(SELECT MAX(AlbumLength) from Album);


SELECT s.Title, a.Title, SongLength as 'Song Length'
from Song s
LEFT JOIN Album a on s.AlbumId = a.Id
WHERE SongLength=(SELECT MAX(SongLength) from Song);
