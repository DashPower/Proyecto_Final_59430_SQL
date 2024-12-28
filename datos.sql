USE dozDB;

-- Insertar registros en la tabla cliente

INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
('Juan', 'Pérez', 'juanproductos_vendidos.perez@example.com', '123456789', 'Calle 1'),
('Ana', 'Gómez', 'ana.gomez@example.com', '987654321', 'Calle 2'),
('Luis', 'Martínez', 'luis.martinez@example.com', '456789123', 'Calle 3'),
('María', 'López', 'maria.lopez@example.com', '321654987', 'Calle 4'),
('Carlos', 'Hernández', 'carlos.hernandez@example.com', '654321789', 'Calle 5');

-- Insertar registros en la tabla producto
INSERT INTO producto (tipo_producto, marca, descripcion, precio) VALUES
('Electrónico', 'Samsung', 'Televisor 55 pulgadas', 500.00),
('Electrónico', 'Apple', 'iPhone 13', 999.99),
('Electrónico', 'Sony', 'PlayStation 5', 499.99),
('Electrónico', 'LG', 'Refrigerador', 800.00),
('Electrónico', 'Dell', 'Laptop XPS 13', 1200.00);


-- Insertar registros en la tabla pago
INSERT INTO pago (monto, tipo_pago, fecha, tasa_cambio) VALUES
(500.00, 'Tarjeta de crédito', '2023-10-01', 1.0),
(999.99, 'Efectivo', '2023-10-02', 1.0),
(499.99, 'Transferencia', '2023-10-03', 1.0),
(800.00, 'Tarjeta de débito', '2023-10-04', 1.0),
(1200.00, 'PayPal', '2023-10-05', 1.0),
(1500.00, 'binance', '2023-10-05', 1.0);

-- Insertar registros en la tabla venta
INSERT INTO venta (id_cliente, id_pago, fecha, total) VALUES
(1,1,'2023-10-01', 500.00),
(2,2,'2023-10-02', 999.99),
(3,3,'2023-10-03', 499.99),
(4,4,'2023-10-04', 800.00),
(5,5,'2023-10-05', 1200.00),
(1,6,'2023-10-05', 1200.00);

-- Insertar registros en la tabla unidad
INSERT INTO unidad (id_producto, sn, capacidad, velocidad, tamaño, color, tipo) VALUES
(4, 'SN001', '500L', 'N/A', 'Grande', 'Negro', 'Refrigerador'),
(4, 'SN012', '500L', 'N/A', 'Grande', 'Negro', 'Refrigerador'),
(2, 'SN002', '128GB', 'N/A', 'Pequeño', 'Blanco', 'Teléfono'),
(3, 'SN003', '1TB', 'N/A', 'Mediano', 'Negro', 'Consola'),
(5, 'SN004', '16GB', '3.1GHz', 'Pequeño', 'Plata', 'Laptop'),
(1, 'SN005', 'N/A', 'N/A', 'Grande', 'Negro', 'Televisor');

-- Insertar registros en la tabla detalle_venta
INSERT INTO detalle_venta (id_venta, id_unidad) VALUES
(1, 1),
(1, 2),
(1, 3),
(4, 4),
(5, 5);

INSERT INTO detalle_venta (id_venta, id_unidad) VALUES
(1, 6)