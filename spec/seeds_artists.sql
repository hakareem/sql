TRUNCATE TABLE artists RESTART IDENTITY; 
TRUNCATE TABLE albums RESTART IDENTITY; 


INSERT INTO artists (name, genre) VALUES ('Rox', 'Pop');
INSERT INTO artists (name, genre) VALUES ('Loe', 'Rock');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Fly',1992,1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Slo',2000,1);