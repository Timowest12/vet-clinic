 SELECT * FROM animals WHERE name LIKE '%mon';
 
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+----------
    | Agumon  | 2020-02-03    |               0 | t        |    10.23
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(3 rows)

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-01-01';
  name
---------
 Gabumon
 Devimon
(2 rows)


SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
  name
---------
 Agumon
 Gabumon
(2 rows)

SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikuchu';
 date_of_birth
---------------
 2020-02-03
 2021-01-07
(2 rows)

 SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
  name   | escape_attempts
---------+-----------------
 Pikuchu |               1
 Devimon |               5
(2 rows)

SELECT * FROM animals WHERE neutered='true';
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+----------
    | Agumon  | 2020-02-03    |               0 | t        |    10.23
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(3 rows)
SELECT * FROM animals WHERE name='Gabumon';
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+----------
    | Gabumon | 2018-11-15    |               2 | t        |     8.00
(1 row)

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+----------
    | Pikuchu | 2021-01-07    |               1 | f        |    15.04
    | Devimon | 2017-03-12    |               5 | t        |    11.00
(2 rows)


