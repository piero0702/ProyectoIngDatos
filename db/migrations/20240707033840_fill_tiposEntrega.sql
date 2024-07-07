-- migrate:up
INSERT INTO tiposEntrega (id, nombre) VALUES
  (1, 'Envío estándar'),
  (2, 'Envío express'),
  (3, 'Recoger en tienda'),
  (4, 'Envío gratuito'),
  (5, 'Envío urgente');
-- migrate:down
DELETE FROM tiposEntrega;
