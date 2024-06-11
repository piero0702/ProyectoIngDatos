-- migrate:up

INSERT INTO tiposDireccion (id,nombre) VALUES
    (1, 'cliente'),
    (2, 'pago');

-- migrate:down

DELETE FROM tiposDireccion