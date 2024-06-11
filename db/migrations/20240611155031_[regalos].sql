-- migrate:up

CREATE TABLE regalos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombresYApellidos TEXT NOT NULL,
    tarjetaRegalo VARCHAR(150) NOT NULL,
    costoAdicional FLOAT NOT NULL
);

-- migrate:down

DROP TABLE regalos;