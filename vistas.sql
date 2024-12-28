CREATE VIEW ventas_por_cliente AS
SELECT 
    c.id_cliente,
    c.nombre,
    c.apellido,
    v.id_venta,
    v.fecha AS fecha_venta,
    v.total AS total_venta,
    p.tipo_pago,
    p.monto AS monto_pago,
    p.fecha AS fecha_pago
FROM 
    cliente c
JOIN 
    venta v ON c.id_cliente = v.id_cliente
JOIN 
    pago p ON v.id_pago = p.id_pago;



CREATE VIEW productos_vendidos AS
SELECT 
    p.id_producto,
    p.tipo_producto,
    p.marca,
    p.descripcion,
    u.sn AS numero_serie,
    u.capacidad,
    u.velocidad,
    u.tamaño,
    u.color,
    u.tipo AS tipo_unidad,
    v.id_venta,
    v.fecha AS fecha_venta,
    v.total AS total_venta
FROM 
    producto p
JOIN 
    unidad u ON p.id_producto = u.id_producto
JOIN 
    detalle_venta dv ON u.id_unidad = dv.id_unidad
JOIN 
    venta v ON dv.id_venta = v.id_venta;
