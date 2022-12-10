/* Populate database with sample data. */
/*Milestone 01 */
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Agumon', '2020-02-03', 0, True, 10.23);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Gabumon', '2018-11-15', 2, True, 8);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Pikachu', '2021-01-07', 1, False, 15.04);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Devimon', '2017-05-12', 5, True, 11);
/* Milestone 02*/
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Charmander', '2020-02-08', 0, False, -11);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Plantmon', '2021-11-15', 5, True, -5.7);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Squirtle', '1993-04-02', 5, False, 1 -12.13);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Angemon', '2005-06-12', 5, True, -45);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Boarmon', '2005-06-07', 5, True, 20.4);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Blossom', '1998-10-13', 5, True, 17);
INSERT INTO animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES ('Ditto', '2022-05-14', 5, True, 22);
/*Milestone 03*/
-- Owners Information
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);
-- Species Information
INSERT INTO species(name)
VALUES ('Digimon');
INSERT INTO species(name)
VALUES ('Pokemon');
-- Updations
-- OWNER'S UPDATIONS
UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon';
-- SPECIES UPDATIONS
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';
UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');

/*Milestone 04*/
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-Apr-23'),('Maisy Smith', 26, '2019-Jan-17'),('Stephanie Mendez', 64, '1981-May-04'),('Jack Harkness', 38, '2008-Jun-08');
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from species WHERE species.name='Pokemon')),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from species WHERE species.name='Digimon')),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from species WHERE species.name='Pokemon')),((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from species WHERE species.name='Digimon'));
INSERT INTO visits(vet_id, animal_id, date) 
VALUES  ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Agumon'), '2020-05-24'),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Agumon'), '2020-07-22'),((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Gabumon'), '2021-02-02'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '2020-01-05'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '2020-03-08'), ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '2020-05-14'),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Devimon'), '2021-05-14'),((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Charmander'), '2021-02-24'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Plantmon'), '2019-12-21'),((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Plantmon'), '2020-08-10'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Plantmon'), '2021-04-07'),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Squirtle'), '2019-09-29'),((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Angemon'), '2020-10-03'),((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Angemon'), '2020-11-04'), ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '2019-01-24'), ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '2019-05-15'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '2020-02-27'),((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '2020-08-03'),((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Blossom'), '2020-05-24'),((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Blossom'), '2021-01-11');