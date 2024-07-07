-- migrate:up
INSERT INTO cupones (id, codigo, porcentajeDsct) VALUES
  (1, 'CUPON10', 10.0),
  (2, 'VERANO20', 20.0),
  (3, 'PRIMERCOMPRADOR', 15.0),
  (4, 'FIELDCOMPANY', 12.0),
  (5, 'BLACKFRIDAY30', 30.0),
  (6, 'CYBERMONDAY25', 25.0),
  (7, 'REGALO15', 15.0),
  (8, 'ESTRENOCASA20', 20.0),
  (9, 'COMPRARMAIS', 18.0),
  (10, 'ULTIMACHANCE12', 12.0);
-- migrate:down
DELETE FROM cupones;
