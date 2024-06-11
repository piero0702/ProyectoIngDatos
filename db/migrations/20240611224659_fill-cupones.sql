-- migrate:up

-- Inserción de 20 registros en la tabla cupones

INSERT INTO cupones (id, codigo, porcentajeDescuento) VALUES
    (1, 'CUPON01', 0.10),
    (2, 'CUPON02', 0.15),
    (3, 'CUPON03', 0.20),
    (4, 'CUPON04', 0.25),
    (5, 'CUPON05', 0.30),
    (6, 'CUPON06', 0.05),
    (7, 'CUPON07', 0.12),
    (8, 'CUPON08', 0.18),
    (9, 'CUPON09', 0.22),
    (10, 'CUPON10', 0.08),
    (11, 'CUPON11', 0.17),
    (12, 'CUPON12', 0.14),
    (13, 'CUPON13', 0.19),
    (14, 'CUPON14', 0.23),
    (15, 'CUPON15', 0.09),
    (16, 'CUPON16', 0.16),
    (17, 'CUPON17', 0.13),
    (18, 'CUPON18', 0.21),
    (19, 'CUPON19', 0.24),
    (20, 'CUPON20', 0.11);

-- migrate:down

DELETE FROM cupones