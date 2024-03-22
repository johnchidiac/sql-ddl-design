-- from the terminal run:
-- psql < outer_space.sql
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space
CREATE TABLE galaxies(
  id serial PRIMARY KEY,
  name varchar(30) NOT NULL
);

CREATE TABLE stars(
  id serial PRIMARY KEY,
  name varchar(30) NOT NULL,
  galaxy_id integer REFERENCES galaxies NOT NULL
);

CREATE TABLE planets(
  id serial PRIMARY KEY,
  name varchar(30) NOT NULL,
  orbital_period_in_years float NOT NULL,
  star_id integer REFERENCES stars NOT NULL,
  galaxy_id integer REFERENCES galaxies NOT NULL, -- would it make sense to remove this since we can get the galaxy by referencing the galaxy that the planet's star is in?
  moons varchar(30)[] NOT NULL
);

INSERT INTO galaxies(name)
  VALUES ('Milky Way'),
('Andromeda');

INSERT INTO stars(name, galaxy_id)
  VALUES ('The Sun', 1),
('Proxima Centauri', 1),
('Gliese 876', 1);

INSERT INTO planets(name, orbital_period_in_years, star_id, galaxy_id, moons)
  VALUES ('Earth', 1.00, 1, 1, '{"The Moon"}'),
('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
('Venus', 0.62, 1, 1, '{}'),
('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('Proxima Centauri b', 0.03, 2, 1, '{}'),
('Gliese 876 b', 0.23, 3, 1, '{}');

