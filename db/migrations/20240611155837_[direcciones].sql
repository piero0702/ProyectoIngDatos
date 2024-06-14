-- migrate:up

CREATE TABLE direcciones (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    direccionEntrega VARCHAR(60) NOT NULL,
    codigoPostal VARCHAR(10) NOT NULL,
    nroDepartamento INT NOT NULL,
    distrito_id INTEGER,
    tipoDireccion_id INTEGER,
    FOREIGN KEY(distrito_id) REFERENCES distritos(id) ON DELETE CASCADE,
    FOREIGN KEY(tipoDireccion_id) REFERENCES tiposDireccion(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE direcciones;