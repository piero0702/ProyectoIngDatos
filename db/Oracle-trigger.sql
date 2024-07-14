CREATE OR REPLACE TRIGGER validar_stock
BEFORE INSERT ON pedidos_productos
FOR EACH ROW
DECLARE
    v_stock productos.stock%TYPE;
BEGIN
    SELECT stock INTO v_stock FROM productos WHERE id = :NEW.producto_id;
    IF v_stock < 1 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para el producto.');
    END IF;
END;
/
