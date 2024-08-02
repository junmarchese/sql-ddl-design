-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space_revised;

CREATE DATABASE outer_space_revised;

\c outer_space_revised

-- Stars are basic particles of universe and orbit the center of the galaxy.  Galaxies can contain billions of stars and their solar systems. Planets orbit their stars.  

CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id)
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars(id)
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around INTEGER REFERENCES planets(id)
);