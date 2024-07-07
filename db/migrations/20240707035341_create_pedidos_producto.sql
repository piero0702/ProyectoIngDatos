-- migrate:up
CREATE TABLE pedidos_productos (
  id INT PRIMARY KEY,
  pedido_id INT,
  producto_id INT,
  tipoProducto_id INT,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (tipoProducto_id) REFERENCES tiposProducto(id)
);
-- migrate:down
DROP TABLE pedidos_productos;
