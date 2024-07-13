BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar(128),
	PRIMARY KEY("version")
);
CREATE TABLE IF NOT EXISTS "tipos" (
	"id"	INTEGER,
	"nombres"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "colores" (
	"id"	INTEGER,
	"nombres"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tamanios" (
	"id"	INTEGER,
	"numeroMl"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "productos" (
	"id"	INT,
	"descripcion"	TEXT,
	"cuidados"	TEXT,
	"propiedades"	TEXT,
	"stock"	INT,
	"tipo_id"	INT,
	"color_id"	INT,
	"tamano_id"	INT,
	"imagen"	VARCHAR(100),
	"precio"	FLOAT,
	FOREIGN KEY("tamano_id") REFERENCES "otra_tabla_tamano"("id"),
	FOREIGN KEY("tipo_id") REFERENCES "otra_tabla_tipo"("id"),
	FOREIGN KEY("color_id") REFERENCES "otra_tabla_color"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tiposProducto" (
	"id"	INTEGER,
	"nombre"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "pedidos" (
	"id"	INTEGER,
	"tipoEntrega_id"	INT,
	"cupon_id"	INT,
	"cliente_id"	INT,
	FOREIGN KEY("cupon_id") REFERENCES "cupones"("id"),
	FOREIGN KEY("tipoEntrega_id") REFERENCES "tiposEntrega"("id"),
	FOREIGN KEY("cliente_id") REFERENCES "clientes"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tiposEntrega" (
	"id"	INT,
	"nombre"	VARCHAR(40),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "cupones" (
	"id"	INT,
	"codigo"	VARCHAR(15),
	"porcentajeDsct"	FLOAT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "clientes" (
	"id"	INTEGER,
	"nombres"	VARCHAR(50),
	"apellidos"	VARCHAR(80),
	"telefono"	VARCHAR(10),
	"nroDocumento"	VARCHAR(8),
	"email"	VARCHAR(100),
	"contrasenia"	VARCHAR(8),
	"tipoDocumento_id"	INT,
	"direccion_id"	INT,
	FOREIGN KEY("tipoDocumento_id") REFERENCES "tiposDocumento"("id"),
	FOREIGN KEY("direccion_id") REFERENCES "direcciones"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "tiposDocumento" (
	"id"	INT,
	"nombre"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "pedidos_productos" (
	"id"	INT,
	"pedido_id"	INT,
	"producto_id"	INT,
	"tipoProducto_id"	INT,
	FOREIGN KEY("pedido_id") REFERENCES "pedidos"("id"),
	FOREIGN KEY("tipoProducto_id") REFERENCES "tiposProducto"("id"),
	FOREIGN KEY("producto_id") REFERENCES "productos"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "distritos" (
	"id"	INTEGER,
	"nombres"	VARCHAR(50),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "direcciones" (
	"id"	INT,
	"direccionEntrega"	VARCHAR(60),
	"codigoPostal"	VARCHAR(10),
	"distrito_id"	INT,
	FOREIGN KEY("distrito_id") REFERENCES "distritos"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "pagos" (
	"id"	INT,
	"direccion_id"	INT,
	"cliente_id"	INT,
	"pedido_id"	INT,
	"importeTotal"	FLOAT,
	"observaciones"	TEXT,
	FOREIGN KEY("direccion_id") REFERENCES "direcciones"("id"),
	FOREIGN KEY("pedido_id") REFERENCES "pedidos"("id"),
	FOREIGN KEY("cliente_id") REFERENCES "clientes"("id"),
	PRIMARY KEY("id")
);
INSERT INTO "schema_migrations" VALUES ('20240701205336');
INSERT INTO "schema_migrations" VALUES ('20240701205342');
INSERT INTO "schema_migrations" VALUES ('20240701205346');
INSERT INTO "schema_migrations" VALUES ('20240701205754');
INSERT INTO "schema_migrations" VALUES ('20240701205759');
INSERT INTO "schema_migrations" VALUES ('20240701205803');
INSERT INTO "schema_migrations" VALUES ('20240701234159');
INSERT INTO "schema_migrations" VALUES ('20240701234504');
INSERT INTO "schema_migrations" VALUES ('20240707032815');
INSERT INTO "schema_migrations" VALUES ('20240707032925');
INSERT INTO "schema_migrations" VALUES ('20240707033124');
INSERT INTO "schema_migrations" VALUES ('20240707033506');
INSERT INTO "schema_migrations" VALUES ('20240707033703');
INSERT INTO "schema_migrations" VALUES ('20240707033712');
INSERT INTO "schema_migrations" VALUES ('20240707033840');
INSERT INTO "schema_migrations" VALUES ('20240707033848');
INSERT INTO "schema_migrations" VALUES ('20240707034646');
INSERT INTO "schema_migrations" VALUES ('20240707035052');
INSERT INTO "schema_migrations" VALUES ('20240707035341');
INSERT INTO "schema_migrations" VALUES ('20240707040229');
INSERT INTO "schema_migrations" VALUES ('20240707040517');
INSERT INTO "schema_migrations" VALUES ('20240707040527');
INSERT INTO "schema_migrations" VALUES ('20240707041324');
INSERT INTO "schema_migrations" VALUES ('20240707041405');
INSERT INTO "schema_migrations" VALUES ('20240707041421');
INSERT INTO "schema_migrations" VALUES ('20240707041428');
INSERT INTO "schema_migrations" VALUES ('20240707041432');
INSERT INTO "schema_migrations" VALUES ('20240707041438');
INSERT INTO "tipos" VALUES (1,'Bottles');
INSERT INTO "tipos" VALUES (2,'Sport');
INSERT INTO "tipos" VALUES (3,'Cups');
INSERT INTO "tipos" VALUES (4,'Pet');
INSERT INTO "tipos" VALUES (5,'Ceramic');
INSERT INTO "tipos" VALUES (6,'Mug');
INSERT INTO "colores" VALUES (1,'Manu');
INSERT INTO "colores" VALUES (2,'White Marble');
INSERT INTO "colores" VALUES (3,'Lemon');
INSERT INTO "colores" VALUES (4,'Sky Blue');
INSERT INTO "colores" VALUES (5,'Amber');
INSERT INTO "colores" VALUES (6,'Maras');
INSERT INTO "colores" VALUES (7,'Curitiba');
INSERT INTO "colores" VALUES (8,'Navy Blue');
INSERT INTO "colores" VALUES (9,'Terracota');
INSERT INTO "colores" VALUES (10,'Lima');
INSERT INTO "colores" VALUES (11,'Bariloche');
INSERT INTO "colores" VALUES (12,'Máncora');
INSERT INTO "colores" VALUES (13,'Ombre Blue Light');
INSERT INTO "colores" VALUES (14,'Ombre Sky');
INSERT INTO "colores" VALUES (15,'Ombre Lila');
INSERT INTO "colores" VALUES (16,'Ombre Water');
INSERT INTO "colores" VALUES (17,'Coral');
INSERT INTO "colores" VALUES (18,'Baja Sand');
INSERT INTO "colores" VALUES (19,'Lila');
INSERT INTO "colores" VALUES (20,'Salinas');
INSERT INTO "colores" VALUES (21,'Canopi');
INSERT INTO "colores" VALUES (22,'Aqua');
INSERT INTO "colores" VALUES (23,'Midnight');
INSERT INTO "colores" VALUES (24,'Pampilla');
INSERT INTO "tamanios" VALUES (1,'350');
INSERT INTO "tamanios" VALUES (2,'360');
INSERT INTO "tamanios" VALUES (3,'415');
INSERT INTO "tamanios" VALUES (4,'500');
INSERT INTO "tamanios" VALUES (5,'590');
INSERT INTO "tamanios" VALUES (6,'600');
INSERT INTO "tamanios" VALUES (7,'650');
INSERT INTO "tamanios" VALUES (8,'700');
INSERT INTO "tamanios" VALUES (9,'750');
INSERT INTO "tamanios" VALUES (10,'850');
INSERT INTO "tamanios" VALUES (11,'950');
INSERT INTO "tamanios" VALUES (12,'1200');
INSERT INTO "productos" VALUES (1,'Fluye Bottle 500 ml Manu','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,1,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png',89.0);
INSERT INTO "productos" VALUES (2,'Fluye Bottle 500 ml White Marble','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,2,4,'https://fluye-statics.s3.amazonaws.com/product_color/Bottle_500_White_Marble_Logo.png',89.0);
INSERT INTO "productos" VALUES (3,'Fluye Bottle 500 ml Producto Solidario CRM Yellow','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,3,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_Lima_3.png',80.0);
INSERT INTO "productos" VALUES (4,'Fluye Bottle 500 ml Producto Solidario CRM Blue','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,4,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_SkyBlue_1.png',80.0);
INSERT INTO "productos" VALUES (5,'Fluye Sport 700 ml Baja Sand','Dishwasher safe. Do not freeze.','Lightweight and durable. Made from BPA-free plastic.',50,2,18,8,'https://fluye-statics.s3.amazonaws.com/product_color/Sport_Baja_Sand_700ml.png',89.0);
INSERT INTO "productos" VALUES (6,'Fluye Sport 700 ml Lila','Dishwasher safe. Do not freeze.','Lightweight and durable. Made from BPA-free plastic.',50,2,19,8,'https://fluye-statics.s3.amazonaws.com/product_color/Sport_700_Lila_Logo.png',89.0);
INSERT INTO "productos" VALUES (7,'Fluye Cup Pro 590 ml Manu','Lavar a mano con agua tibia','Aislante térmico',35,3,1,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png',89.0);
INSERT INTO "productos" VALUES (8,'Fluye Cup Pro 590 ml Maras','Lavar a mano con agua tibia','Aislante térmico',45,3,6,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Maras_Logo.png',79.0);
INSERT INTO "productos" VALUES (9,'Fluye Cup Pro 590 ml Baja Sand','Lavar a mano con agua tibia','Aislante térmico',40,3,18,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Baja_Sand_Logo.png',79.0);
INSERT INTO "productos" VALUES (10,'Fluye Cup Pro 590 ml Navy Blue','Lavar a mano con agua tibia','Aislante térmico',30,3,8,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Navy_Blue_Logo.png',79.0);
INSERT INTO "productos" VALUES (11,'Fluye Cup Pro 590 ml Lemon','Lavar a mano con agua tibia','Aislante térmico',20,3,3,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Lemon_Logo.png',79.0);
INSERT INTO "productos" VALUES (12,'Fluye Ceramic Pro 600 ml Baja Sand','Lavar a mano con agua tibia','Aislante térmico',50,5,18,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Baja_Sand_Logo.png',129.0);
INSERT INTO "productos" VALUES (13,'Fluye Ceramic Pro 600 ml Bariloche','Lavar a mano con agua tibia','Aislante térmico',45,5,11,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Bariloche_Logo.png',129.0);
INSERT INTO "productos" VALUES (14,'Fluye Ceramic Pro 600 ml Lila','Lavar a mano con agua tibia','Aislante térmico',35,5,19,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Lila_Logo.png',129.0);
INSERT INTO "productos" VALUES (15,'Fluye Ceramic Pro 600 ml Navy Blue','Lavar a mano con agua tibia','Aislante térmico',25,5,8,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Navy_Blue_Logo.png',129.0);
INSERT INTO "tiposProducto" VALUES (1,'regalo');
INSERT INTO "tiposProducto" VALUES (2,'GrabadoLaser');
INSERT INTO "pedidos" VALUES (1,1,1,1);
INSERT INTO "pedidos" VALUES (2,2,3,2);
INSERT INTO "pedidos" VALUES (3,3,NULL,3);
INSERT INTO "pedidos" VALUES (4,1,5,4);
INSERT INTO "pedidos" VALUES (5,4,2,5);
INSERT INTO "pedidos" VALUES (6,2,8,6);
INSERT INTO "pedidos" VALUES (7,1,10,7);
INSERT INTO "pedidos" VALUES (9,1,4,9);
INSERT INTO "pedidos" VALUES (10,2,6,10);
INSERT INTO "tiposEntrega" VALUES (1,'Envío estándar');
INSERT INTO "tiposEntrega" VALUES (2,'Envío express');
INSERT INTO "tiposEntrega" VALUES (3,'Recoger en tienda');
INSERT INTO "tiposEntrega" VALUES (4,'Envío gratuito');
INSERT INTO "tiposEntrega" VALUES (5,'Envío urgente');
INSERT INTO "cupones" VALUES (1,'CUPON10',10.0);
INSERT INTO "cupones" VALUES (2,'VERANO20',20.0);
INSERT INTO "cupones" VALUES (3,'PRIMERCOMPRADOR',15.0);
INSERT INTO "cupones" VALUES (4,'FIELDCOMPANY',12.0);
INSERT INTO "cupones" VALUES (5,'BLACKFRIDAY30',30.0);
INSERT INTO "cupones" VALUES (6,'CYBERMONDAY25',25.0);
INSERT INTO "cupones" VALUES (7,'REGALO15',15.0);
INSERT INTO "cupones" VALUES (8,'ESTRENOCASA20',20.0);
INSERT INTO "cupones" VALUES (9,'COMPRARMAIS',18.0);
INSERT INTO "cupones" VALUES (10,'ULTIMACHANCE12',12.0);
INSERT INTO "clientes" VALUES (1,'Juan','Pérez','1234567890','12345678','juan.perez@example.com','juan123',1,1);
INSERT INTO "clientes" VALUES (2,'María','González','9876543210','98765432','aria.gonzalez@example.com','aria123',2,2);
INSERT INTO "clientes" VALUES (3,'Pedro','Rodríguez','5551234567','55512345','pedro.rodriguez@example.com','pedro123',1,3);
INSERT INTO "clientes" VALUES (4,'Ana','Díaz','7778889990','77788899','ana.diaz@example.com','ana123',2,4);
INSERT INTO "clientes" VALUES (5,'Luis','Hernández','6665554444','66655544','luis.hernandez@example.com','luis123',1,5);
INSERT INTO "clientes" VALUES (6,'Sofía','García','3332221111','33322211','ofia.garcia@example.com','ofia123',2,6);
INSERT INTO "clientes" VALUES (7,'Carlos','Martínez','9998887770','99988877','carlos.martinez@example.com','carlos123',1,7);
INSERT INTO "clientes" VALUES (8,'Laura','Sánchez','4443332222','44433322','laura.sanchez@example.com','laura123',2,8);
INSERT INTO "clientes" VALUES (9,'Javier','López','8887776665','88877766','javier.lopez@example.com','javier123',1,9);
INSERT INTO "clientes" VALUES (10,'Elena','Gómez','2221110000','22211100','elena.gomez@example.com','elena123',2,10);
INSERT INTO "tiposDocumento" VALUES (1,'DNI');
INSERT INTO "tiposDocumento" VALUES (2,'Pasaporte');
INSERT INTO "pedidos_productos" VALUES (1,1,1,1);
INSERT INTO "pedidos_productos" VALUES (2,2,2,2);
INSERT INTO "pedidos_productos" VALUES (3,3,1,1);
INSERT INTO "pedidos_productos" VALUES (4,4,2,2);
INSERT INTO "pedidos_productos" VALUES (5,5,1,1);
INSERT INTO "pedidos_productos" VALUES (6,6,2,2);
INSERT INTO "pedidos_productos" VALUES (7,7,1,1);
INSERT INTO "pedidos_productos" VALUES (8,8,2,2);
INSERT INTO "pedidos_productos" VALUES (9,9,1,1);
INSERT INTO "pedidos_productos" VALUES (10,10,2,2);
INSERT INTO "distritos" VALUES (1,'Ancón');
INSERT INTO "distritos" VALUES (2,'Ate');
INSERT INTO "distritos" VALUES (3,'Barranco');
INSERT INTO "distritos" VALUES (4,'Breña');
INSERT INTO "distritos" VALUES (5,'Carabayllo');
INSERT INTO "distritos" VALUES (6,'Chaclacayo');
INSERT INTO "distritos" VALUES (7,'Chorrillos');
INSERT INTO "distritos" VALUES (8,'Cieneguilla');
INSERT INTO "distritos" VALUES (9,'Comas');
INSERT INTO "distritos" VALUES (10,'El Agustino');
INSERT INTO "distritos" VALUES (11,'Independencia');
INSERT INTO "distritos" VALUES (12,'Jesús María');
INSERT INTO "distritos" VALUES (13,'La Molina');
INSERT INTO "distritos" VALUES (14,'La Victoria');
INSERT INTO "distritos" VALUES (15,'Lima');
INSERT INTO "distritos" VALUES (16,'Lince');
INSERT INTO "distritos" VALUES (17,'Los Olivos');
INSERT INTO "distritos" VALUES (18,'Lurín');
INSERT INTO "distritos" VALUES (19,'Lurigancho');
INSERT INTO "distritos" VALUES (20,'Magdalena del Mar');
INSERT INTO "distritos" VALUES (21,'Miraflores');
INSERT INTO "distritos" VALUES (22,'Pachacamac');
INSERT INTO "distritos" VALUES (23,'Pucusana');
INSERT INTO "distritos" VALUES (24,'Pueblo Libre');
INSERT INTO "distritos" VALUES (25,'Puente Piedra');
INSERT INTO "distritos" VALUES (26,'Punta Hermosa');
INSERT INTO "distritos" VALUES (27,'Punta Negra');
INSERT INTO "distritos" VALUES (28,'Rímac');
INSERT INTO "distritos" VALUES (29,'San Bartolo');
INSERT INTO "distritos" VALUES (30,'San Borja');
INSERT INTO "distritos" VALUES (31,'San Isidro');
INSERT INTO "distritos" VALUES (32,'San Juan de Lurigancho');
INSERT INTO "distritos" VALUES (33,'San Juan de Miraflores');
INSERT INTO "distritos" VALUES (34,'San Luis');
INSERT INTO "distritos" VALUES (35,'San Martín de Porres');
INSERT INTO "distritos" VALUES (36,'San Miguel');
INSERT INTO "distritos" VALUES (37,'Santa Anita');
INSERT INTO "distritos" VALUES (38,'Santa María del Mar');
INSERT INTO "distritos" VALUES (39,'Santa Rosa');
INSERT INTO "distritos" VALUES (40,'Santiago de Surco');
INSERT INTO "distritos" VALUES (41,'Surquillo');
INSERT INTO "distritos" VALUES (42,'Villa El Salvador');
INSERT INTO "distritos" VALUES (43,'Villa María del Triunfo');
INSERT INTO "direcciones" VALUES (1,'Av. Primavera 123','15001',1);
INSERT INTO "direcciones" VALUES (2,'Jr. Los Olivos 456','15002',2);
INSERT INTO "direcciones" VALUES (3,'Calle Las Flores 789','15003',3);
INSERT INTO "direcciones" VALUES (4,'Av. Angamos 321','15004',4);
INSERT INTO "direcciones" VALUES (5,'Jr. San Martín 654','15005',5);
INSERT INTO "direcciones" VALUES (6,'Calle Los Pinos 987','15006',6);
INSERT INTO "direcciones" VALUES (7,'Av. Chorrillos 159','15007',7);
INSERT INTO "direcciones" VALUES (8,'Jr. Independencia 753','15008',8);
INSERT INTO "direcciones" VALUES (9,'Calle Libertad 951','15009',9);
INSERT INTO "direcciones" VALUES (10,'Av. La Paz 159','15010',10);
INSERT INTO "direcciones" VALUES (11,'Jr. Amazonas 357','15011',11);
INSERT INTO "direcciones" VALUES (12,'Calle Miraflores 753','15012',12);
INSERT INTO "direcciones" VALUES (13,'Av. Primavera 357','15013',13);
INSERT INTO "direcciones" VALUES (14,'Jr. Los Cedros 159','15014',14);
INSERT INTO "direcciones" VALUES (15,'Calle Las Orquídeas 753','15015',15);
INSERT INTO "direcciones" VALUES (16,'Av. San Felipe 951','15016',16);
INSERT INTO "direcciones" VALUES (17,'Jr. Santa Rosa 159','15017',17);
INSERT INTO "direcciones" VALUES (18,'Calle Las Magnolias 753','15018',18);
INSERT INTO "direcciones" VALUES (19,'Av. Industrial 951','15019',19);
INSERT INTO "direcciones" VALUES (20,'Jr. La Unión 159','15020',20);
INSERT INTO "direcciones" VALUES (21,'Calle Los Almendros 753','15021',21);
INSERT INTO "direcciones" VALUES (22,'Av. Los Eucaliptos 951','15022',22);
INSERT INTO "direcciones" VALUES (23,'Jr. Los Sauces 159','15023',23);
INSERT INTO "direcciones" VALUES (24,'Calle Las Lomas 753','15024',24);
INSERT INTO "direcciones" VALUES (25,'Av. Los Nogales 951','15025',25);
INSERT INTO "direcciones" VALUES (26,'Jr. Los Tulipanes 159','15026',26);
INSERT INTO "direcciones" VALUES (27,'Calle Las Violetas 753','15027',27);
INSERT INTO "direcciones" VALUES (28,'Av. Las Palmeras 951','15028',28);
INSERT INTO "direcciones" VALUES (29,'Jr. Las Acacias 159','15029',29);
INSERT INTO "direcciones" VALUES (30,'Calle Las Margaritas 753','15030',30);
INSERT INTO "pagos" VALUES (1,1,1,1,100.5,'Pago realizado con tarjeta de crédito');
INSERT INTO "pagos" VALUES (2,2,2,2,200.75,'Pago realizado mediante transferencia bancaria');
INSERT INTO "pagos" VALUES (3,3,3,3,150.0,'Pago realizado en efectivo');
INSERT INTO "pagos" VALUES (4,4,4,4,250.25,'Pago realizado con tarjeta de débito');
INSERT INTO "pagos" VALUES (5,5,5,5,175.5,'Pago realizado con PayPal');
COMMIT;
