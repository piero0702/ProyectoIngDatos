-- migrate:up

INSERT INTO clientes (id, nombres, apellidos, telefono, nroDocumento, email, contrasenia, tipoDocumento_id, direccion_id)
VALUES
  (1, 'Juan', 'Pérez', '1234567890', '12345678', 'juan.perez@example.com', 'juan123', 1, 1),
  (2, 'María', 'González', '9876543210', '98765432', 'aria.gonzalez@example.com', 'aria123', 2, 2),
  (3, 'Pedro', 'Rodríguez', '5551234567', '55512345', 'pedro.rodriguez@example.com', 'pedro123', 1, 3),
  (4, 'Ana', 'Díaz', '7778889990', '77788899', 'ana.diaz@example.com', 'ana123', 2, 4),
  (5, 'Luis', 'Hernández', '6665554444', '66655544', 'luis.hernandez@example.com', 'luis123', 1, 5),
  (6, 'Sofía', 'García', '3332221111', '33322211', 'ofia.garcia@example.com', 'ofia123', 2, 6),
  (7, 'Carlos', 'Martínez', '9998887770', '99988877', 'carlos.martinez@example.com', 'carlos123', 1, 7),
  (8, 'Laura', 'Sánchez', '4443332222', '44433322', 'laura.sanchez@example.com', 'laura123', 2, 8),
  (9, 'Javier', 'López', '8887776665', '88877766', 'javier.lopez@example.com', 'javier123', 1, 9),
  (10, 'Elena', 'Gómez', '2221110000', '22211100', 'elena.gomez@example.com', 'elena123', 2, 10);
-- migrate:down
DELETE FROM clientes;
