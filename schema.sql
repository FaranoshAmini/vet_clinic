/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth date,
    escape_attempts INT,
    neutered B OOLEAN,
    weight_kg DECIMAL
);