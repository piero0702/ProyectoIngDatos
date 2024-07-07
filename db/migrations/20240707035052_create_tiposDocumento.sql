-- migrate:up
CREATE TABLE tiposDocumento (
  id INT PRIMARY KEY,
  nombre VARCHAR(50)
);
-- migrate:down
DROP TABLE tiposDocumento;
