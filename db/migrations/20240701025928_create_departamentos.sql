-- migrate:up

CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE departamentos;