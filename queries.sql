/*Queries that provide answers to the questions from all projects.*/
/*Milestone 01 */
SELECT *
FROM animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN '01-01-2016' AND '12-31-2019';
SELECT name
FROM animals
WHERE neutered = True
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name = 'Pikachu'
    OR name = 'Agumon';
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered = true;
SELECT *
FROM animals
WHERE name <> 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;
/* Milestone 02*/
-- TRANSACTION 01
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;
-- TRANSACTION 02
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT *
FROM animals;
-- TRANSACTION 03
BEGIN;
DELETE FROM animals;
SELECT *
FROM animals;
ROLLBACK;
-- TRANSACTION 04
BEGIN;
DELETE FROM animals WHERE TO_CHAR(date_of_birth,'YYYY-MON-DD') > '2022-JAN-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

-- Queries
SELECT COUNT(*) total_animals FROM animals;
SELECT COUNT(*) total_animals FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) avg_weight FROM animals;
SELECT MAX(escape_attempts) escape_attempts, neutered FROM animals GROUP BY neutered;
SELECT MAX(weight_kg) max_weight, MIN(weight_kg) min_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) avg_escape_attempts, species FROM animals WHERE TO_CHAR(date_of_birth, 'YYYY') BETWEEN '1990' AND '2000' GROUP BY species;
