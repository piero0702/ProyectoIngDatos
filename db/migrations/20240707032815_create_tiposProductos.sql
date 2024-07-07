-- migrate:up

CREATE TABLE tiposProducto (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(50)
);
-- migrate:down
DROP TABLE tiposProducto;