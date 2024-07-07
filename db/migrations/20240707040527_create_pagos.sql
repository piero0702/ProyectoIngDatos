-- migrate:up

CREATE TABLE pagos (
  id INT PRIMARY KEY,
  direccion_id INT,
  cliente_id INT,
  pedido_id INT,
  importeTotal FLOAT,
  observaciones TEXT,
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);
-- migrate:down
DROP TABLE pagos;
