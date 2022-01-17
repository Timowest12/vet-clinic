CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DEC(10,2)
);

ALTER TABLE animals ADD species varchar(255);


--owners table
CREATE TABLE owners(
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(100),
   age INT
);
--species table
CREATE TABLE species(
   id SERIAL PRIMARY KEY,
   name VARCHAR(100)
   );
