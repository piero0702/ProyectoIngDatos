-- Eliminar tablas si ya existen
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE pagos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE pedidos_productos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE pedidos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE productos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE clientes CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE direcciones CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE tipos CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE colores CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE tamanios CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE tiposProducto CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE tiposEntrega CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE cupones CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE tiposDocumento CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE distritos CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignorar errores si las tablas no existen
END;
/

-- Eliminar secuencias si ya existen
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE tipos_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE colores_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE tamanios_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE productos_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE tiposProducto_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE pedidos_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE tiposEntrega_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE cupones_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE clientes_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE tiposDocumento_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE pedidos_productos_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE distritos_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE direcciones_seq';
    EXECUTE IMMEDIATE 'DROP SEQUENCE pagos_seq';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignorar errores si las secuencias no existen
END;
/

-- Crear tablas
CREATE TABLE tipos(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

CREATE TABLE colores(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

CREATE TABLE tamanios(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

CREATE TABLE tiposProducto(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE tiposEntrega(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(40)
);

CREATE TABLE cupones(
    id NUMBER(7) PRIMARY KEY,
    codigo VARCHAR2(15),
    porcentajeDsct FLOAT
);

CREATE TABLE tiposDocumento(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(50)
);

CREATE TABLE distritos(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

CREATE TABLE direcciones(
    id NUMBER(7) PRIMARY KEY,
    direccionEntrega VARCHAR2(60),
    codigoPostal VARCHAR2(10),
    distrito_id NUMBER(7),
    FOREIGN KEY (distrito_id) REFERENCES distritos(id)
);

CREATE TABLE clientes(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50),
    apellidos VARCHAR2(80),
    telefono VARCHAR2(10),
    nroDocumento VARCHAR2(8),
    email VARCHAR2(100),
    contrasenia VARCHAR2(8),
    tipoDocumento_id NUMBER(7),
    direccion_id NUMBER(7),
    FOREIGN KEY (tipoDocumento_id) REFERENCES tiposDocumento(id),
    FOREIGN KEY (direccion_id) REFERENCES direcciones(id)
);

CREATE TABLE productos(
    id NUMBER(7) PRIMARY KEY,
    descripcion CLOB,
    cuidados CLOB,
    propiedades CLOB,
    stock NUMBER,
    tipo_id NUMBER(7),
    color_id NUMBER(7),
    tamano_id NUMBER(7),
    imagen VARCHAR2(100),
    precio FLOAT,
    FOREIGN KEY (tipo_id) REFERENCES tipos(id),
    FOREIGN KEY (color_id) REFERENCES colores(id),
    FOREIGN KEY (tamano_id) REFERENCES tamanios(id)
);

CREATE TABLE pedidos(
    id NUMBER(7) PRIMARY KEY,
    tipoEntrega_id NUMBER(7),
    cupon_id NUMBER(7),
    cliente_id NUMBER(7),
    FOREIGN KEY (tipoEntrega_id) REFERENCES tiposEntrega(id),
    FOREIGN KEY (cupon_id) REFERENCES cupones(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedidos_productos(
    id NUMBER(7) PRIMARY KEY,
    pedido_id NUMBER(7),
    producto_id NUMBER(7),
    tipoProducto_id NUMBER(7),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (tipoProducto_id) REFERENCES tiposProducto(id)
);

CREATE TABLE pagos(
    id NUMBER(7) PRIMARY KEY,
    direccion_id NUMBER(7),
    cliente_id NUMBER(7),
    pedido_id NUMBER(7),
    importeTotal FLOAT,
    observaciones CLOB,
    FOREIGN KEY (direccion_id) REFERENCES direcciones(id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Crear secuencias
CREATE SEQUENCE tipos_seq START WITH 1;
CREATE SEQUENCE colores_seq START WITH 1;
CREATE SEQUENCE tamanios_seq START WITH 1;
CREATE SEQUENCE productos_seq START WITH 1;
CREATE SEQUENCE tiposProducto_seq START WITH 1;
CREATE SEQUENCE pedidos_seq START WITH 1;
CREATE SEQUENCE tiposEntrega_seq START WITH 1;
CREATE SEQUENCE cupones_seq START WITH 1;
CREATE SEQUENCE clientes_seq START WITH 1;
CREATE SEQUENCE tiposDocumento_seq START WITH 1;
CREATE SEQUENCE pedidos_productos_seq START WITH 1;
CREATE SEQUENCE distritos_seq START WITH 1;
CREATE SEQUENCE direcciones_seq START WITH 1;
CREATE SEQUENCE pagos_seq START WITH 1;

-- Crear triggers para autogenerar el ID
CREATE OR REPLACE TRIGGER tipos_pk 
BEFORE INSERT ON tipos 
FOR EACH ROW
BEGIN
  SELECT tipos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER colores_pk 
BEFORE INSERT ON colores 
FOR EACH ROW
BEGIN
  SELECT colores_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER tamanios_pk 
BEFORE INSERT ON tamanios 
FOR EACH ROW
BEGIN
  SELECT tamanios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER productos_pk 
BEFORE INSERT ON productos 
FOR EACH ROW
BEGIN
  SELECT productos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER tiposProducto_pk 
BEFORE INSERT ON tiposProducto 
FOR EACH ROW
BEGIN
  SELECT tiposProducto_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER pedidos_pk 
BEFORE INSERT ON pedidos 
FOR EACH ROW
BEGIN
  SELECT pedidos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER tiposEntrega_pk 
BEFORE INSERT ON tiposEntrega 
FOR EACH ROW
BEGIN
  SELECT tiposEntrega_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER cupones_pk 
BEFORE INSERT ON cupones 
FOR EACH ROW
BEGIN
  SELECT cupones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER clientes_pk 
BEFORE INSERT ON clientes 
FOR EACH ROW
BEGIN
  SELECT clientes_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER tiposDocumento_pk 
BEFORE INSERT ON tiposDocumento 
FOR EACH ROW
BEGIN
  SELECT tiposDocumento_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER pedidos_productos_pk 
BEFORE INSERT ON pedidos_productos 
FOR EACH ROW
BEGIN
  SELECT pedidos_productos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER distritos_pk 
BEFORE INSERT ON distritos 
FOR EACH ROW
BEGIN
  SELECT distritos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER direcciones_pk 
BEFORE INSERT ON direcciones 
FOR EACH ROW
BEGIN
  SELECT direcciones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE OR REPLACE TRIGGER pagos_pk 
BEFORE INSERT ON pagos 
FOR EACH ROW
BEGIN
  SELECT pagos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
