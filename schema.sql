/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id INT,
    nane VARCHAR(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weig ht_kg DECIMAL,
    PRIMARY KEY(id)
);
