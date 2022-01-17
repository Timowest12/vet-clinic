CREATE TABLE public."Animals"
(
    id integer,
    name "char",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric(10, 2)[],
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."Animals"
    OWNER to postgres;
