-- migrate:up

INSERT INTO fuentesTexto (id,nombre) VALUES
    (1, 'Light'),
    (2, 'Heavy'),
    (3, 'Bold'),
    (4, 'Italic'),
    (5, 'Classic'),
    (6, 'Bride');

-- migrate:down

DELETE FROM fuentesTexto