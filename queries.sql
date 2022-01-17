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


-- advanced transaction
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
savepoint deletefirst;
UPDATE animals SET eight_kg = eight_kg * -1;
ROLLBACK TO deletefirst;
UPDATE animals SET eight_kg = eight_kg * -1 WHERE eight_kg < 0;
COMMIT



--advanced queries for analytics
--checking how many animals in table
SELECT COUNT(name) FROM animals;

--count number of animals that never tried to escape
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;

--calculate average weight from animals using build in sql functions
SELECT AVG(eight_kg) FROM animals;

--most escaping animal
SELECT name FROM animals WHERE escape_attempts =(SELECT MAX(escape_attempts) FROM animals);

--minimum and maximum weight of each type by animal
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

--average number of escapes of animals born between 1990 and 2000
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>='1-1-1990' AND date_of_birth<'1-1-2000' GROUP BY species;
