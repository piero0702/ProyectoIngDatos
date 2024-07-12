-- migrate:up

CREATE TABLE tipos (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE tipos;

-- migrate:up

CREATE TABLE colores (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE colores;

-- migrate:up

CREATE TABLE tamanios (
    id INTEGER PRIMARY KEY,
    numeroMl VARCHAR(50)
);
-- migrate:down
DROP TABLE tamanios;

-- migrate:up
CREATE TABLE productos (
    id INT PRIMARY KEY,
    descripcion TEXT,
    cuidados TEXT,
    propiedades TEXT,
    stock INT,
    tipo_id INT,
    color_id INT,
    tamano_id INT,
    imagen VARCHAR(100),
    precio FLOAT,
    FOREIGN KEY (tipo_id) REFERENCES otra_tabla_tipo(id),
    FOREIGN KEY (color_id) REFERENCES otra_tabla_color(id),
    FOREIGN KEY (tamano_id) REFERENCES otra_tabla_tamano(id)
);
-- migrate:down
DROP TABLE productos;


-- migrate:up

CREATE TABLE tiposProducto (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR(50)
);
-- migrate:down
DROP TABLE tiposProducto;


-- migrate:up
CREATE TABLE pedidos (
  id INT PRIMARY KEY,
  tipoEntrega_id INT,
  cupon_id INT,
  cliente_id INT,
  FOREIGN KEY (tipoEntrega_id) REFERENCES tiposEntrega(id),
  FOREIGN KEY (cupon_id) REFERENCES cupones(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
-- migrate:down
DROP TABLE pedidos;


-- migrate:up LISTOOOOOOO
CREATE TABLE tiposEntrega (
  id INT PRIMARY KEY,
  nombre VARCHAR(40)
);
-- migrate:down
DROP TABLE tiposEntrega;


-- migrate:up
CREATE TABLE cupones (
  id INT PRIMARY KEY,
  codigo VARCHAR(15),
  porcentajeDsct FLOAT
);
-- migrate:down
DROP TABLE cupones;


-- migrate:up
CREATE TABLE clientes (
  id INT PRIMARY KEY,
  nombres VARCHAR(50),
  apellidos VARCHAR(80),
  telefono VARCHAR(10),
  nroDocumento VARCHAR(8),
  email VARCHAR(100),
  contrasenia VARCHAR(8),
  tipoDocumento_id INT,
  direccion_id INT,
  FOREIGN KEY (tipoDocumento_id) REFERENCES tiposDocumento(id),
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id)
);

-- migrate:down

DROP TABLE clientes;


-- migrate:up
CREATE TABLE tiposDocumento (
  id INT PRIMARY KEY,
  nombre VARCHAR(50)
);
-- migrate:down
DROP TABLE tiposDocumento;


-- migrate:up
CREATE TABLE pedidos_productos (
  id INT PRIMARY KEY,
  pedido_id INT,
  producto_id INT,
  tipoProducto_id INT,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (tipoProducto_id) REFERENCES tiposProducto(id)
);
-- migrate:down
DROP TABLE pedidos_productos;

-- migrate:up

CREATE TABLE distritos (
    id INTEGER PRIMARY KEY,
    nombres VARCHAR(50)
);
-- migrate:down
DROP TABLE distritos;

-- migrate:up

CREATE TABLE direcciones (
  id INT PRIMARY KEY,
  direccionEntrega VARCHAR(60),
  codigoPostal VARCHAR(10),
  distrito_id INT,
  FOREIGN KEY (distrito_id) REFERENCES distritos(id)
);
-- migrate:down
DROP TABLE direcciones;


-- migrate:up

CREATE TABLE pagos (
  id INT PRIMARY KEY,
  direccion_id INT,
  cliente_id INT,
  pedido_id INT,
  importeTotal FLOAT,
  observaciones TEXT,
  FOREIGN KEY (direccion_id) REFERENCES direcciones(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);
-- migrate:down
DROP TABLE pagos;





-- migrate:up

INSERT INTO tipos (id, nombres) VALUES
    (1, 'Bottles'),
    (2, 'Sport'),
    (3, 'Cups'),
    (4, 'Pet'),
    (5, 'Ceramic'),
    (6, 'Mug');

-- migrate:down

DELETE FROM tipos


-- migrate:up

INSERT INTO colores (id,nombres) VALUES
    (1, 'Manu'),
    (2, 'White Marble'),
    (3, 'Lemon'),
    (4, 'Sky Blue'),
    (5, 'Amber'),
    (6, 'Maras'),
    (7, 'Curitiba'),
    (8, 'Navy Blue'),
    (9, 'Terracota'),
    (10, 'Lima'),
    (11, 'Bariloche'),
    (12, 'Máncora'),
    (13, 'Ombre Blue Light'),
    (14, 'Ombre Sky'),
    (15, 'Ombre Lila'),
    (16, 'Ombre Water'),
    (17, 'Coral'),
    (18, 'Baja Sand'),
    (19, 'Lila'),
    (20, 'Salinas'),
    (21, 'Canopi'),
    (22, 'Aqua'),
    (23, 'Midnight'),
    (24 , 'Pampilla');

-- migrate:down

DELETE FROM colores

-- migrate:up

INSERT INTO tamanios (id, numeroMl) VALUES
    (1, 350),
    (2, 360),
    (3, 415),
    (4, 500),
    (5, 590),
    (6, 600),
    (7, 650),
    (8, 700),
    (9, 750),
    (10, 850),
    (11, 950),
    (12, 1200);
-- migrate:down

DELETE FROM tamanios;

-- migrate:up
INSERT INTO productos (id, descripcion, cuidados, propiedades, stock, tipo_id, color_id, tamano_id, imagen, precio) VALUES
    (1, 'Fluye Bottle 500 ml Manu', 
        'Hand wash only. Do not microwave.', 
        'Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.', 
        50, 1, 1, 4, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png', 89.00),
    (2, 'Fluye Bottle 500 ml White Marble', 
        'Hand wash only. Do not microwave.', 
        'Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.', 
        50, 1, 2, 4, 'https://fluye-statics.s3.amazonaws.com/product_color/Bottle_500_White_Marble_Logo.png', 89.00),
    (3, 'Fluye Bottle 500 ml Producto Solidario CRM Yellow', 
        'Hand wash only. Do not microwave.', 
        'Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.', 
        50, 1, 3, 4, 'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_Lima_3.png', 80.00),
    (4, 'Fluye Bottle 500 ml Producto Solidario CRM Blue', 
        'Hand wash only. Do not microwave.', 
        'Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.', 
        50, 1, 4, 4, 'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_SkyBlue_1.png', 80.00),
    (5, 'Fluye Sport 700 ml Baja Sand', 
        'Dishwasher safe. Do not freeze.', 
        'Lightweight and durable. Made from BPA-free plastic.', 
        50, 2, 18, 8, 'https://fluye-statics.s3.amazonaws.com/product_color/Sport_Baja_Sand_700ml.png', 89.00),
    (6, 'Fluye Sport 700 ml Lila', 
        'Dishwasher safe. Do not freeze.', 
        'Lightweight and durable. Made from BPA-free plastic.', 
        50, 2, 19, 8, 'https://fluye-statics.s3.amazonaws.com/product_color/Sport_700_Lila_Logo.png', 89.00),
    (7, 'Fluye Cup Pro 590 ml Manu', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        35, 3, 1, 5, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png', 89.00),
    (8, 'Fluye Cup Pro 590 ml Maras', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        45, 3, 6, 5, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Maras_Logo.png', 79.00),
    (9, 'Fluye Cup Pro 590 ml Baja Sand', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        40, 3, 18, 5, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Baja_Sand_Logo.png', 79.00),
    (10, 'Fluye Cup Pro 590 ml Navy Blue', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        30, 3, 8, 5, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Navy_Blue_Logo.png', 79.00),
    (11, 'Fluye Cup Pro 590 ml Lemon', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        20, 3, 3, 5, 'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Lemon_Logo.png', 79.00),
    (12, 'Fluye Ceramic Pro 600 ml Baja Sand', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        50, 5, 18, 6, 'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Baja_Sand_Logo.png', 129.00),
    (13, 'Fluye Ceramic Pro 600 ml Bariloche', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        45, 5, 11, 6, 'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Bariloche_Logo.png', 129.00),
    (14, 'Fluye Ceramic Pro 600 ml Lila', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        35, 5, 19, 6, 'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Lila_Logo.png', 129.00),
    (15, 'Fluye Ceramic Pro 600 ml Navy Blue', 
        'Lavar a mano con agua tibia', 
        'Aislante térmico', 
        25, 5, 8, 6, 'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Navy_Blue_Logo.png', 129.00);
-- migrate:down
DELETE FROM productos


-- migrate:up

INSERT INTO tiposProducto (id,nombre) VALUES 
    (1,'regalo'),
    (2,'GrabadoLaser');
-- migrate:down
DELETE FROM tiposProducto;



-- migrate:up
INSERT INTO pedidos (id, tipoEntrega_id, cupon_id, cliente_id) VALUES
  (1, 1, 1, 1),  -- Envío estándar, CUPON10, cliente 1
  (2, 2, 3, 2),  -- Envío express, PRIMERCOMPRADOR, cliente 2
  (3, 3, NULL, 3),  -- Recoger en tienda, sin cupón, cliente 3
  (4, 1, 5, 4),  -- Envío estándar, BLACKFRIDAY30, cliente 4
  (5, 4, 2, 5),  -- Envío gratuito, VERANO20, cliente 5
  (6, 2, 8, 6),  -- Envío express, ESTRENOCASA20, cliente 6
  (7, 1, 10, 7),  -- Envío estándar, ULTIMACHANCE12, cliente 7
  (8, 3, NULL, 8),  -- Recoger en tienda, sin cupón, cliente 8
  (9, 1, 4, 9),  -- Envío estándar, FIELDCOMPANY, cliente 9
  (10, 2, 6, 10);  -- Envío express, CYBERMONDAY25, cliente 10
-- migrate:down
DELETE FROM pedidos;


-- migrate:up
INSERT INTO tiposEntrega (id, nombre) VALUES
  (1, 'Envío estándar'),
  (2, 'Envío express'),
  (3, 'Recoger en tienda'),
  (4, 'Envío gratuito'),
  (5, 'Envío urgente');
-- migrate:down
DELETE FROM tiposEntrega;

-- migrate:up
INSERT INTO cupones (id, codigo, porcentajeDsct) VALUES
  (1, 'CUPON10', 10.0),
  (2, 'VERANO20', 20.0),
  (3, 'PRIMERCOMPRADOR', 15.0),
  (4, 'FIELDCOMPANY', 12.0),
  (5, 'BLACKFRIDAY30', 30.0),
  (6, 'CYBERMONDAY25', 25.0),
  (7, 'REGALO15', 15.0),
  (8, 'ESTRENOCASA20', 20.0),
  (9, 'COMPRARMAIS', 18.0),
  (10, 'ULTIMACHANCE12', 12.0);
-- migrate:down
DELETE FROM cupones;


-- migrate:up

INSERT INTO clientes (id, nombres, apellidos, telefono, nroDocumento, email, contrasenia, tipoDocumento_id, direccion_id)
VALUES
  (1, 'Juan', 'Pérez', '1234567890', '12345678', 'juan.perez@example.com', 'juan123', 1, 1),
  (2, 'María', 'González', '9876543210', '98765432', 'aria.gonzalez@example.com', 'aria123', 2, 2),
  (3, 'Pedro', 'Rodríguez', '5551234567', '55512345', 'pedro.rodriguez@example.com', 'pedro123', 1, 3),
  (4, 'Ana', 'Díaz', '7778889990', '77788899', 'ana.diaz@example.com', 'ana123', 2, 4),
  (5, 'Luis', 'Hernández', '6665554444', '66655544', 'luis.hernandez@example.com', 'luis123', 1, 5),
  (6, 'Sofía', 'García', '3332221111', '33322211', 'ofia.garcia@example.com', 'ofia123', 2, 6),
  (7, 'Carlos', 'Martínez', '9998887770', '99988877', 'carlos.martinez@example.com', 'carlos123', 1, 7),
  (8, 'Laura', 'Sánchez', '4443332222', '44433322', 'laura.sanchez@example.com', 'laura123', 2, 8),
  (9, 'Javier', 'López', '8887776665', '88877766', 'javier.lopez@example.com', 'javier123', 1, 9),
  (10, 'Elena', 'Gómez', '2221110000', '22211100', 'elena.gomez@example.com', 'elena123', 2, 10);
-- migrate:down
DELETE FROM clientes;


-- migrate:up

INSERT INTO tiposDocumento (id,nombre) VALUES 
    (1,'DNI'),
    (2,'Pasaporte');
-- migrate:down
DELETE FROM tiposDocumento;

-- migrate:up
INSERT INTO pedidos_productos (id, pedido_id, producto_id, tipoProducto_id) VALUES
  (1, 1, 1, 1),  -- Pedido 1 incluye producto 1 como regalo
  (2, 2, 2, 2),  -- Pedido 2 incluye producto 2 con grabado láser
  (3, 3, 1, 1),  -- Pedido 3 incluye producto 1 como regalo
  (4, 4, 2, 2),  -- Pedido 4 incluye producto 2 con grabado láser
  (5, 5, 1, 1),  -- Pedido 5 incluye producto 1 como regalo
  (6, 6, 2, 2),  -- Pedido 6 incluye producto 2 con grabado láser
  (7, 7, 1, 1),  -- Pedido 7 incluye producto 1 como regalo
  (8, 8, 2, 2),  -- Pedido 8 incluye producto 2 con grabado láser
  (9, 9, 1, 1),  -- Pedido 9 incluye producto 1 como regalo
  (10, 10, 2, 2); -- Pedido 10 incluye producto 2 con grabado láser
-- migrate:down
DELETE FROM pedidos_productos;

-- migrate:up
INSERT INTO distritos (id, nombres)
VALUES
  (1, 'Ancón'),
  (2, 'Ate'),
  (3, 'Barranco'),
  (4, 'Breña'),
  (5, 'Carabayllo'),
  (6, 'Chaclacayo'),
  (7, 'Chorrillos'),
  (8, 'Cieneguilla'),
  (9, 'Comas'),
  (10, 'El Agustino'),
  (11, 'Independencia'),
  (12, 'Jesús María'),
  (13, 'La Molina'),
  (14, 'La Victoria'),
  (15, 'Lima'),
  (16, 'Lince'),
  (17, 'Los Olivos'),
  (18, 'Lurín'),
  (19, 'Lurigancho'),
  (20, 'Magdalena del Mar'),
  (21, 'Miraflores'),
  (22, 'Pachacamac'),
  (23, 'Pucusana'),
  (24, 'Pueblo Libre'),
  (25, 'Puente Piedra'),
  (26, 'Punta Hermosa'),
  (27, 'Punta Negra'),
  (28, 'Rímac'),
  (29, 'San Bartolo'),
  (30, 'San Borja'),
  (31, 'San Isidro'),
  (32, 'San Juan de Lurigancho'),
  (33, 'San Juan de Miraflores'),
  (34, 'San Luis'),
  (35, 'San Martín de Porres'),
  (36, 'San Miguel'),
  (37, 'Santa Anita'),
  (38, 'Santa María del Mar'),
  (39, 'Santa Rosa'),
  (40, 'Santiago de Surco'),
  (41, 'Surquillo'),
  (42, 'Villa El Salvador'),
  (43, 'Villa María del Triunfo');

-- migrate:down

DELETE FROM distritos;

-- migrate:up
INSERT INTO direcciones (id, direccionEntrega, codigoPostal, distrito_id)
VALUES
  (1, 'Av. Primavera 123', '15001', 1),
  (2, 'Jr. Los Olivos 456', '15002', 2),
  (3, 'Calle Las Flores 789', '15003', 3),
  (4, 'Av. Angamos 321', '15004', 4),
  (5, 'Jr. San Martín 654', '15005', 5),
  (6, 'Calle Los Pinos 987', '15006', 6),
  (7, 'Av. Chorrillos 159', '15007', 7),
  (8, 'Jr. Independencia 753', '15008', 8),
  (9, 'Calle Libertad 951', '15009', 9),
  (10, 'Av. La Paz 159', '15010', 10),
  (11, 'Jr. Amazonas 357', '15011', 11),
  (12, 'Calle Miraflores 753', '15012', 12),
  (13, 'Av. Primavera 357', '15013', 13),
  (14, 'Jr. Los Cedros 159', '15014', 14),
  (15, 'Calle Las Orquídeas 753', '15015', 15),
  (16, 'Av. San Felipe 951', '15016', 16),
  (17, 'Jr. Santa Rosa 159', '15017', 17),
  (18, 'Calle Las Magnolias 753', '15018', 18),
  (19, 'Av. Industrial 951', '15019', 19),
  (20, 'Jr. La Unión 159', '15020', 20),
  (21, 'Calle Los Almendros 753', '15021', 21),
  (22, 'Av. Los Eucaliptos 951', '15022', 22),
  (23, 'Jr. Los Sauces 159', '15023', 23),
  (24, 'Calle Las Lomas 753', '15024', 24),
  (25, 'Av. Los Nogales 951', '15025', 25),
  (26, 'Jr. Los Tulipanes 159', '15026', 26),
  (27, 'Calle Las Violetas 753', '15027', 27),
  (28, 'Av. Las Palmeras 951', '15028', 28),
  (29, 'Jr. Las Acacias 159', '15029', 29),
  (30, 'Calle Las Margaritas 753', '15030', 30);
-- migrate:down
DELETE FROM direcciones;


-- migrate:up
INSERT INTO pagos (id, direccion_id, cliente_id, pedido_id, importeTotal, observaciones) VALUES
  (1, 1, 1, 1, 100.50, 'Pago realizado con tarjeta de crédito'),
  (2, 2, 2, 2, 200.75, 'Pago realizado mediante transferencia bancaria'),
  (3, 3, 3, 3, 150.00, 'Pago realizado en efectivo'),
  (4, 4, 4, 4, 250.25, 'Pago realizado con tarjeta de débito'),
  (5, 5, 5, 5, 175.50, 'Pago realizado con PayPal');
-- migrate:down 
DROP TABLE pagos;



