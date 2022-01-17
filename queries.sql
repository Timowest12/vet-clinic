 SELECT * FROM animals WHERE name LIKE '%mon';
 

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-01-01';


SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;


SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikuchu';


SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;


SELECT * FROM animals WHERE neutered='true';


SELECT * FROM animals WHERE name='Gabumon';


SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

-- transaction update spacies with rollback

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals; 
ROLLBACK;
SELECT * FROM animals; 

-- set species to pokemon/ digimon
BEGIN;
UPDATE animals SET species = 'pokemon' -- set all to pokemon
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; -- set all ending in mon to digimon
COMMIT; -- after checking if everything works commit


-- delete all records in transaction and rollback
BEGIN;
DELETE FROM animals;
ROLLBACK;

