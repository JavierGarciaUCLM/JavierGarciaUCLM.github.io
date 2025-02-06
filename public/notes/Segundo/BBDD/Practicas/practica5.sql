--Exercise 1
DO 
$$
DECLARE
    v_id NUMERIC(4);
    v_x, v_y, v_z VARCHAR(10);
    v_birthdate DATE NOT NULL;
    v_in_stock BOOLEAN := 1;
    emp_record emp_record_type;
    v_provider proveedor%rowtype;
    v_provider_name proveedor.nombre%TYPE;
BEGIN
END; 
$$ 
LANGUAGE plpgsql;

--Exercise 2
DO $$
DECLARE
    v_customer VARCHAR(50) := 'Womansport';
    v_weight NUMERIC(3) := 600;
    v_message VARCHAR(255) := 'Producto 10012';
BEGIN
    DECLARE
        v_customer NUMERIC(7) := 201;
        v_message VARCHAR(255) := 'Producto 11001';
        v_new_locn VARCHAR(50) := 'Europa';
    BEGIN
        v_weight := v_weight + 1;
        v_new_locn := 'Oeste '|| v_new_locn;
        RAISE NOTICE 'valores de las variables v_weight % v_new_locn % en el
        block interior', v_weight , v_new_locn;
    END;
        v_weight := v_weight + 1;
        v_message := v_message || ' está en stock';
        v_customer := 'Carmen '|| v_customer ;
        v_new_locn := 'Oeste '|| v_new_locn;
END $$;

--Exercise 3
--Do a PL/SQL function with the parameters the price of a product and the VAT value
--to be applied it, and returns the total value of the product = Price*(1+VAT).
--a. To format to the returned value, use: to_char(número, 'FM999D99');
CREATE OR REPLACE FUNCTION ej3(a_precio REAL, iva REAL) 
RETURNS REAL AS 
$$
DECLARE
	v_total REAL;
BEGIN
	v_total:=a_precio*(1+iva);
	RETURN v_total;
END;
$$ 
LANGUAGE plpgsql;

SELECT ej3(100,0.21);

--Exercise 4
--4. Do a PL/SQL function that select the item with highest retail Price (PVP) in the ITEM
--table, assign it to a SQL variable and return it.
CREATE OR REPLACE FUNCTION ej4() 
RETURNS articulo.pvp%type AS 
$$
DECLARE
	v_maxval articulo.pvp%type;
BEGIN
	SELECT INTO v_maxval MAX(pvp) FROM articulo; 
	RETURN v_maxval;
END;
$$ 
LANGUAGE plpgsql;

--Exercise 5
--5. A PL/SQL function must update the address of a specific client in the CLIENT table.
--To do this, the function must have as parameters: the client code (codc) and his new
--address.
CREATE OR REPLACE FUNCTION ej5(c_codc client.codc%type, n_address client.address%type)
RETURNS void AS
$$
BEGIN
    UPDATE client
    
END;
$$ LANGUAGE plpgsql; 