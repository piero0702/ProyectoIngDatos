-- Define un procedimiento llamado actualizarPrecioProductos (o lo reemplaza si ya existe)
CREATE OR REPLACE PROCEDURE actualizarPrecioProductos
IS
BEGIN
  -- Actualiza el precio de los productos donde la descripción comienza con 'Fluye Bottle' a 100
  UPDATE productos
  SET precio = 100
  WHERE descripcion LIKE 'Fluye Bottle%';
  
  -- Confirma los cambios realizados en la transacción
  COMMIT;
  
  -- Imprime un mensaje indicando que se han actualizado los precios
  DBMS_OUTPUT.PUT_LINE('Se ha actualizado el precio de los productos cuya descripción empieza por "Fluye Bottle" a 100.');
EXCEPTION
  -- Captura cualquier excepción que ocurra durante la ejecución del bloque TRY
  WHEN OTHERS THEN
    -- En caso de excepción, deshace los cambios en la transacción
    ROLLBACK;
    -- Imprime un mensaje de error indicando que hubo un problema al intentar actualizar los precios
    DBMS_OUTPUT.PUT_LINE('Error al intentar actualizar el precio de los productos.');
END actualizarPrecioProductos;
/

-- Habilita la salida del servidor para ver los mensajes de DBMS_OUTPUT.PUT_LINE
SET SERVEROUTPUT ON;

-- Ejecuta el procedimiento actualizarPrecioProductos
BEGIN
  actualizarPrecioProductos();
END;
/

-- Selecciona todos los registros de la tabla productos para verificar los cambios
SELECT * FROM productos;
