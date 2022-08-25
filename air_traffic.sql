-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INTEGER REFERENCES countries
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INTEGER REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines,
  from_city INTEGER REFERENCES cities,
  to_city INTEGER REFERENCES cities
);

INSERT INTO tickets
  (seat, departure, arrival)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO passengers
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
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities
  (name, country)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Santiago', 10);

UPDATE tickets SET passenger = 1 WHERE id IN (1,4);
UPDATE tickets SET passenger = 2 WHERE id IN (2,6);
UPDATE tickets SET passenger = 3 WHERE id = 3;
UPDATE tickets SET passenger = 4 WHERE id = 5;
UPDATE tickets SET passenger = 5 WHERE id IN (7,9);
UPDATE tickets SET passenger = 6 WHERE id = 8;
UPDATE tickets SET passenger = 7 WHERE id = 10;

UPDATE tickets SET airline = 1 WHERE id IN (1,7);
UPDATE tickets SET airline = 2 WHERE id = 2;
UPDATE tickets SET airline = 3 WHERE id IN (3,4);
UPDATE tickets SET airline = 4 WHERE id = 5;
UPDATE tickets SET airline = 5 WHERE id = 6;
UPDATE tickets SET airline = 6 WHERE id IN (8,9);
UPDATE tickets SET airline = 7 WHERE id = 10;

UPDATE tickets SET from_city = 1 WHERE id = 1;
UPDATE tickets SET to_city = 2 WHERE id = 1;
UPDATE tickets SET from_city = 3 WHERE id = 2;
UPDATE tickets SET to_city = 4 WHERE id = 2;
UPDATE tickets SET from_city = 5 WHERE id = 3;
UPDATE tickets SET to_city = 6 WHERE id = 3;
UPDATE tickets SET from_city = 2 WHERE id = 4;
UPDATE tickets SET to_city = 7 WHERE id = 4;
UPDATE tickets SET from_city = 8 WHERE id = 5;
UPDATE tickets SET to_city = 9 WHERE id = 5;
UPDATE tickets SET from_city = 10 WHERE id = 6;
UPDATE tickets SET to_city = 11 WHERE id = 6;
UPDATE tickets SET from_city = 12 WHERE id = 7;
UPDATE tickets SET to_city = 13 WHERE id = 7;
UPDATE tickets SET from_city = 14 WHERE id = 8;
UPDATE tickets SET to_city = 15 WHERE id = 8;
UPDATE tickets SET from_city = 13 WHERE id = 9;
UPDATE tickets SET to_city = 16 WHERE id = 9;
UPDATE tickets SET from_city = 17 WHERE id = 10;
UPDATE tickets SET to_city = 18 WHERE id = 10;
