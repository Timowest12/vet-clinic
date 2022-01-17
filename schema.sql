CREATE TABLE animals(
    id INT,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DEC(10,2)
);

result:

     Column      |          Type          | Collation | Nullable | Default
-----------------+------------------------+-----------+----------+---------
 id              | integer                |           |          |
 name            | character varying(100) |           |          |
 date_of_birth   | date                   |           |          |
 escape_attempts | integer                |           |          |
 neutured        | boolean                |           |          |
 weight_kg       | numeric(10,2)          |           |          |

