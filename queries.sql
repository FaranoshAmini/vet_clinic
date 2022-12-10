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
UPDATE animals
SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;
SELECT *
FROM animals;
-- TRANSACTION 02
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT *
FROM animals;
COMMIT;
SELECT *
FROM animals;
-- TRANSACTION 03
BEGIN;
DELETE FROM animals;
SELECT *
FROM animals;
ROLLBACK;
SELECT *
FROM animals;
-- TRANSACTION 04
BEGIN;
DELETE FROM animals
WHERE TO_CHAR(date_of_birth, 'YYYY-MON-DD') > '2022-JAN-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
-- Queries
SELECT COUNT(*) total_animals
FROM animals;
SELECT COUNT(*) total_animals
FROM animals
WHERE escape_attempts = 0;
SELECT AVG(weight_kg) avg_weight
FROM animals;
SELECT MAX(escape_attempts) escape_attempts,
    neutered
FROM animals
GROUP BY neutered;
SELECT MAX(weight_kg) max_weight,
    MIN(weight_kg) min_weight,
    species
FROM animals
GROUP BY species;
SELECT AVG(escape_attempts) avg_escape_attempts,
    species
FROM animals
WHERE TO_CHAR(date_of_birth, 'YYYY') BETWEEN '1990' AND '2000'
GROUP BY species;
/*Milestone 03*/
SELECT a.name animal,
    o.full_name owner
FROM animals a,
    owners o
WHERE a.owner_id = o.id
    AND o.full_name = 'Melody Pond';
SELECT a.name animal,
    s.name specie
FROM animals a,
    species s
WHERE a.species_id = s.id
    AND s.name = 'Pokemon';
SELECT a.name animal,
    o.full_name owner
FROM animals a
    FULL OUTER JOIN owners o ON a.owner_id = o.id;
SELECT COUNT(a.id),
    s.name
FROM animals a,
    species s
WHERE a.species_id = s.id
GROUP BY s.name;
SELECT a.name animal,
    o.full_name owner,
    s.name
FROM animals a,
    owners o,
    species s
WHERE a.owner_id = o.id
    AND a.species_id = s.id
    AND o.full_name = 'Jennifer Orwell'
    AND s.name = 'Digimon';
SELECT a.name animal,
    o.full_name owner
FROM animals a,
    owners o
WHERE a.owner_id = o.id
    AND o.full_name = 'Dean Winchester'
    AND a.escape_attempts = 0;
WITH new AS (
    SELECT COUNT(a.id) total_animals,
        o.full_name owner
    FROM animals a,
        owners o
    WHERE a.owner_id = o.id
    GROUP BY o.id
)
SELECT owner,
    total_animals
FROM new
WHERE total_animals = (
        SELECT MAX(total_animals)
        FROM new
    );