-- migrate:up

INSERT INTO tiposProducto (id,nombre) VALUES 
    (1,'regalo'),
    (2,'GrabadoLaser');
-- migrate:down
DELETE FROM tiposProducto;
