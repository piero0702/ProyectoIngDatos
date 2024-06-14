-- migrate:up

INSERT INTO direcciones (id, direccionEntrega, codigoPostal, nroDepartamento, distrito_id, tipoDireccion_id) VALUES
    (1, 'Av. Primavera 123', '15023', 5, 1, 1),
    (2, 'Jr. Arequipa 456', '04001', 10, 3, 2),
    (3, 'Calle Los Pinos 789', '07010', 8, 2, 1),
    (4, 'Av. Tacna 567', '13001', 7, 4, 2),
    (5, 'Jr. Huancayo 890', '09025', 12, 5, 1),
    (6, 'Calle Los Sauces 432', '15047', 3, 6, 2),
    (7, 'Av. Angamos Oeste 210', '18', 11, 7, 1),
    (8, 'Jr. Piura 765', '13014', 6, 8, 2),
    (9, 'Calle Lima 987', '04002', 9, 9, 1),
    (10, 'Av. Arequipa 321', '07025', 4, 10, 1),
    (11, 'Jr. Cusco 654', '15018', 15, 1, 2),
    (12, 'Calle Huancavelica 123', '09010', 2, 2, 1),
    (13, 'Av. Abancay 456', '04011', 13, 3, 2),
    (14, 'Jr. Tacna 789', '13012', 17, 4, 1),
    (15, 'Calle Junín 210', '07001', 1, 5, 2),
    (16, 'Av. Puno 543', '15030', 14, 6, 1),
    (17, 'Jr. Iquitos 876', '09015', 16, 7, 2),
    (18, 'Calle Moquegua 654', '18', 18, 8, 1),
    (19, 'Av. Lambayeque 987', '13020', 19, 9, 2),
    (20, 'Jr. Ayacucho 321', '04015', 20, 10, 1);


-- migrate:down

DELETE FROM direcciones
