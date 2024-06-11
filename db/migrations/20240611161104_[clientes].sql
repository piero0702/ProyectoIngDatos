-- migrate:up

CREATE TABLE clientes (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    nroDocumento VARCHAR(8) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contrasenia VARCHAR(8) NOT NULL,
    tipoDocumento_id INTEGER,
    direccion_id INTEGER,
    FOREIGN KEY(tipoDocumento_id) REFERENCES tiposDocumento(id) ON DELETE CASCADE,
    FOREIGN KEY(direccion_id) REFERENCES direcciones(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE clientes;