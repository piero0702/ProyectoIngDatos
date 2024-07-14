CREATE OR REPLACE TRIGGER validar_y_actualizar_stock
BEFORE INSERT ON pedidos_productos
FOR EACH ROW
DECLARE
    v_stock productos.stock%TYPE;
BEGIN
    SELECT stock INTO v_stock FROM productos WHERE id = :NEW.producto_id;
    IF v_stock < 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para el producto.');
    ELSE
        UPDATE productos
        SET stock = stock - 1
        WHERE id = :NEW.producto_id;
    END IF;
END;
/

INSERT INTO pedidos_productos (pedido_id, producto_id, tipoProducto_id) VALUES (1, 3, 1);


SELECT * FROM productos
    