 SELECT * FROM animals WHERE name LIKE '%mon';
 
 id |  name   | date_of_birth | escape_attempts | neutered | eight_kg
----+---------+---------------+-----------------+----------+----------
    | Agumon  | 2020-02-03    |               0 | t        |    10.23
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(3 rows)

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-01-01';
 id |  name   | date_of_birth | escape_attempts | neutered | eight_kg
----+---------+---------------+-----------------+----------+----------
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(2 rows)

SELECT * FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
 id |  name   | date_of_birth | escape_attempts | neutered | eight_kg
----+---------+---------------+-----------------+----------+----------
    | Agumon  | 2020-02-03    |               0 | t        |    10.23
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
(2 rows)
