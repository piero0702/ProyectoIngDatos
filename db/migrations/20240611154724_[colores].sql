-- migrate:up

CREATE TABLE colores (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE colores;