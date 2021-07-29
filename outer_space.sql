DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  -- I have normally seen foreign keys have the original table 
  -- name and '_id' (ex: stars_id), is that standard?
  orbits_around INTEGER REFERENCES stars ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES galaxy ON DELETE SET NULL
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE SET NULL,
  moon_id INTEGER REFERENCES moons ON DELETE SET NULL
);

INSERT INTO galaxies
  (galaxy)
VALUES
  ('Milky Way');

INSERT INTO moons
  (moon)
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
  ('Sao');


INSERT INTO stars
  (star)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (planet, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

INSERT INTO planets_moons
  (planet_id, moon_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (4, 7),
  (4, 8),
  (4, 9),
  (4, 10),
  (4, 11),
  (4, 12),
  (4, 13),
  (4, 14);