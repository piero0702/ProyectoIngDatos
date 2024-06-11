-- migrate:up
-- Inserción de 20 registros en la tabla boletas

-- Inserción de 20 registros en la tabla boletas con IDs

INSERT INTO boletas (id, nombreYApellidos, nroDocumento) VALUES
(1, 'Juan Pérez', '12345678'),
(2, 'María García', '23456789'),
(3, 'Luis Rodríguez', '34567890'),
(4, 'Ana Martínez', '45678901'),
(5, 'Carlos Gómez', '56789012'),
(6, 'Laura Fernández', '67890123'),
(7, 'Jorge López', '78901234'),
(8, 'Marta Sánchez', '89012345'),
(9, 'Pedro González', '90123456'),
(10, 'Lucía Ramírez', '01234567'),
(11, 'José Torres', '11234567'),
(12, 'Isabel Díaz', '21234567'),
(13, 'Ricardo Jiménez', '31234567'),
(14, 'Sofía Moreno', '41234567'),
(15, 'David Rojas', '51234567'),
(16, 'Carmen Castro', '61234567'),
(17, 'Raúl Flores', '71234567'),
(18, 'Elena Álvarez', '81234567'),
(19, 'Santiago Vargas', '91234567'),
(20, 'Natalia Romero', '00123456');



-- migrate:down
DELETE FROM boletas
