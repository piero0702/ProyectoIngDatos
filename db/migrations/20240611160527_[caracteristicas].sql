-- migrate:up

CREATE TABLE caracteristicas (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    tipo_id INTEGER,
    color_id INTEGER,
    tamanio_id INTEGER,
    FOREIGN KEY(tipo_id) REFERENCES tipos(id) ON DELETE CASCADE,
    FOREIGN KEY(color_id) REFERENCES colores(id) ON DELETE CASCADE,
    FOREIGN KEY(tamanio_id) REFERENCES tamanios(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE caracteristicas;