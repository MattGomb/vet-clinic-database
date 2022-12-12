/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  ID INT NOT NULL,
  NAME TEXT,
  DATE_OF_BIRTH DATE,
  ESCAPE_ATTEMPTS INT,
  NEUTERED BOOLEAN,
  WEIGTH_KG DECIMAL
);
