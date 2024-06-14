-- migrate:up

INSERT INTO provincias (id, nombre, departamento_id) VALUES
    (1, 'Lima', 1),
    (2, 'Callao', 1),
    (3, 'Arequipa', 2),
    (4, 'Trujillo', 3);

-- migrate:down

DELETE FROM provincias;