INSERT INTO artists (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
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

INSERT INTO producers (name)
VALUES
  ('Dust Brothers'),
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

INSERT INTO albums (title, release_date)
VALUES
  ('Middle of Nowhere', '1997-04-15'),
  ('A Night at the Opera', '1975-10-31'),
  ('Daydream', '1995-11-14'),
  ('A Star Is Born', '2018-09-27'),
  ('Silver Side Up', '2001-08-21'),
  ('The Blueprint 3', '2009-10-20'),
  ('Prism', '2013-12-17'),
  ('Hands All Over', '2011-06-21'),
  ('Let Go', '2002-05-14'),
  ('The Writing''s on the Wall', '1999-11-07');

INSERT INTO genres (name)
VALUES
  ('Pop'),
  ('Rock'),
  ('R&B'),
  ('Hip Hop');

INSERT INTO songs (title, duration_in_seconds, release_date, album_id, genre_id)
VALUES
  ('MMMBop', 238, '1997-04-15', 1, 1),
  ('Bohemian Rhapsody', 355, '1975-10-31', 2, 2),
  ('One Sweet Day', 282, '1995-11-14', 3, 3),
  ('Shallow', 216, '2018-09-27', 4, 1),
  ('How You Remind Me', 223, '2001-08-21', 5, 2),
  ('New York State of Mind', 276, '2009-10-20', 6, 4),
  ('Dark Horse', 215, '2013-12-17', 7, 1),
  ('Moves Like Jagger', 201, '2011-06-21', 8, 1),
  ('Complicated', 244, '2002-05-14', 9, 1),
  ('Say My Name', 240, '1999-11-07', 10, 3);

  INSERT INTO song_artists (song_id, artist_id)
VALUES
  (1, 1),
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

INSERT INTO song_producers (song_id, producer_id)
VALUES
  (1, 1),
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