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


--What animals belong to Melody Pond?
SELECT animals.name FROM animals 
JOIN owners on animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name as species_name from animals 
JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name as animal_name, owners.fulL_name as owner_name from owners 
LEFT JOIN animals on owners.id = animals.owners_id;

--How many animals are there per species?
SELECT species.name, COUNT(*) from animals 
JOIN species ON species.id = animals.species_id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name as owner_name, species.name as species_name from animals
JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owners_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals
JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) as num_animals from owners
LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY num_animals DESC;


