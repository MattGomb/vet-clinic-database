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
