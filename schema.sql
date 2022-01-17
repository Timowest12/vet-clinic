-- Table: public.Animals

-- DROP TABLE IF EXISTS public."Animals";

CREATE TABLE IF NOT EXISTS public."Animals"
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts boolean,
    weight numeric(10,2),
    CONSTRAINT "Animals_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Animals"
    OWNER to postgres;
