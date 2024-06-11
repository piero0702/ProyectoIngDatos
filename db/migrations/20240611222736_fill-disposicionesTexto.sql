-- migrate:up

INSERT INTO disposicionesTexto (id,nombre) VALUES
    (1, 'Horizontal'),
    (2, 'Horizontal 2'),
    (3, 'Vertical');

-- migrate:down

DELETE FROM disposicionesTexto