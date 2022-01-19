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
   
   
  --vets table
CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(100),
   age INT,
   date_of_graduation DATE
   );
   
   --Make sure that id is set as autoincremented PRIMARY KEY- DONE

--drop species column
ALTER TABLE animals DROP COLUMN species;
--Add column species_id as a froreighn key
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) reference to owners(id);
