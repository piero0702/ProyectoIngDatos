-- migrate:up

CREATE TABLE caracteristicas_productos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    imagen VARCHAR(100) NOT NULL,
    precio FLOAT NOT NULL,
    caracteristica_id INTEGER,
    producto_id INTEGER,
    
    FOREIGN KEY(caracteristica_id) REFERENCES caracteristicas(id) ON DELETE CASCADE,
    FOREIGN KEY(producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE caracteristicas_productos;