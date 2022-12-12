/* Database schema to keep the structure of entire database. */

postgres=# CREATE TABLE animals(
postgres(# ID INT NOT NULL,
postgres(# NAME TEXT,
postgres(# DATE_OF_BIRTH DATE,
postgres(# ESCAPE_ATTEMPTS INT,
postgres(# NEUTERED BOOLEAN,
postgres(# WEIGTH_KG DECIMAL);
