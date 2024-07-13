-- migrate:up
CREATE TABLE cupones (
  id INTEGER PRIMARY KEY,
  codigo VARCHAR(15),
  porcentajeDsct FLOAT
);
-- migrate:down
DROP TABLE cupones;
