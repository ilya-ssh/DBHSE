CREATE DATABASE music_streaming;
USE music_streaming;

CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    created_at DATETIME
);

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    artist_id INT NOT NULL,
    album_title VARCHAR(255) NOT NULL,
    release_date DATE,
    created_at DATETIME,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    track_title VARCHAR(255) NOT NULL,
    track_duration INT,
    created_at DATETIME,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);
INSERT INTO artists (artist_id, artist_name, country, created_at) VALUES
(1, 'The Beatles', 'UK', '2025-01-10 10:00:00'),
(2, 'Jimi Hendrix', 'USA', '2025-01-10 10:00:00'),
(3, 'Pavement', 'USA', '2025-01-10 10:00:00'),
(4, 'Polvo', 'USA', '2025-01-10 10:00:00'),
(5, 'Silver Jews', 'USA', '2025-01-10 10:00:00'),
(6, 'Boards of Canada', 'Scotland', '2025-01-10 10:00:00'),
(7, 'Kraftwerk', 'Germany', '2025-01-10 10:00:00');
INSERT INTO albums (album_id, artist_id, album_title, release_date, created_at) VALUES
(101, 1, 'Abbey Road', '1969-09-26', '2025-01-10 10:00:00'),
(102, 1, 'Revolver', '1966-08-05', '2025-01-10 10:00:00'),
(201, 2, 'Electric Ladyland', '1968-10-16', '2025-01-10 10:00:00'),
(301, 3, 'Slanted and Enchanted', '1992-04-20', '2025-01-10 10:00:00'),
(401, 4, 'Today''s Active Lifestyles', '1993-04-06', '2025-01-10 10:00:00'),
(501, 5, 'American Water', '1998-10-20', '2025-01-10 10:00:00'),
(601, 6, 'Music Has the Right to Children', '1998-04-20', '2025-01-10 10:00:00'),
(701, 7, 'The Man-Machine', '1978-05-19', '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES
(1001, 101, 'Come Together', 259, '2025-01-10 10:00:00'),
(1002, 101, 'Something', 182, '2025-01-10 10:00:00'),
(1003, 102, 'Eleanor Rigby', 125, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (2001, 201, 'Voodoo Child (Slight Return)', 309, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (3001, 301, 'Summer Babe (Winter Version)', 157, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (4001, 401, 'Thermal Treasure', 269, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (5001, 501, 'Random Rules', 225, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (6001, 601, 'Roygbiv', 391, '2025-01-10 10:00:00');
INSERT INTO tracks (track_id, album_id, track_title, track_duration, created_at) VALUES (7001, 701, 'The Robots', 365, '2025-01-10 10:00:00');

ALTER TABLE tracks DROP COLUMN created_at;

ALTER TABLE albums ADD COLUMN updated_at DATETIME;

DELETE FROM tracks WHERE track_id = 6001;


SELECT track_title FROM tracks WHERE track_duration > 180 AND track_duration < 300;

SELECT artist_name, country FROM artists WHERE country = 'USA' OR country = 'Germany';

SELECT artists.artist_name, artists.country, albums.album_title, tracks.track_title, tracks.track_duration FROM tracks, albums, artists WHERE tracks.album_id = albums.album_id AND albums.artist_id = artists.artist_id AND tracks.track_duration > 120 AND (artists.country = 'USA' OR artists.country = 'UK') AND albums.release_date >= '1990-01-01';