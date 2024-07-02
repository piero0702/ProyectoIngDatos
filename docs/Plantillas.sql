CREATE TABLE fuertes (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(20) NOT NULL
);

CREATE TABLE debiles (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    inicio DATETIME NOT NULL,
    fin DATE,
    titulo_distribucion VARCHAR(40) NOT NULL,
    titulo_original VARCHAR(40) NOT NULL,
    anio_produccion INTEGER NOT NULL,
    horas INTEGER NOT NULL,
    fuerte_id INTEGER,
    FOREIGN KEY(fuerte_id) REFERENCES fuertes(id) ON DELETE CASCADE
);