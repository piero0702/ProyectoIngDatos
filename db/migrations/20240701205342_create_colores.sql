-- migrate:up

CREATE TABLE colores (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE colores;