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

--multi table queries


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


--what was the last animal seen by Ailliam Tatcher?
SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

--How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as total_animals from vets JOIN visits ON vets.id = visits.vets_id WHERE name='Stephanie Mendez';

--List all vets and their specialties, including vets with no specialties.
SELECT 
	vets.name,
	species.name as specialization
from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;


--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name ,date_of_visit from animals 
JOIN visits ON animals.id= visits.animals_id JOIN vets ON vets.id=visits.vets_id
 WHERE vets.name= 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';


--What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as total_visit from animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY total_visit DESC
LIMIT 1;


--Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;


--Details for most recent visit: animal information, vet information, and date of visit.
SELECT
	date_of_visit,
	animals.date_of_birth as animal_dob,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg as animal_weight,
	vets.name as vet_name,
	vets.age as vet_age,
	vets.date_of_graduation
from visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit DESC
LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;


--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as specialization , COUNT(visits.animals_id) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;

