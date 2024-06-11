-- migrate:up

CREATE TABLE pedidosProductos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    pedido_id INTEGER,
    producto_id INTEGER,
    FOREIGN KEY(pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY(producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE pedidosProductos;