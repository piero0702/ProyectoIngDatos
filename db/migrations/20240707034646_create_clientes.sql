-- migrate:up
CREATE TABLE clientes (
  id INTEGER PRIMARY KEY,
  nombres VARCHAR(50),
  apellidos VARCHAR(80),
  telefono VARCHAR(10),
  nroDocumento VARCHAR(8),
  email VARCHAR(100),
  contrasenia VARCHAR(8),
  tipoDocumento_id INT,
  direccion_id INT,
  FOREIGN KEY (tipoDocumento_id) REFERENCES tiposDocumento(id),
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id)
);

-- migrate:down

DROP TABLE clientes;