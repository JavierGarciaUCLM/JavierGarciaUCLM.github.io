CREATE TABLE table1 AS (SELECT * FROM ARTICULO);
CREATE TABLE table2 (LIKE ARTICULO INCLUDING ALL); --including all, no te incluye filas, pero si las restricciones



--Ejercicio 2

CREATE TABLE AUX_ARTICULO (LIKE ARTICULO INCLUDING ALL);

--Ejercicio 3 

CREATE OR REPLACE FUNCTION ex3 (num INTEGER)
RETURNS VOID AS $$
DECLARE
    cur CURSOR FOR SELECT * FROM ARTICULO WHERE PVP IS NOT NULL ORDER BY PVP DESC;
    art_fila ARTICULO%ROWTYPE;
    counter INTEGER := num;
BEGIN
    TRUNCATE AUX_ARTICULO;

    OPEN cur;

    LOOP
        EXIT WHEN counter = 0;
        FETCH cur INTO art_fila;
        EXIT WHEN NOT FOUND;

        INSERT INTO AUX_ARTICULO VALUES (art_fila.*);
        counter := counter - 1;
    END LOOP;

    CLOSE cur;
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 4

CREATE OR REPLACE FUNCION ex4 ()
RETURNS VOID AS $$
DECLARE
    cur CURSOR FOR SELECT
BEGIN
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 4

CREATE TABLE ex4(nombre VARCHAR(20), pais VARCHAR(10));
