-- migrate:up

CREATE TABLE tamanios (
    id INTEGER PRIMARY KEY,
    numeroMl VARCHAR(50)
);
-- migrate:down
DROP TABLE tamanios;