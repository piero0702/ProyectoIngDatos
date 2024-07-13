CREATE OR REPLACE FUNCTION funcion(
    p_prefijo IN VARCHAR2
) RETURN NUMBER IS
    v_contador NUMBER := 0;
BEGIN
    -- Declaración de v_contador como un número inicializado a 0
    SELECT COUNT(*)
    INTO v_contador
    FROM productos
    WHERE descripcion LIKE p_prefijo || '%';
    -- Realiza un conteo de registros en la tabla productos donde la descripción
    -- empieza con el prefijo dado por el parámetro p_prefijo

    RETURN v_contador;  -- Retorna el valor del contador
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;  -- Maneja la excepción NO_DATA_FOUND retornando 0
END funcion;
/


SET SERVEROUTPUT ON;

DECLARE
    v_cantidad NUMBER;
    v_nombre VARCHAR2(30):= 'Fluye Bottle';
BEGIN
    v_cantidad := funcion(v_nombre);
    -- Llama a la función `funcion` pasando `v_nombre` como argumento y asigna el resultado a `v_cantidad`

    DBMS_OUTPUT.PUT_LINE('Cantidad de productos con descripción que empieza por ' || v_nombre || ' : ' || v_cantidad);
    -- Imprime en la consola el mensaje que indica la cantidad de productos encontrados
END;
/
