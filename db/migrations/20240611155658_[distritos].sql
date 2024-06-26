-- migrate:up

CREATE TABLE distritos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL,
    provincia_id INTEGER,
    FOREIGN KEY(provincia_id) REFERENCES provincias(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE distritos;