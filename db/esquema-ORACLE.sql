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