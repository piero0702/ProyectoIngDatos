-- migrate:up

INSERT INTO tiposEntrega (id,nombre) VALUES
    (1, 'recojoTienda'),
    (2, 'envioDomicilio');

-- migrate:down

DELETE FROM tiposEntrega