-- migrate:up

CREATE TABLE grabadosLaser (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    texto VARCHARR(8) NOT NULL,
    costoAdicional FLOAT NOT NULL,
    disposicionTexto_id INTEGER,
    fuenteTexto_id INTEGER,
    FOREIGN KEY(disposicionTexto_id) REFERENCES dispocisionesTexto(id) ON DELETE CASCADE,
    FOREIGN KEY(fuenteTexto_id) REFERENCES fuentesTexto(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE grabadosLaser;