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

/* many-to-many tables day 4 */

/* queries to answer the questions */
SELECT name FROM animals JOIN visits ON animals.id = visits.animal_id WHERE vets_id = 1 ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT(animal_id)) FROM visits WHERE vets_id = 3;
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets_id = vets.id LEFT JOIN species ON species.id = species_id;
SELECT name FROM animals JOIN visits ON animals.id = animal_id WHERE vets_id = 3 AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT name FROM animals LEFT JOIN visits ON id = animal_id GROUP BY animals.name ORDER BY COUNT(animal_id) DESC LIMIT 1;
SELECT name FROM animals LEFT JOIN visits ON id = animal_id WHERE visits.vets_id = 2 GROUP BY animals.name, visits.date_of_visit ORDER BY date_of_visit ASC LIMIT 1;
SELECT a.id, a.name, a.date_of_birth AS "birthday", a.neutered, a.escape_attempts, a.weight_kg AS "weight", a.species_id, a.owner_id, ve.id AS "vet id", ve.name AS "vet name", ve.age, ve.date_of_graduation, vi.date_of_visit AS "animal's last visit" FROM animals a FULL JOIN visits vi ON a.id = vi.animal_id FULL JOIN vets ve ON vi.vets_id = ve.id ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(animal_id) FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id LEFT JOIN specializations ON specializations.vets_id = visits.vets_id WHERE animals.species_id != specializations.species_id AND vets.id!=3 OR vets.id = 2;
SELECT species.name FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id INNER JOIN species ON species.id = species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id) DESC LIMIT 1;
