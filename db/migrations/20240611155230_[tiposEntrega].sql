-- migrate:up

CREATE TABLE tiposEntrega (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(40) NOT NULL,
    costo FLOAT NOT NULL
);

-- migrate:down

DROP TABLE tiposEntrega;