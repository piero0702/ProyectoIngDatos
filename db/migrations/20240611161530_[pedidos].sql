-- migrate:up

CREATE TABLE pedidos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    tipoEntrega_id INTEGER,
    cupon_id INTEGER,
    cliente_id INTEGER,
    FOREIGN KEY(tipoEntrega_id) REFERENCES tiposEntrega(id) ON DELETE CASCADE,
    FOREIGN KEY(cupon_id) REFERENCES cupones(id) ON DELETE CASCADE,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE pedidos;