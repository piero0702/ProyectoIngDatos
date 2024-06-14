-- migrate:up
-- Inserción de registros en la tabla regalos

INSERT INTO regalos (id, nombresYApellidos, tarjetaRegalo) VALUES
    (1, 'Juan Pérez', 'Feliz Cumpleaños'),
    (2, 'María García', 'Con cariño y amor'),
    (3, 'Luis Rodríguez', 'Para una persona especial'),
    (4, 'Ana Martínez', 'Muchas felicidades'),
    (5, 'Carlos Gómez', 'Te deseo lo mejor'),
    (6, 'Laura Fernández', 'Gracias por todo'),
    (7, 'Jorge López', 'Eres increíble'),
    (8, 'Marta Sánchez', 'Con todo mi cariño'),
    (9, 'Pedro González', 'Un regalo para la mejor'),
    (10, 'Lucía Ramírez', 'Disfruta tu día'),
    (11, 'José Torres', 'Un pequeño detalle'),
    (12, 'Isabel Díaz', 'Siempre contigo'),
    (13, 'Ricardo Jiménez', 'Para alguien especial'),
    (14, 'Sofía Moreno', 'Te lo mereces'),
    (15, 'David Rojas', 'Con mucho aprecio'),
    (16, 'Carmen Castro', 'Felicidades siempre'),
    (17, 'Raúl Flores', 'Mis mejores deseos'),
    (18, 'Elena Álvarez', 'Que lo disfrutes'),
    (19, 'Santiago Vargas', 'Un detalle especial'),
    (20, 'Natalia Romero', 'Gracias por tu amistad');

-- migrate:down
DELETE FROM regalos
