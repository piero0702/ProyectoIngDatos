-- migrate:up
-- Inserción de registros en la tabla regalos

INSERT INTO regalos (id, nombresYApellidos, tarjetaRegalo, costoAdicional) VALUES
    (1, 'Juan Pérez', 'Feliz Cumpleaños', 20.50),
    (2, 'María García', 'Con cariño y amor', 15.75),
    (3, 'Luis Rodríguez', 'Para una persona especial', 10.00),
    (4, 'Ana Martínez', 'Muchas felicidades', 25.00),
    (5, 'Carlos Gómez', 'Te deseo lo mejor', 18.25),
    (6, 'Laura Fernández', 'Gracias por todo', 12.00),
    (7, 'Jorge López', 'Eres increíble', 22.50),
    (8, 'Marta Sánchez', 'Con todo mi cariño', 17.75),
    (9, 'Pedro González', 'Un regalo para ti', 30.00),
    (10, 'Lucía Ramírez', 'Disfruta tu día', 19.99),
    (11, 'José Torres', 'Un pequeño detalle', 16.40),
    (12, 'Isabel Díaz', 'Siempre contigo', 14.85),
    (13, 'Ricardo Jiménez', 'Para alguien especial', 21.30),
    (14, 'Sofía Moreno', 'Te lo mereces', 24.90),
    (15, 'David Rojas', 'Con mucho aprecio', 13.50),
    (16, 'Carmen Castro', 'Felicidades siempre', 20.00),
    (17, 'Raúl Flores', 'Mis mejores deseos', 18.75),
    (18, 'Elena Álvarez', 'Que lo disfrutes', 26.10),
    (19, 'Santiago Vargas', 'Un detalle especial', 22.95),
    (20, 'Natalia Romero', 'Gracias por tu amistad', 17.60);

-- migrate:down
DELETE FROM regalos
