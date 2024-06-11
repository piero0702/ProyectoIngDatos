BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar(128),
	PRIMARY KEY("version")
);
CREATE TABLE IF NOT EXISTS "boletas" (
	"id"	INTEGER NOT NULL,
	"nombreYApellidos"	VARCHAR(150) NOT NULL,
	"nroDocumento"	VARCHAR(8) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "facturas" (
	"id"	INTEGER NOT NULL,
	"razonSocial"	VARCHAR(60) NOT NULL,
	"ruc"	VARCHAR(30) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tiposDocumento" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tipos" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(30) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "colores" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(30) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tamanios" (
	"id"	INTEGER NOT NULL,
	"numeroMl"	FLOAT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "disposicionesTexto" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(20) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "fuentesTexto" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(60) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "regalos" (
	"id"	INTEGER NOT NULL,
	"nombresYApellidos"	TEXT NOT NULL,
	"tarjetaRegalo"	VARCHAR(150) NOT NULL,
	"costoAdicional"	FLOAT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cupones" (
	"id"	INTEGER NOT NULL,
	"codigo"	VARCHAR(15) NOT NULL,
	"porcentajeDescuento"	FLOAT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tiposEntrega" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(40) NOT NULL,
	"costo"	FLOAT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tiposDireccion" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "departamentos" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "provincias" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(50) NOT NULL,
	"departamento_id"	INTEGER,
	FOREIGN KEY("departamento_id") REFERENCES "departamentos"("id") ON DELETE CASCADE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "distritos" (
	"id"	INTEGER NOT NULL,
	"nombre"	VARCHAR(50) NOT NULL,
	"provincia_id"	INTEGER,
	FOREIGN KEY("provincia_id") REFERENCES "provincias"("id") ON DELETE CASCADE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "direcciones" (
	"id"	INTEGER NOT NULL,
	"distrito_id"	INTEGER,
	"tipoDireccion_id"	INTEGER,
	FOREIGN KEY("distrito_id") REFERENCES "distritos"("id") ON DELETE CASCADE,
	FOREIGN KEY("tipoDireccion_id") REFERENCES "tiposDireccion"("id") ON DELETE CASCADE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "grabadosLaser" (
	"id"	INTEGER NOT NULL,
	"texto"	VARCHARR(8) NOT NULL,
	"costoAdicional"	FLOAT NOT NULL,
	"disposicionTexto_id"	INTEGER,
	"fuenteTexto_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("disposicionTexto_id") REFERENCES "dispocisionesTexto"("id") ON DELETE CASCADE,
	FOREIGN KEY("fuenteTexto_id") REFERENCES "fuentesTexto"("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "caracteristicas" (
	"id"	INTEGER NOT NULL,
	"tipo_id"	INTEGER,
	"color_id"	INTEGER,
	"tamanio_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("tamanio_id") REFERENCES "tamanios"("id") ON DELETE CASCADE,
	FOREIGN KEY("color_id") REFERENCES "colores"("id") ON DELETE CASCADE,
	FOREIGN KEY("tipo_id") REFERENCES "tipos"("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "productos" (
	"id"	INTEGER NOT NULL,
	"descripcion"	TEXT NOT NULL,
	"cuidados"	TEXT NOT NULL,
	"propiedades"	TEXT NOT NULL,
	"stock"	INTEGER NOT NULL,
	"regalo_id"	INTEGER,
	"grabadoLaser_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("regalo_id") REFERENCES "regalos"("id") ON DELETE CASCADE,
	FOREIGN KEY("grabadoLaser_id") REFERENCES "grabadosLaser"("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "caracteristicas_productos" (
	"id"	INTEGER NOT NULL,
	"imagen"	VARCHAR(100) NOT NULL,
	"precio"	FLOAT NOT NULL,
	"caracteristica_id"	INTEGER,
	"producto_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("caracteristica_id") REFERENCES "caracteristicas"("id") ON DELETE CASCADE,
	FOREIGN KEY("producto_id") REFERENCES "productos"("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "clientes" (
	"id"	INTEGER NOT NULL,
	"nombres"	VARCHAR(50) NOT NULL,
	"apellidos"	VARCHAR(80) NOT NULL,
	"telefono"	VARCHAR(10) NOT NULL,
	"nroDocumento"	VARCHAR(8) NOT NULL,
	"email"	VARCHAR(100) NOT NULL,
	"contrasenia"	VARCHAR(8) NOT NULL,
	"tipoDocumento_id"	INTEGER,
	"direccion_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("direccion_id") REFERENCES "direcciones"("id") ON DELETE CASCADE,
	FOREIGN KEY("tipoDocumento_id") REFERENCES "tiposDocumento"("id") ON DELETE CASCADE
);
INSERT INTO "schema_migrations" VALUES ('20240611153857');
INSERT INTO "schema_migrations" VALUES ('20240611154237');
INSERT INTO "schema_migrations" VALUES ('20240611154352');
INSERT INTO "schema_migrations" VALUES ('20240611154619');
INSERT INTO "schema_migrations" VALUES ('20240611154724');
INSERT INTO "schema_migrations" VALUES ('20240611154825');
INSERT INTO "schema_migrations" VALUES ('20240611154922');
INSERT INTO "schema_migrations" VALUES ('20240611154929');
INSERT INTO "schema_migrations" VALUES ('20240611155031');
INSERT INTO "schema_migrations" VALUES ('20240611155143');
INSERT INTO "schema_migrations" VALUES ('20240611155230');
INSERT INTO "schema_migrations" VALUES ('20240611155307');
INSERT INTO "schema_migrations" VALUES ('20240611155350');
INSERT INTO "schema_migrations" VALUES ('20240611155419');
INSERT INTO "schema_migrations" VALUES ('20240611155658');
INSERT INTO "schema_migrations" VALUES ('20240611155837');
INSERT INTO "schema_migrations" VALUES ('20240611160049');
INSERT INTO "schema_migrations" VALUES ('20240611160527');
INSERT INTO "schema_migrations" VALUES ('20240611160722');
INSERT INTO "schema_migrations" VALUES ('20240611160925');
INSERT INTO "schema_migrations" VALUES ('20240611161104');
INSERT INTO "schema_migrations" VALUES ('20240611161530');
INSERT INTO "schema_migrations" VALUES ('20240611161644');
INSERT INTO "schema_migrations" VALUES ('20240611161750');
COMMIT;
