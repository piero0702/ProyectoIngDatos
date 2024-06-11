-- migrate:up

CREATE TABLE cupones (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    codigo VARCHAR(15) NOT NULL,
    porcentajeDescuento FLOAT NOT NULL
);

-- migrate:down

DROP TABLE cupones;