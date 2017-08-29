DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS owners;

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  status VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  age INT,
  vet_id INT REFERENCES vets(id),
  date_entered DATE,
  photo VARCHAR(255)
);

CREATE TABLE owners (
  id  SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255)
);

CREATE TABLE adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  owner_id INT REFERENCES owners(id),
  date_adopt DATE
);
