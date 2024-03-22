-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE airlines(
  id serial PRIMARY KEY,
  name varchar(30)
);

CREATE TABLE cities(
  id serial PRIMARY KEY,
  name varchar(30)
);

CREATE TABLE countries(
  id serial PRIMARY KEY,
  name varchar(30)
);

CREATE TABLE tickets(
  id serial PRIMARY KEY,
  passenger_id integer NOT NULL REFERENCES passengers seat varchar(30) NOT NULL,
  departure timestamp NOT NULL,
  arrival timestamp NOT NULL,
  airline integer NOT NULL REFERENCES airlines,
  from_city integer NOT NULL REFERENCES cities,
  from_country integer NOT NULL REFERENCES countries,
  to_city integer NOT NULL REFERENCES cities,
  to_country integer NOT NULL REFERENCES countries
);

INSERT INTO airlines(name)
  VALUES ('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('Amerian Airlines'),
('Avianca Brasil');

INSERT INTO countries(name)
  VALUES ('United States'),
('Japan'),
('United Kingdom'),
('Mexico'),
('France'),
('Morocco'),
('UAE'),
('China'),
('Brazil'),
('Chile');

INSERT INTO cities(name)
  VALUES ('Washington DC'),
('Seattle'),
('Tokyo'),
('London'),
('Los Angeles'),
('Las Vegas'),
('Mexico City'),
('Paris'),
('Casablanca'),
('Dubai'),
('Beijing'),
('New York'),
('Charlotte'),
('Cedar Rapids'),
('Chicago'),
('New Orleans'),
('Sao Paolo'),
('Santiago');

-- add a Passengers table
CREATE TABLE passengers(
  id serial PRIMARY KEY first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL
);

INSERT INTO passengers(first_name, last_name)
  VALUES ('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Berkie', 'Wycliff'),
('Cory', 'Squibbes');

INSERT INTO tickets(passenger_id, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
  VALUES (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
(2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
(3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 4, 1, 5, 1),
(1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 6, 4),
(4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 7, 5, 8, 6),
(2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 8, 7, 9, 8),
(5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 10, 1, 11, 1),
(6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 12, 1, 13, 1),
(5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 12, 1, 14, 1),
(7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 15, 9, 16, 10);

