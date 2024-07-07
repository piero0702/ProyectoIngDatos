-- migrate:up
CREATE TABLE pedidos (
  id INT PRIMARY KEY,
  tipoEntrega_id INT,
  cupon_id INT,
  cliente_id INT,
  FOREIGN KEY (tipoEntrega_id) REFERENCES tiposEntrega(id),
  FOREIGN KEY (cupon_id) REFERENCES cupones(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- migrate:down
DROP TABLE pedidos;