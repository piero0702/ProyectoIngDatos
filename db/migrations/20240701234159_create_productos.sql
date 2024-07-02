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
