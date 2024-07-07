-- migrate:up
INSERT INTO pedidos (id, tipoEntrega_id, cupon_id, cliente_id) VALUES
  (1, 1, 1, 1),  -- Envío estándar, CUPON10, cliente 1
  (2, 2, 3, 2),  -- Envío express, PRIMERCOMPRADOR, cliente 2
  (3, 3, NULL, 3),  -- Recoger en tienda, sin cupón, cliente 3
  (4, 1, 5, 4),  -- Envío estándar, BLACKFRIDAY30, cliente 4
  (5, 4, 2, 5),  -- Envío gratuito, VERANO20, cliente 5
  (6, 2, 8, 6),  -- Envío express, ESTRENOCASA20, cliente 6
  (7, 1, 10, 7),  -- Envío estándar, ULTIMACHANCE12, cliente 7
  (8, 3, NULL, 8),  -- Recoger en tienda, sin cupón, cliente 8
  (9, 1, 4, 9),  -- Envío estándar, FIELDCOMPANY, cliente 9
  (10, 2, 6, 10);  -- Envío express, CYBERMONDAY25, cliente 10
-- migrate:down
DELETE FROM pedidos;
