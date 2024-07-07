-- migrate:up
CREATE TABLE tiposEntrega (
  id INT PRIMARY KEY,
  nombre VARCHAR(40)
);
-- migrate:down
DROP TABLE tiposEntrega;
