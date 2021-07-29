DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passagers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airline ON DELETE SET NULL,
  from_city INTEGER REFERENCES city ON DELETE SET NULL,
  from_country INTEGER REFERENCES country ON DELETE SET NULL,
  to_city INTEGER REFERENCES city ON DELETE SET NULL,
  to_country INTEGER REFERENCES country ON DELETE SET NULL,
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passager_id INTEGER REFERENCES passagers ON DELETE SET NULL,
  flight_id INTEGER REFERENCES flights ON DELETE SET NULL,
  seat TEXT NOT NULL
);

INSERT INTO passagers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO cities
  (city)
VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo'),
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Chicago'),
  ('New Orleans'),
  ('Santiago');

INSERT INTO countries
  (country)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

INSERT INTO flights
  (departure, arrival, airline_id, from_city, from_country, to_city, to_country)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 11, 6),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 12, 1),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 13, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 3, 14, 8),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 4, 15, 9),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 9, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 16, 1),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 17, 1),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 5, 18, 10);
  
INSERT INTO tickets
  (passager_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');