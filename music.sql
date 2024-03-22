-- Run from the terminal with:
-- psql -f music.sql
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE artists(
  id serial PRIMARY KEY,
  name varchar(50)
);

CREATE TABLE producers(
  id serial PRIMARY KEY,
  name varchar(50)
);

CREATE TABLE albums(
  id serial PRIMARY KEY,
  name varchar(100),
  artist_id integer NOT NULL REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs(
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  duration_in_seconds integer NOT NULL,
  release_date date NOT NULL,
  album_id integer NOT NULL REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE performances(
  id serial PRIMARY KEY,
  song_id integer NOT NULL REFERENCES songs ON DELETE CASCADE,
  artist_id integer NOT NULL REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE productions(
  id serial PRIMARY KEY,
  song_id integer NOT NULL REFERENCES songs ON DELETE CASCADE,
  producer_id integer NOT NULL REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists(name)
  VALUES ('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers(name)
  VALUES ('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO albums(name, artist_id)
  VALUES ('Middle of Nowhere', 1),
('A Night at the Opera', 2),
('Daydream', 3),
('A Star Is Born', 5),
('Silver Side Up', 7),
('The Blueprint 3', 8),
('Prism', 10),
('Hands All Over', 12),
('Let Go', 14),
('The Writing''s on the Wall', 15);

INSERT INTO songs(title, duration_in_seconds, release_date, album_id)
  VALUES ('MMMBop', 238, '1997-04-15', 1),
('Bohemian Rhapsody', 355, '1975-10-31', 2),
('One Sweet Day', 282, '1995-11-14', 3),
('Shallow', 216, '2018-09-27', 4),
('How You Remind Me', 223, '2001-08-21', 5),
('Empire State of Mind', 276, '2009-10-20', 6),
('Dark Horse', 215, '2013-12-17', 7),
('Moves Like Jagger', 201, '2011-06-21', 8),
('Complicated', 244, '2002-05-14', 9),
('Say My Name', 240, '1999-11-07', 10);

INSERT INTO performances(song_id, artist_id)
  VALUES (1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

INSERT INTO productions(song_id, producer_id)
  VALUES (1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);

