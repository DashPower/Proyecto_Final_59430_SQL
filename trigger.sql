DELIMITER $$

CREATE TRIGGER actualizar_total_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE total_venta FLOAT(10) DEFAULT 0;

    -- Sumar todos los pagos realizados hasta el momento
    select round(sum(precio), 2) into total_venta
    from venta
        inner join detalle_venta using (id_venta)
        inner join unidad using (id_unidad)
        inner join producto using (id_producto)
    where venta.id_venta = NEW.id_venta;

    -- Actualizar el total pagado en la tabla `venta`
    UPDATE venta
    SET total = total_venta
    WHERE id_venta = NEW.id_venta;
END$$

DELIMITER ;
