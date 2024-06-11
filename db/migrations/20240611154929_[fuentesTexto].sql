-- migrate:up

CREATE TABLE fuentesTexto (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(60) NOT NULL
);

-- migrate:down

DROP TABLE fuentesTexto;