-- migrate:up

CREATE TABLE tamanios (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    numeroMl FLOAT NOT NULL
);

-- migrate:down

DROP TABLE tamanios;