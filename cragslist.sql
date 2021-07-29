DROP DATABASE IF EXISTS cragslist;

CREATE DATABASE cragslist;

/c cragslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region TEXT NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  preferred_region INTEGER REFERENCES regions ON DELETE SET NULL,
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  desciption TEXT,
  username_id INTEGER REFERENCES users ON DELETE SET NULL,
  location TEXT,
  region_id INTEGER REFERENCES regions ON DELETE SET NULL
);

INSERT INTO regions
  (region)
VALUES
  ('Texas'),
  ('Tennessee');

INSERT INTO categories
  (category)
VALUES
  ('Clothing'),
  ('Office');

INSERT INTO users
  (username, preferred_region)
VALUES
  ('davidW', 1),
  ('Horsegirl30', 2);

INSERT INTO posts
  (title, desciption, username_id, location, region_id)
VALUES
  ('Bike Helmet', 'new helmet', 1, 'Houston Heights', 1),
  ('SAT study book', 'used book', 2, 'Rogersville', 2);