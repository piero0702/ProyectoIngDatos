-- migrate:up

-- Inserción de 20 registros en la tabla facturas

-- Inserción de 20 registros en la tabla facturas con IDs

INSERT INTO facturas (id, razonSocial, ruc) VALUES
(1, 'Empresa A', '20123456789'),
(2, 'Empresa B', '20234567890'),
(3, 'Empresa C', '20345678901'),
(4, 'Empresa D', '20456789012'),
(5, 'Empresa E', '20567890123'),
(6, 'Empresa F', '20678901234'),
(7, 'Empresa G', '20789012345'),
(8, 'Empresa H', '20890123456'),
(9, 'Empresa I', '20901234567'),
(10, 'Empresa J', '21012345678'),
(11, 'Empresa K', '21123456789'),
(12, 'Empresa L', '21234567890'),
(13, 'Empresa M', '21345678901'),
(14, 'Empresa N', '21456789012'),
(15, 'Empresa O', '21567890123'),
(16, 'Empresa P', '21678901234'),
(17, 'Empresa Q', '21789012345'),
(18, 'Empresa R', '21890123456'),
(19, 'Empresa S', '21901234567'),
(20, 'Empresa T', '22012345678');


-- migrate:down

DELETE FROM facturas