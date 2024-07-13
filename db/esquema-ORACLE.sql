-- Crear tabla tipos
CREATE TABLE tipos(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

-- Crear secuencia para la tabla tipos
CREATE SEQUENCE tipos_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla tipos
CREATE OR REPLACE TRIGGER tipos_pk 
BEFORE INSERT ON tipos 
FOR EACH ROW
BEGIN
  SELECT tipos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla colores
CREATE TABLE colores(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

-- Crear secuencia para la tabla colores
CREATE SEQUENCE colores_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla colores
CREATE OR REPLACE TRIGGER colores_pk 
BEFORE INSERT ON colores 
FOR EACH ROW
BEGIN
  SELECT colores_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla tamanios
CREATE TABLE tamanios(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50) -- Cambio realizado aquí
);

-- Crear secuencia para la tabla tamanios
CREATE SEQUENCE tamanios_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla tamanios
CREATE OR REPLACE TRIGGER tamanios_pk 
BEFORE INSERT ON tamanios 
FOR EACH ROW
BEGIN
  SELECT tamanios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla productos
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

-- Crear tabla tiposProducto
CREATE TABLE tiposProducto(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(50)
);

-- Crear secuencia para la tabla tiposProducto
CREATE SEQUENCE tiposProducto_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla tiposProducto
CREATE OR REPLACE TRIGGER tiposProducto_pk 
BEFORE INSERT ON tiposProducto 
FOR EACH ROW
BEGIN
  SELECT tiposProducto_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla pedidos
CREATE TABLE pedidos(
    id NUMBER(7) PRIMARY KEY,
    tipoEntrega_id NUMBER(7),
    cupon_id NUMBER(7),
    cliente_id NUMBER(7),
    FOREIGN KEY (tipoEntrega_id) REFERENCES tiposEntrega(id),
    FOREIGN KEY (cupon_id) REFERENCES cupones(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Crear tabla tiposEntrega
CREATE TABLE tiposEntrega(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(40)
);

-- Crear secuencia para la tabla tiposEntrega
CREATE SEQUENCE tiposEntrega_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla tiposEntrega
CREATE OR REPLACE TRIGGER tiposEntrega_pk 
BEFORE INSERT ON tiposEntrega 
FOR EACH ROW
BEGIN
  SELECT tiposEntrega_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla cupones
CREATE TABLE cupones(
    id NUMBER(7) PRIMARY KEY,
    codigo VARCHAR2(15),
    porcentajeDsct FLOAT
);

-- Crear secuencia para la tabla cupones
CREATE SEQUENCE cupones_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla cupones
CREATE OR REPLACE TRIGGER cupones_pk 
BEFORE INSERT ON cupones 
FOR EACH ROW
BEGIN
  SELECT cupones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla clientes
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

-- Crear tabla tiposDocumento
CREATE TABLE tiposDocumento(
    id NUMBER(7) PRIMARY KEY,
    nombre VARCHAR2(50)
);

-- Crear secuencia para la tabla tiposDocumento
CREATE SEQUENCE tiposDocumento_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla tiposDocumento
CREATE OR REPLACE TRIGGER tiposDocumento_pk 
BEFORE INSERT ON tiposDocumento 
FOR EACH ROW
BEGIN
  SELECT tiposDocumento_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla pedidos_productos
CREATE TABLE pedidos_productos(
    id NUMBER(7) PRIMARY KEY,
    pedido_id NUMBER(7),
    producto_id NUMBER(7),
    tipoProducto_id NUMBER(7),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (tipoProducto_id) REFERENCES tiposProducto(id)
);

-- Crear tabla distritos
CREATE TABLE distritos(
    id NUMBER(7) PRIMARY KEY,
    nombres VARCHAR2(50)
);

-- Crear secuencia para la tabla distritos
CREATE SEQUENCE distritos_seq START WITH 1;

-- Crear trigger para autogenerar el ID en la tabla distritos
CREATE OR REPLACE TRIGGER distritos_pk 
BEFORE INSERT ON distritos 
FOR EACH ROW
BEGIN
  SELECT distritos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- Crear tabla direcciones
CREATE TABLE direcciones(
    id NUMBER(7) PRIMARY KEY,
    direccionEntrega VARCHAR2(60),
    codigoPostal VARCHAR2(10),
    distrito_id NUMBER(7),
    FOREIGN KEY (distrito_id) REFERENCES distritos(id)
);

-- Crear tabla pagos
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
