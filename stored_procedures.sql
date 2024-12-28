DELIMITER $$

CREATE PROCEDURE ventas_por_cliente(
    IN id_cliente INT
)
BEGIN
    SELECT 
        v.id_venta,
        v.fecha AS fecha_venta,
        v.total AS total_venta,
        p.tipo_pago,
        p.monto AS monto_pago,
        p.fecha AS fecha_pago
    FROM 
        venta v
    JOIN 
        pago p ON v.id_pago = p.id_pago
    WHERE 
        v.id_cliente = id_cliente;
END$$

DELIMITER ;
