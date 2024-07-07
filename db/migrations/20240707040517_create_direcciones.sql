-- migrate:up

CREATE TABLE direcciones (
  id INT PRIMARY KEY,
  direccionEntrega VARCHAR(60),
  codigoPostal VARCHAR(10),
  distrito_id INT,
  FOREIGN KEY (distrito_id) REFERENCES distritos(id)
);
-- migrate:down
DROP TABLE direcciones;
