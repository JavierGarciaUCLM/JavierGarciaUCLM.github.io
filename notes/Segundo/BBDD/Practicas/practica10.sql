--Triggers
--Ejemplo estructura
CREATE TRIGGER nombre_disparador
    { BEFORE | AFTER | INSTEAD OF} -- MODO
    { INSERT | UPDATE | DELETE | TRUNCATE } -- EVENTO
ON nombre_tabla
    { FOR EACH { ROW | STATEMENT } } -- NIVEL
    { WHEN condicio_disparo } -- CONDICION 
EXECUTE PROCEDURE nombre_funcion_disparador();

--Ejemplo1
CREATE OR REPLACE FUNCTION log_error()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    RAISE NOTICE 'Ha ocurrido un error.';
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--Ejemplo2
CREATE TRIGGER hay_insercion
AFTER INSERT ON departamentos -- MODO + ACCION que dispara trigger
FOR EACH ROW -- NIVEL
WHEN (NEW.nombre LIKE 'E%') -- CONDICION
EXECUTE PROCEDURE log_error(); -- ACCION a realizar (manejo)

--Ejemplo3
INSERT INTO departamentos VALUES ( -- EJEMPLO QUE DISPARARÍA
    'id997',
    'El 997'
);

--Ejemplo4
CREATE OR REPLACE FUNCION mayusculas() 
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    NEW.nombre := upper (NEW.nombre);
        RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Ejemplo5
CREATE TRIGGER poner_en_mayusculas
BEFORE INSERT ON departamentos
FOR EACH ROW
EXECUTE PROCEDURE mayusculas();

--Ejemplo6
INSERT INTO departamentos VALUES ( -- EJEMPLO QUE DISPARARÍA
    'id997',
    'ponme en mayusculas'
);

--Ejemplo7

CREATE TRIGGER poner_en_mayusculas_2
BEFORE INSERT OR UPDATE ON departamentos
FOR EACH ROW
EXECUTE PROCEDURE mayusculas();

--Borrar disparador
DROP TRIGGER [IF EXISTS] nombre_disparador ON nombre_taba [CASCADE | RESTRICT];
DROP TRIGGER IF EXISTS poner_en_mayusculas ON departamentos;


/*
EJERCICIOS PRACTICA 10
*/

/*1. Crea un disparador que garantice que el precio de venta al público (PVP) de un artículo
cuando se vaya a modificar sea siempre mayor o igual que el precio al que se compró
(considerando este como el precio más alto entre todos los proveedores que lo
suministran; ver el ejercicio 4 de la práctica 2). Si no se cumple esta condición el
disparador debe provocar que el sistema retorne un error (EXCEPTION).*/

CREATE TRIGGER pvp_mayor_igual
BEFORE UPDATE ON articulo
FOR EACH ROW
WHEN
    (NEW.pvp < OLD.pvp)
EXECUTE PROCEDURE return_log_error_EXC();

CREATE OR REPLACE FUNCTION return_log_error_EXC()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    RAISE NOTICE '(EXCEPTION)';
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

UPDATE articulo SET pvp = 90 WHERE coda = 'A2';

/*2. Crea un disparador que mantenga la tabla MOROSO que, con la misma estructura de
la tabla CLIENTE más la columna NF (número de la factura con más de 90 días sin
pagar) con el mismo tipo que dicho campo en la tabla FACTURA, contiene aquellos
clientes con facturas con más de 90 días sin pagar. El disparador debe actualizar la tabla
cada vez que se actualice una factura como pagada o se inserte una factura, añadiendo
los nuevos morosos y eliminando los que ya no lo son.
*/

/*3. Utilizando disparadores y secuencias, crea un sistema que permita que la clave NF de
la tabla FACTURA se genere automáticamente cada vez que se inserte una nueva
factura. Para que no existan problemas con los datos actuales de las facturas inicia la
secuencia en un número superior al NF máximo actual.*/