--Practica 6. Ej 1
CREATE TABLE MENSAJE (
    valor VARCHAR(5)
);

CREATE OR REPLACE FUNCTION insert_values()
RETURNS void AS
$$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..10 LOOP
        IF i NOT IN (4,5) THEN
            INSERT INTO MENSAJE (valor) VALUES (i::varchar);
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Ej 2 - sin cursores
CREATE OR REPLACE FUNCTION actualizar_precio(codigo_articulo CHARACTER(8))
RETURNS void AS
$$
DECLARE
    nuevo_precio NUMERIC;
BEGIN
    -- Saco precio actual del articulo que coincida con coda
    SELECT pvp INTO nuevo_precio FROM public.articulo WHERE coda = codigo_articulo;
    -- Miro si precio es null    
    IF nuevo_precio IS NULL THEN
        -- Si es null no hago nada   
        RAISE NOTICE 'El precio del articulo con código % es NULL y no será modificado.', codigo_articulo;
    ELSE
        -- Incremento precio en funcion de rango
        IF nuevo_precio < 300 THEN
            nuevo_precio := nuevo_precio + 25;
        ELSEIF nuevo_precio >= 300 AND nuevo_precio <= 1000 THEN
            nuevo_precio := nuevo_precio + 50;
        ELSE
            nuevo_precio := nuevo_precio + 100;
        END IF;

        -- Actualizo el registro con los nuevos precios
        UPDATE public.articulo
        SET pvp = nuevo_precio
        WHERE coda = codigo_articulo;

        RAISE NOTICE 'Precio actualizado para el articulo con codigo % a €%.', codigo_articulo, nuevo_precio;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Ej 2 - con cursores
CREATE OR REPLACE FUNCTION actualizar_precio_cursor(codigo_articulo CHARACTER(8))
RETURNS void AS
$$
DECLARE
    nuevo_precio NUMERIC;
    articulo_record RECORD; -- Almaceno cada fila aqui
    articulo_cursor CURSOR FOR
        SELECT pvp FROM public.articulo WHERE coda = codigo_articulo;
BEGIN
    OPEN articulo_cursor; -- Abro cursor

    FETCH articulo_cursor INTO articulo_record;
    IF articulo_record IS NULL THEN
        RAISE NOTICE 'No se ha encontrado el articulo con codigo %', codigo_articulo;
    ELSE
        nuevo_precio := articulo_record.pvp;

        IF nuevo_precio IS NULL THEN
            RAISE NOTICE 'El precio del articulo con codigo % es NULL y no sera modificado', codigo_articulo;
        ELSE
            IF nuevo_precio < 300 THEN
                nuevo_precio := nuevo_precio + 25;
            ELSEIF nuevo_precio >= 300 AND nuevo_precio <= 1000 THEN
                nuevo_precio := nuevo_precio + 50;
            ELSE
                nuevo_precio := nuevo_precio + 100;
            END IF;

            UPDATE public.articulo
            SET pvp = nuevo_precio
            WHERE coda = codigo_articulo;

            RAISE NOTICE 'Precio actualizado para el articulo con código % a €%', codigo_articulo, nuevo_precio;
        END IF;
    END IF;
    CLOSE articulo_cursor; -- Cierro cursor
END;
$$ LANGUAGE plpgsql;

-- Ej 3
ALTER TABLE public.articulo
ADD COLUMN asteriscos VARCHAR(20);

CREATE OR REPLACE FUNCTION actualizar_asteriscos(codigo_articulo CHARACTER(8))
RETURNS void AS
$$
DECLARE
    precio NUMERIC;
    cadena_asteriscos VARCHAR;
    articulo_cursor CURSOR FOR SELECT pvp FROM public.articulo WHERE coda = codigo_articulo;
BEGIN
    OPEN articulo_cursor;
    FETCH articulo_cursor INTO precio;

    IF precio IS NOT NULL THEN
        cadena_asteriscos := REPEAT ('*', (precio/200)::INTEGER);
        
        UPDATE public.articulo
        SET asteriscos = cadena_asteriscos
        WHERE coda = codigo_articulo;

        RAISE NOTICE 'Asteriscos actualizados para el articulo con codigo %: %', codigo_articulo, cadena_asteriscos;
    ELSE
        RAISE NOTICE 'No se encontro precio o es NULL para el articulo con codigo %.',codigo_articulo;
    END IF;

    CLOSE articulo_cursor;
END;
$$ LANGUAGE plpgsql;