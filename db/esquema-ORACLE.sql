CREATE TABLE tipos(
	id NUMBER(7) PRIMARY KEY,
	nombres VARCHAR2(50)
);

ALTER TABLE tipos ADD (
  CONSTRAINT tipos_pk PRIMARY KEY (ID));

CREATE SEQUENCE tipos_seq START WITH 1;

CREATE OR REPLACE TRIGGER tipos_pk 
BEFORE INSERT ON tipos 
FOR EACH ROW

BEGIN
  SELECT tipos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE colores(
	id NUMBER(7) PRIMARY KEY,
	nombres VARCHAR2(50)
);

ALTER TABLE colores ADD (
  CONSTRAINT colores_pk PRIMARY KEY (ID));

CREATE SEQUENCE colores_seq START WITH 1;

CREATE OR REPLACE TRIGGER colores_pk 
BEFORE INSERT ON colores 
FOR EACH ROW

BEGIN
  SELECT colores_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE tamanios(
	id NUMBER(7) PRIMARY KEY,
	numeroMl VARCHAR2(120)
);

ALTER TABLE tamanios ADD (
  CONSTRAINT tamanios_pk PRIMARY KEY (ID));

CREATE SEQUENCE tamanios_seq START WITH 1;

CREATE OR REPLACE TRIGGER tamanios_pk 
BEFORE INSERT ON tamanios 
FOR EACH ROW

BEGIN
  SELECT tamanios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE productos(
  id NUMBER(7) PRIMARY KEY,
  descripcion CLOB,
  cuidados CLOB,
  propiedades CLOB,
  stock NUMBER,
  tipo_id NUMBER(7),
  color_id NUMBER(7),
  tamanio_id NUMBER(7),
  imagen CLOB,
  precio FLOAT(10),
  FOREIGN KEY (tipo_id) REFERENCES tipos,
  FOREIGN KEY (color_id) REFERENCES colores,
  FOREIGN KEY (tamanio_id) REFERENCES tamanios
);

ALTER TABLE productos ADD (
  CONSTRAINT productos_pk PRIMARY KEY (ID));

CREATE SEQUENCE productos_seq START WITH 1;

CREATE OR REPLACE TRIGGER productos_pk 
BEFORE INSERT ON productos 
FOR EACH ROW

BEGIN
  SELECT productos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/


