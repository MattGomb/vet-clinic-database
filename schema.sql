/*create table day 1 */

CREATE TABLE animals(
  id INT NOT NULL,
  name TEXT,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  
  /*update table with species day 2 */
  
  species TEXT
);

/* preparing multiple tables day 3 */

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255) NOT NULL,
  age INT,
  PRIMARY KEY (id)
  );
  
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY (id)
  );

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (restart with 1);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);

/* add join tables day 4 */

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
  );

CREATE TABLE specializations(
  species_id INT,
  vets_id INT,
  PRIMARY KEY(species_id, vets_id),
  CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id)
  );
  
CREATE TABLE visits(
  animal_id INT,
  vets_id INT
  date_of_visit DATE,
  PRIMARY KEY(animal_id, vets_id),
  CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id)
  );
  
  /* Vet clinic database: database performance audit */
  
  ALTER TABLE owners ADD COLUMN email VARCHAR(120);
