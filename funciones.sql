DELIMITER $$

CREATE FUNCTION calcular_total_ventas_producto(id_producto INT, fecha_inicio DATE, fecha_fin DATE) 
RETURNS FLOAT(10)
DETERMINISTIC
BEGIN
    DECLARE total_producto FLOAT(10);
    
    SELECT count(*) INTO total_producto FROM venta
        JOIN detalle_venta USING (id_venta)
        JOIN unidad USING (id_unidad)
        JOIN producto USING (id_producto)
    WHERE producto.id_producto = id_producto;
    -- Devolver el total
    RETURN total_producto;
END$$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION calcular_total_ventas_cliente(id_cliente INT, fecha_inicio DATE, fecha_fin DATE) 
RETURNS FLOAT(10)
DETERMINISTIC
BEGIN
    DECLARE total_cliente FLOAT(10);
    
    -- Calcular el total de ventas del cliente dentro del rango de fechas
    SELECT count(*) INTO total_cliente
    FROM venta v
    WHERE v.id_cliente = id_cliente
    AND v.fecha BETWEEN fecha_inicio AND fecha_fin;
    
    -- Devolver el total
    RETURN total_cliente;
END$$

DELIMITER ;