INSERT INTO tipos VALUES (1,'Bottles');
INSERT INTO tipos VALUES (2,'Sport');
INSERT INTO tipos VALUES (3,'Cups');
INSERT INTO tipos VALUES (4,'Pet');
INSERT INTO tipos VALUES (5,'Ceramic');
INSERT INTO tipos VALUES (6,'Mug');
INSERT INTO colores VALUES (1,'Manu');
INSERT INTO colores VALUES (2,'White Marble');
INSERT INTO colores VALUES (3,'Lemon');
INSERT INTO colores VALUES (4,'Sky Blue');
INSERT INTO colores VALUES (5,'Amber');
INSERT INTO colores VALUES (6,'Maras');
INSERT INTO colores VALUES (7,'Curitiba');
INSERT INTO colores VALUES (8,'Navy Blue');
INSERT INTO colores VALUES (9,'Terracota');
INSERT INTO colores VALUES (10,'Lima');
INSERT INTO colores VALUES (11,'Bariloche');
INSERT INTO colores VALUES (12,'Máncora');
INSERT INTO colores VALUES (13,'Ombre Blue Light');
INSERT INTO colores VALUES (14,'Ombre Sky');
INSERT INTO colores VALUES (15,'Ombre Lila');
INSERT INTO colores VALUES (16,'Ombre Water');
INSERT INTO colores VALUES (17,'Coral');
INSERT INTO colores VALUES (18,'Baja Sand');
INSERT INTO colores VALUES (19,'Lila');
INSERT INTO colores VALUES (20,'Salinas');
INSERT INTO colores VALUES (21,'Canopi');
INSERT INTO colores VALUES (22,'Aqua');
INSERT INTO colores VALUES (23,'Midnight');
INSERT INTO colores VALUES (24,'Pampilla');
INSERT INTO tamanios VALUES (1,'350');
INSERT INTO tamanios VALUES (2,'360');
INSERT INTO tamanios VALUES (3,'415');
INSERT INTO tamanios VALUES (4,'500');
INSERT INTO tamanios VALUES (5,'590');
INSERT INTO tamanios VALUES (6,'600');
INSERT INTO tamanios VALUES (7,'650');
INSERT INTO tamanios VALUES (8,'700');
INSERT INTO tamanios VALUES (9,'750');
INSERT INTO tamanios VALUES (10,'850');
INSERT INTO tamanios VALUES (11,'950');
INSERT INTO tamanios VALUES (12,'1200');
INSERT INTO productos VALUES (1,'Fluye Bottle 500 ml Manu','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,1,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png',89.0);
INSERT INTO productos VALUES (2,'Fluye Bottle 500 ml White Marble','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,2,4,'https://fluye-statics.s3.amazonaws.com/product_color/Bottle_500_White_Marble_Logo.png',89.0);
INSERT INTO productos VALUES (3,'Fluye Bottle 500 ml Producto Solidario CRM Yellow','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,3,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_Lima_3.png',80.0);
INSERT INTO productos VALUES (4,'Fluye Bottle 500 ml Producto Solidario CRM Blue','Hand wash only. Do not microwave.','Keeps beverages cold for 24 hours and hot for 12 hours. Made from stainless steel.',50,1,4,4,'https://fluye-statics.s3.amazonaws.com/product_color/Cassa_Ronald_Bottle500_SkyBlue_1.png',80.0);
INSERT INTO productos VALUES (5,'Fluye Sport 700 ml Baja Sand','Dishwasher safe. Do not freeze.','Lightweight and durable. Made from BPA-free plastic.',50,2,18,8,'https://fluye-statics.s3.amazonaws.com/product_color/Sport_Baja_Sand_700ml.png',89.0);
INSERT INTO productos VALUES (6,'Fluye Sport 700 ml Lila','Dishwasher safe. Do not freeze.','Lightweight and durable. Made from BPA-free plastic.',50,2,19,8,'https://fluye-statics.s3.amazonaws.com/product_color/Sport_700_Lila_Logo.png',89.0);
INSERT INTO productos VALUES (7,'Fluye Cup Pro 590 ml Manu','Lavar a mano con agua tibia','Aislante térmico',35,3,1,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Manu_Logo.png',89.0);
INSERT INTO productos VALUES (8,'Fluye Cup Pro 590 ml Maras','Lavar a mano con agua tibia','Aislante térmico',45,3,6,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Maras_Logo.png',79.0);
INSERT INTO productos VALUES (9,'Fluye Cup Pro 590 ml Baja Sand','Lavar a mano con agua tibia','Aislante térmico',40,3,18,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Baja_Sand_Logo.png',79.0);
INSERT INTO productos VALUES (10,'Fluye Cup Pro 590 ml Navy Blue','Lavar a mano con agua tibia','Aislante térmico',30,3,8,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Navy_Blue_Logo.png',79.0);
INSERT INTO productos VALUES (11,'Fluye Cup Pro 590 ml Lemon','Lavar a mano con agua tibia','Aislante térmico',20,3,3,5,'https://fluye-statics.s3.amazonaws.com/product_color/Cup_Pro_590_Lemon_Logo.png',79.0);
INSERT INTO productos VALUES (12,'Fluye Ceramic Pro 600 ml Baja Sand','Lavar a mano con agua tibia','Aislante térmico',50,5,18,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Baja_Sand_Logo.png',129.0);
INSERT INTO productos VALUES (13,'Fluye Ceramic Pro 600 ml Bariloche','Lavar a mano con agua tibia','Aislante térmico',45,5,11,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Bariloche_Logo.png',129.0);
INSERT INTO productos VALUES (14,'Fluye Ceramic Pro 600 ml Lila','Lavar a mano con agua tibia','Aislante térmico',35,5,19,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Lila_Logo.png',129.0);
INSERT INTO productos VALUES (15,'Fluye Ceramic Pro 600 ml Navy Blue','Lavar a mano con agua tibia','Aislante térmico',25,5,8,6,'https://fluye-statics.s3.amazonaws.com/product_color/Ceramic_Pro_600_Navy_Blue_Logo.png',129.0);
