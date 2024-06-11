-- migrate:up

CREATE TABLE direcciones (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    distrito_id INTEGER,
    tipoDireccion_id INTEGER,
    FOREIGN KEY(distrito_id) REFERENCES distritos(id) ON DELETE CASCADE,
    FOREIGN KEY(tipoDireccion_id) REFERENCES tiposDireccion(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE direcciones;