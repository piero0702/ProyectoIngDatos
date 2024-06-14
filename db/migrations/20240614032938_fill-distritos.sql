-- migrate:up

INSERT INTO distritos (id, nombre, provincia_id) VALUES
    (1, 'Lima', 1),
    (2, 'San Juan de Lurigancho', 1),
    (3, 'Arequipa', 3),
    (4, 'Miraflores', 1),
    (5, 'Cercado de Lima', 1),
    (6, 'El Agustino', 1),
    (7, 'Pueblo Libre', 1),
    (8, 'Trujillo', 4),
    (9, 'Victor Larco Herrera', 4);
-- migrate:down

DELETE FROM distritos