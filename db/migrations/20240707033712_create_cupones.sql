-- migrate:up
CREATE TABLE cupones (
  id INT PRIMARY KEY,
  codigo VARCHAR(15),
  porcentajeDsct FLOAT
);
-- migrate:down
DROP TABLE cupones;
