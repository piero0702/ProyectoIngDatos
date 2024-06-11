-- migrate:up

CREATE TABLE facturas (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    razonSocial VARCHAR(60) NOT NULL,
    ruc VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE facturas;