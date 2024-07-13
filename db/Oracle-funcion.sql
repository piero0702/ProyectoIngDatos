CREATE OR REPLACE FUNCTION funcion(
    p_prefijo IN VARCHAR2
) RETURN NUMBER IS
    v_contador NUMBER := 0;
BEGIN
    -- Declaraci�n de v_contador como un n�mero inicializado a 0
    SELECT COUNT(*)
    INTO v_contador
    FROM productos
    WHERE descripcion LIKE p_prefijo || '%';
    -- Realiza un conteo de registros en la tabla productos donde la descripci�n
    -- empieza con el prefijo dado por el par�metro p_prefijo

    RETURN v_contador;  -- Retorna el valor del contador
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;  -- Maneja la excepci�n NO_DATA_FOUND retornando 0
END funcion;
/


SET SERVEROUTPUT ON;

DECLARE
    v_cantidad NUMBER;
    v_nombre VARCHAR2(30):= 'Fluye Bottle';
BEGIN
    v_cantidad := funcion(v_nombre);
    -- Llama a la funci�n `funcion` pasando `v_nombre` como argumento y asigna el resultado a `v_cantidad`

    DBMS_OUTPUT.PUT_LINE('Cantidad de productos con descripci�n que empieza por ' || v_nombre || ' : ' || v_cantidad);
    -- Imprime en la consola el mensaje que indica la cantidad de productos encontrados
END;
/
