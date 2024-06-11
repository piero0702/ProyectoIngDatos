-- migrate:up

CREATE TABLE tipos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE tipos;