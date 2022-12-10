/* Database schema to keep the structure of entire database. */
/*Milestone 01 */
CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
/* Milestone 02*/
ALTER TABLE animals
ADD species varchar(255);

/*Milestone 03*/
CREATE TABLE owners(id INT GENERATED ALWAYS AS IDENTITY, full_name   VARCHAR(100), age  INT, PRIMARY KEY(id));