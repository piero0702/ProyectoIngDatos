-- migrate:up
INSERT INTO pagos (id, direccion_id, cliente_id, pedido_id, importeTotal, observaciones) VALUES
  (1, 1, 1, 1, 100.50, 'Pago realizado con tarjeta de crédito'),
  (2, 2, 2, 2, 200.75, 'Pago realizado mediante transferencia bancaria'),
  (3, 3, 3, 3, 150.00, 'Pago realizado en efectivo'),
  (4, 4, 4, 4, 250.25, 'Pago realizado con tarjeta de débito'),
  (5, 5, 5, 5, 175.50, 'Pago realizado con PayPal');
-- migrate:down 
DROP TABLE pagos;