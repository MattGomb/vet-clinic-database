CREATE TABLE "owners"(
    "id" INTEGER NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "age" INTEGER NULL
);
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "species"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL,
    "age" INTEGER NULL,
    "date_of_graduation" DATE NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "species_id" INTEGER NULL,
    "vets_id" INTEGER NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("species_id", "vets_id");
ALTER TABLE
    "specializations" ADD PRIMARY KEY("species_id");
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vets_id");
CREATE TABLE "visits"(
    "animal_id" INTEGER NULL,
    "vets_id" INTEGER NULL,
    "date_of_visit" DATE NOT NULL
);
ALTER TABLE
    "visits" ADD PRIMARY KEY("animal_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("vets_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("date_of_visit");
CREATE TABLE "animals"(
    "id" INTEGER NOT NULL DEFAULT 'GENERATED ALWAYS AS IDENTITY',
    "name" TEXT NULL,
    "date_of_birth" DATE NULL,
    "escape_attempts" INTEGER NULL,
    "neutered" BOOLEAN NULL,
    "weight_kg" DECIMAL(8, 2) NULL,
    "species_id" INTEGER NULL,
    "owner_id" INTEGER NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_unique" UNIQUE("species_id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_unique" UNIQUE("owner_id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "owners"("id");