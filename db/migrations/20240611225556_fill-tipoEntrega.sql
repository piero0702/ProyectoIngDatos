-- migrate:up

INSERT INTO tiposEntrega (id,nombre,costo) VALUES
    (1, 'recojoTienda' ,'0'),
    (2, 'envioDomicilio' ,'10');

-- migrate:down

DELETE FROM tiposEntrega