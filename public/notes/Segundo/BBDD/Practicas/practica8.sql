CREATE OR REPLACE FUNCTION ex1_p8 (ciudad_var VARCHAR(15))
RETURNS VARCHAR(70) AS $$
DECLARE
    nombre_var proveedor.nombre%type;
    v VARCHAR(70);
BEGIN
    SELECT nombre INTO STRICT nombre_var FROM proveedor
    WHERE ciudad = ciudad_var;
    V:= CONCAT(nombre_var, ' - ', ciudad_var);
    RETURN v;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v:= CONCAT('No existen proveedores en ', ciudad_var);
            RETURN v;
        WHEN TOO_MANY_ROWS THEN
            V:= CONCAT('Existen varios proveedores en ', ciudad_var);
END;
$$ LANGUAGE plpgsql;

SELECT ex1('inf');




--Probando ejemplos 
CREATE OR REPLACE FUNCTION prueba1 () 
RETURNS void AS $$
DECLARE
    v_nombre ARTICULO.nombre%type;
BEGIN
    SELECT nombre INTO v_nombre
    FROM ARTICULO
    WHERE coda = 'A1000';

    IF NOT FOUND THEN
    INSERT INTO ARTICULO(coda,nombre) VALUES ('A1000', 'ARTICULO MIL');
END IF;
END
$$ LANGUAGE plpgsql;


