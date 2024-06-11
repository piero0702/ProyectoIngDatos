-- migrate:up

CREATE TABLE productos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT NOT NULL,
    cuidados TEXT NOT NULL,
    propiedades TEXT NOT NULL,
    stock INTEGER NOT NULL,
    regalo_id INTEGER,
    grabadoLaser_id INTEGER,
    
    FOREIGN KEY(regalo_id) REFERENCES regalos(id) ON DELETE CASCADE,
    FOREIGN KEY(grabadoLaser_id) REFERENCES grabadosLaser(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE productos;