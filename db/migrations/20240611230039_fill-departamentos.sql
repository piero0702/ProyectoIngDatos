-- migrate:up

INSERT INTO departamentos (id, nombre) VALUES
    (1, 'Lima'),
    (2, 'Arequipa'),
    (3, 'La Libertad');

-- migrate:down

DELETE FROM departamentos;