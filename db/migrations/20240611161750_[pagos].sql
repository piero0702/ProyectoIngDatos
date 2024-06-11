-- migrate:up

CREATE TABLE pagos (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    direccion_id INTEGER,
    cliente_id INTEGER,
    pedido_id INTEGER,
    boleta_id INTEGER,
    factura_id INTEGER,
    FOREIGN KEY(direccion_id) REFERENCES direcciones(id) ON DELETE CASCADE,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY(pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY(boleta_id) REFERENCES boletas(id) ON DELETE CASCADE,
    FOREIGN KEY(factura_id) REFERENCES facturas(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE pagos;