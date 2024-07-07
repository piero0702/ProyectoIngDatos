-- migrate:up

INSERT INTO tiposDocumento (id,nombre) VALUES 
    (1,'DNI'),
    (2,'Pasaporte');
-- migrate:down
DELETE FROM tiposDocumento;
