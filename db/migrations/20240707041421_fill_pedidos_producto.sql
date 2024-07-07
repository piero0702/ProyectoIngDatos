-- migrate:up
INSERT INTO pedidos_productos (id, pedido_id, producto_id, tipoProducto_id) VALUES
  (1, 1, 1, 1),  -- Pedido 1 incluye producto 1 como regalo
  (2, 2, 2, 2),  -- Pedido 2 incluye producto 2 con grabado láser
  (3, 3, 1, 1),  -- Pedido 3 incluye producto 1 como regalo
  (4, 4, 2, 2),  -- Pedido 4 incluye producto 2 con grabado láser
  (5, 5, 1, 1),  -- Pedido 5 incluye producto 1 como regalo
  (6, 6, 2, 2),  -- Pedido 6 incluye producto 2 con grabado láser
  (7, 7, 1, 1),  -- Pedido 7 incluye producto 1 como regalo
  (8, 8, 2, 2),  -- Pedido 8 incluye producto 2 con grabado láser
  (9, 9, 1, 1),  -- Pedido 9 incluye producto 1 como regalo
  (10, 10, 2, 2); -- Pedido 10 incluye producto 2 con grabado láser
-- migrate:down
DELETE FROM pedidos_productos;
