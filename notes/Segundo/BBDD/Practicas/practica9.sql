--estructura base funcion-procedimiento

CREATE [OR REPLACE] FUNCTION nombre_funcion
([[IN|OUT|INOUT] [nombre_arg] tipo_arg [{DEFAULT| =} default_expr ] [, ...]])
[ RETURNS tipo_devuelto ] AS $$
[DECLARE]
 -- Declaración de variables.
BEGIN
NULL; -- Cuerpo de la función.
[EXCEPTION]
 -- Gestión de excepciones.
END;
$$ LANGUAGE plpgsql; -- hay que especificar el lenguaje en que está escrito
aquí.

--ejemplo1 devuelve cuantos departamentos hay


CREATE OR REPLACE FUNCTION contar() RETURNS Integer AS $$
DECLARE
    v_ctd numeric;
BEGIN
    SELECT COUNT(*) INTO v_ctd
    FROM departamentos;

    RETURN v_ctd;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'No se puede acceder a la tabla de departamentos.';
END;
$$ LANGUAGE plpgsql;

--ejemplo2 procedimiento

CREATE OR REPLACE FUNCTION contar() RETURNS void AS $$
DECLARE
    v_ctd numeric;
BEGIN
    SELECT COUNT(*) INTO v_ctd
    FROM departamentos;

    RAISE NOTICE 'Número de departamentos: %', v_ctd;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'No se puede acceder a la tabla departamentos.';
END;
$$ LANGUAGE plpgsql;

--ejemplo3 invocar_funcion

SELECT * FROM contar();


--ejemplo4 invocar_funcion desde bloque plpgsql
<<ej_funciones>>
DECLARE
    v_ctd Integer;
BEGIN
    v_ctd:=contar(); -- Invocar la funcion

    RAISE NOTICE 'Número de departamentos: %', v_ctd;
END ej_funciones $$;

--ejemplo5 modo de argumento_out
CREATE OR REPLACE FUNCTION contar_out (salida OUT Integer) AS $$
    DECLARE
        v_ctd numeric;
    BEGIN
        SELECT COUNT(*) INTO v_ctd
            FROM departamentos;
        
        RAISE NOTICE 'Número de departamentos: %', v_ctd;
        salida := v_ctd;

        EXCEPTION
            WHEN OTHERS THEN
                RAISE NOTICE 'No se puede acceder a la tabla departamentos.';
    END;
$$ LANGUAGE plpgsql;



--A partir de aqui es la practica en si

--1. Crea una funcion que inserte un nuevo articulo, pasado como parametro, en la tabla
--ARTICULO.

-- como pasar un registro como un parametro a una funcion
CREATE TABLE IF NOT EXISTS aux_articulo(like articulo including all);
CREATE OR REPLACE FUNCTION pract9_passrecord(pmen aux_articulo) RETURNS VOID AS $$
DECLARE
    text_msg text;
    text_detail text;
    text_hint text;
BEGIN
    RAISE NOTICE 'aaa%', pmen;
    INSERT INTO aux_articulo SELECT pmen.*; --como insertar una variable registro en una tabla.
    --INSERT INTO aux_articulo VALUES (pmen.*); --alternative.
EXCEPTION
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_msg = MESSAGE_TEXT,
            text_detail = PG_EXCEPTION_DETAIL,
            text_hint = PG_EXCEPTION_HINT;
        RAISE NOTICE '% - % : %', sqlstate, sqlerrm, text_hint;
END;
$$ LANGUAGE plpgsql;
SELECT pract9_passrecord(('A200', 'mio', 12.50, 'rojo', 3.4));
SELECT pract9_passrecord('(A202, mio, 12.50, rojo, 3.4)');
SELECT * FROM aux_articulo;

--como pasar un registro de otra tabla
DO $$
DECLARE
    myrec ARTICULO%ROWTYPE;
BEGIN
    SELECT * INTO myrec FROM ARTICULO WHERE coda='A1';
    PERFORM pract9_passrecord(myrec);
    SELECT * INTO myrec FROM ARTICULO WHERE coda='A2';
    PERFORM pract9_passrecord(myrec.*);
END $$;
SELECT * FROM aux_articulo;


CREATE OR REPLACE FUNCTION insertarArti (art articulo)
RETURNS void AS $$
BEGIN
    INSERT INTO ARTICULO SELECT art.*;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'MALA MIA: %', sqlerrm;
END;
$$ LANGUAGE plpgsql;


--2 Crea una funcion que permita modificar el nombre de un articulo, pasado como
--parametro, pasando también el codigo del articulo. Incluye el control de errores con
--las excepciones oportunas.

CREATE OR REPLACE FUNCTION modificar_nombre(nombreA articulo.nombre%TYPE, cod articulo.coda%TYPE) RETURNS VOID AS $$
BEGIN
    UPDATE articulo 
    SET nombre = nombreA 
    WHERE coda = cod;

    IF cod NOT IN (SELECT coda FROM ARTICULO)
    THEN
    RAISE EXCEPTION USING errcode='ARTNE';
    ELSE IF coda IS NULL THEN
    RAISE EXCEPTION USING errcode='ARTCEN';
    END IF;

EXCEPTION
    WHEN SQLSTATE 'ARTNE' THEN
    RAISE NOTICE 'NO se ha actualizado, no encontrado el codigo.';

    WHEN SQLSTATE 'ARTCEN' THEN
    RAISE NOTICE 'NO se ha actualizado, codigo nulo.';

    WHEN OTHERS THEN
    RAISE NOTICE 'ERROR: %', sqlerrm;
END;
$$ LANGUAGE plpgsql;    


--3 Obten una funcion para consultar la tabla de ARTICULO y devuelva el nombre y PVP
--para un codigo de articulo dado. Proporciona el control de errores adecuado.
CREATE OR REPLACE FUNCTION dame_PVP_art(cod ARTICULO.coda%TYPE, OUT nom ARTICULO.nombre%TYPE, precio_venta_pub ARTICULO.pvp%TYPE) AS
$$
BEGIN
    SELECT nombre,pvp INTO STRICT nom,precio_venta_pub FROM ARTICULO WHERE coda = cod;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
    RAISE NOTICE 'Ese codigo no es valido.';
    
    WHEN OTHERS THEN
    RAISE NOTICE 'ERROR: %', sqlerrm;
END;
$$ LANGUAGE plpgsql;

SELECT dame_PVP_art('A1');

--4