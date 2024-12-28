DROP DATABASE IF EXISTS dozDB;
CREATE DATABASE dozDB; 
USE dozDB;

-- CREACION DE TABLAS
CREATE TABLE cliente(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(200) UNIQUE,
    telefono VARCHAR(100),
    direccion VARCHAR(100)
);

CREATE TABLE venta(
    id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_pago INT,
    fecha DATE,
    total FLOAT(10)
);

CREATE TABLE pago(
    id_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    monto FLOAT(10),  
    tipo_pago VARCHAR(200),
    fecha DATE,
    tasa_cambio FLOAT(10)
);

CREATE TABLE producto(
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_producto VARCHAR(200),
    marca VARCHAR(200),
    descripcion VARCHAR(200),
    precio FLOAT(10)
);

CREATE TABLE unidad(
    id_unidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    sn VARCHAR(200),
    capacidad VARCHAR(200),
    velocidad VARCHAR(200),
    tamaño VARCHAR(200),
    color VARCHAR(200),
    tipo VARCHAR(200)
);

CREATE TABLE detalle_venta(
    id_detalle_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_unidad INT
);

-- CLAVES FORANEAS

ALTER TABLE venta
    ADD CONSTRAINT fk_constraint_id_cliente  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    ADD CONSTRAINT fk_constraint_id_pago FOREIGN KEY (id_pago) REFERENCES pago(id_pago);
    
ALTER TABLE detalle_venta
    ADD CONSTRAINT fk_constraint_id_venta_detalle FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    ADD CONSTRAINT fk_constraint_id_unidad FOREIGN KEY (id_unidad) REFERENCES unidad(id_unidad);

ALTER TABLE unidad
    ADD CONSTRAINT fk_constraint_id_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

