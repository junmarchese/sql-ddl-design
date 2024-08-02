INSERT INTO galaxies (name)
VALUES
  ('Milky Way'),
  ('Andromeda');

INSERT INTO stars (name, galaxy_id)
VALUES
  ('Sun', (SELECT id FROM galaxies WHERE name = 'Milky Way')),
  ('Sirius', (SELECT id FROM galaxies WHERE name = 'Milky Way')),
  ('Vega', (SELECT id FROM galaxies WHERE name = 'Milky Way'));

INSERT INTO planets (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, (SELECT id FROM stars WHERE name = 'Sun')),
  ('Mars', 1.88, (SELECT id FROM stars WHERE name = 'Sun')),
  ('Venus', 0.62, (SELECT id FROM stars WHERE name = 'Sun'));

INSERT INTO moons (name, orbits_around)
VALUES
  ('Moon', (SELECT id FROM planets WHERE name = 'Earth')),
  ('Phobos', (SELECT id FROM planets WHERE name = 'Mars')),
  ('Deimos', (SELECT id FROM planets WHERE name = 'Mars')); 
  