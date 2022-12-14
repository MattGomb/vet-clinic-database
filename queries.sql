/*Queries that provide answers to the questions from all projects.*/

/* create table day 1 */

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

/* update table day 2 */

/* setting species to unspecified then roll it back, check all states */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* update species as per instructions, commit changes, check the result */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name like '%mon';
SELECT * FROM animals;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

/* deleting all records, then rolling it back */
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* delete animals by criteria, create savepoint, rollback, update weight, commit */
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT point1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO point1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

/* queries to answer the questions */
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals GROUP BY species, date_of_birth HAVING date_of_birth between '1990-01-01' and '2000-01-01';

/* multiple tables day 3 */

/* queries to answer the questions */
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT * FROM animals WHERE species_id = 1;
SELECT full_name, name FROM owners FULL JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(species_id) FROM animals FULL JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT name FROM animals FULL JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 2 AND animals.species_id = 2;
SELECT name FROM animals FULL JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 5 AND animals.escape_attempts = 0;
SELECT full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;
