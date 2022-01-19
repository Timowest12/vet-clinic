INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon',date '2020-02-03
',0,TRUE,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Gabumon',date '2018-11-1
5',2,TRUE,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Pikuchu',date '2021-01-0
7',1,FALSE,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Devimon',date '2017-03-1
2',5,TRUE,11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Charmander',date '2020-02-08',0,FALSE,-11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Plantmon',date '2022-11-15',2,TRUE,-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Squirtle',date '1993-02-02',3,TRUE,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Angemon',date '2005-04-12',1,FALSE,-45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Boarmon',date '2005-6-07',7,TRUE,20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,eight_kg) VALUES('Blossom',date '1998-10-13',3,TRUE,17);


--insert owners
--Sam Smith 34 years old.
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
--Jennifer Orwell 19 years old.
INSERT INTO owners (full_name, age)
VALUES (
        'Jennifer Orwell',
        19
    );
--Bob 45 years old.
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
--Melody Pond 77 years old.
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
--Dean Winchester 14 years old.
INSERT INTO owners (full_name, age)
VALUES (
        'Dean Winchester',
        14
    );
--Jodie Whittaker 38 years old.
INSERT INTO owners (full_name, age)
VALUES (
        'Jodie Whittaker',
        38
    );
    
--insert species
--Pokemon
INSERT INTO species (name)
VALUES ('Pokemon');
--Digimon
INSERT INTO species (name)
VALUES ('Digimon');

--give species id's
--if name ends in digimon it's a digimon
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
--The rest are pokemon
UPDATE animals SET species_id=1;


--give ownership to animals
--Sam Smith owns Agumon.
UPDATE animals SET owner_id=1 WHERE name='Agumon';
--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id=2 WHERE name IN ('Gabumon','Pikachu');
--Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');
--Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');


--insert vets
INSERT INTO vets(NAME,AGE,DATE_OF_GRADUATION) 
VALUES
('William Tatche', 45,'2000-04-23'),
(' Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');

--insert specializations
INSERT INTO specializations (species_id,vets_id) VALUES (1,1),(2,3),(1,3),(2,4);

--insert visits
INSERT INTO visits (animals_id,vets_id,date_of_visit) VALUES (1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 2, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
