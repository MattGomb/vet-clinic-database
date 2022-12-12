/* Database schema to keep the structure of entire database. */

postgres=# CREATE TABLE animals(
postgres(# id INT PRIMARY KEY NOT NULL,
postgres(# name TEXT NOT NULL,
postgres(# date_of_birth DATE,
postgres(# escape_attempts INT NOT NULL,
postgres(# neutered BOOL,
postgres(# weight_kg DECIMAL);
