-- migrate:up

CREATE TABLE boletas (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombreYApellidos VARCHAR(150) NOT NULL,
    nroDocumento VARCHAR(8) NOT NULL
);

-- migrate:down

DROP TABLE boletas;