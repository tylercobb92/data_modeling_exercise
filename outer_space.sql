-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy INTEGER REFERENCES galaxies,
  orbits_around INTEGER REFERENCES stars
);

INSERT INTO planets
  (name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO moons
  (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

INSERT INTO stars
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxies
  (name)
VALUES 
  ('The Milky Way');

UPDATE planets SET orbits_around = 1 WHERE id IN (1,2,3,4);
UPDATE planets SET orbits_around = 2 WHERE id = 5;
UPDATE planets SET orbits_around = 3 WHERE id = 6;

ALTER TABLE moons ADD COLUMN planet INTEGER REFERENCES planets;
UPDATE moons SET planet = 1 WHERE id = 1;
UPDATE moons SET planet = 2 WHERE id IN (2,3);
UPDATE moons SET planet = 3 WHERE id IN (4,5,6,7,8,9,10,11,12,13,14,15,16,17);

UPDATE planets SET galaxy = 1;