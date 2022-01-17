INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Agumon',date '2020-02-03
',0,TRUE,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Gabumon',date '2018-11-1
5',2,TRUE,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Pikuchu',date '2021-01-0
7',1,FALSE,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES('Devimon',date '2017-03-1
2',5,TRUE,11);


vet_clinic=# SELECT * FROM animals;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+----------
    | Agumon  | 2020-02-03    |               0 | t        |    10.23
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
    | Pikuchu | 2021-01-07    |               1 | f        |    15.04
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(4 rows)
