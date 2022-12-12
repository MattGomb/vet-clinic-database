/* Database schema to keep the structure of entire database. */

/*create table day 1 */

CREATE TABLE animals(
  id INT NOT NULL,
  name TEXT,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);
