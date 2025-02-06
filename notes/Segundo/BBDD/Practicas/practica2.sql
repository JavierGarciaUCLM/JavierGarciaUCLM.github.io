
---------------QUERIES PRACTICA 2--------------
---CONSULTAS-----------------------------------
--1
select * from PROVEEDOR
where pais = 'España'
order by ciudad asc;

--Resultado--
 P1       | 1234567801 | PROVEEDOR UNO    | c/ uno, 1    | 111111110 | Albacete | España
 P15      | 1234567815 | PROVEEDOR QUINCE | c/ quince,15 | 555555551 | Albacete | España
 P9       | 1234567809 | PROVEEDOR NUEVE  | c/ nueve, 9  | 999999990 | Alicante | España
 P12      | 1234567812 | PROVEEDOR DOCE   | c/ doce, 12  | 222222221 | Madrid   | España
--

--2
select * from ARTICULO
where ctd < 1000 AND iva = 6;

--Resultado--
 A2       | ARTICULO DOS   |     | AZUL       | 350.00 |   6
 A3       | ARTICULO TRES  |     | AZUL       | 550.00 |   6
 A7       | ARTICULO SIETE |     | AMARILLO   | 350.00 |   6
 A10      | ARTICULO DIEZ  |     | AZUL       |  30.00 |   6

--3
select p.*
from PROVEEDOR p
left join SUMINISTRO s on p.codp = s.codp
where s.coda IS NULL
order by codp asc;

--Resultado--

   codp   |    dni     |      nombre      |  direccion   |    tlf    |  ciudad   |   pais
----------+------------+------------------+--------------+-----------+-----------+-----------
 P1       | 1234567801 | PROVEEDOR UNO    | c/ uno, 1    | 111111110 | Albacete  | España
 P4       | 1234567804 | PROVEEDOR CUATRO | c/ cuatro, 4 | 444444440 | Budapest  | Hungría
 P7       | 1234567807 | PROVEEDOR SIETE  | c/ siete, 7  | 777777770 | Liverpool | G.Bretaña
 P8       | 1234567808 | PROVEEDOR OCHO   | c/ ocho, 8   | 888888880 | Adelaida  | Australia

--4
update ARTICULO a
set pvp = ( 
    select MAX(puc * pventa)
    from SUMINISTRO s, MONEDAS m, PROVEEDOR p
    where (a.coda = s.coda)
    and (p.codp = s.codp)
    and (p.pais = m.pais)
);


--Resultado--

   coda   |       nombre        |   pvp   |   color    |   ctd   | iva
----------+---------------------+---------+------------+---------+-----
 A1       | ARTICULO UNO        | 1234.00 | VERDE      |  150.00 |  12
 A2       | ARTICULO DOS        |  724.00 | AZUL       |  350.00 |   6
 A3       | ARTICULO TRES       |  222.14 | AZUL       |  550.00 |   6
 A4       | ARTICULO CUATRO     | 1334.00 | BLANCO     | 1000.00 |  12
 A5       | ARTICULO CNCO       |  334.00 | NEGRO      |  500.00 |  12
 A6       | ARTICULO SEIS       |  311.99 | NEGRO      |  550.00 |  12
 A7       | ARTICULO SIETE      |  534.00 | AMARILLO   |  350.00 |   6
 A8       | ARTICULO OCHO       |  134.00 | ROJO       | 3050.00 |  12
 A9       | ARTICULO NUEVE      |         | ROJO       |   50.00 |  12
 A10      | ARTICULO DIEZ       |         | AZUL       |   30.00 |   6
 A11      | ARTICULO ONCE       |         | VERDE      |  150.00 |  12
 A12      | ARTICULO DOCE       | 1000.00 | ROJO       |  700.00 |  12
 A13      | ARTICULO TRECE      |   54.00 | METALICO   | 1350.00 |  12
 A14      | ARTICULO CATORCE    | 1123.00 | BLANCO     | 1100.00 |   6
 A15      | ARTICULO QUINCE     |  934.00 | NEGRO      |  500.00 |  12
 A16      | ARTICULO DIECISEIS  |  764.00 | AMBAR      |   50.00 |  12
 A17      | ARTICULO DIECISIETE |    4.69 | OCRE       | 2350.00 |   6
 A18      | ARTICULO DIECIOCHO  |   43.42 | GRIS       | 3250.00 |  12
 A19      | ARTICULO DIECINUEVE |         | ROJO       | 5000.00 |   6
 A20      | ARTICULO VEINTE     |         | AZUL       |  300.00 |  12

--5

update FACTURA f
set precio = (
    select (f.ctd * a.pvp*(1+a.iva/100))
    from ARTICULO a
    where (a.coda = f.coda)
);

--Resultado--

  nf  | ctd  |   fecha    | precio  |   pagada   |   coda   |   codc
------+------+------------+---------+------------+----------+----------
 1    |   10 | 2009-02-13 |   13821 | 2009-02-13 | A1       | C1
 2    |   21 | 2009-04-12 |   16116 | 2009-04-12 | A2       | C7
 3    |   80 | 2009-04-12 |  110566 |            | A1       | C1
 4    |   23 | 2009-04-12 |    5416 | 2009-05-17 | A3       | C2
 5    |  100 | 2009-04-12 |  138208 |            | A1       | C3
 6    |   21 | 2009-05-21 |   31376 | 2009-05-21 | A4       | C4
 7    |   80 | 2009-05-31 |  119526 |            | A4       | C5
 8    |  623 | 2009-07-21 |  233052 | 2009-07-26 | A5       | C8
 9    | 5000 | 2009-08-10 |  750400 | 2009-08-10 | A8       | C9
 10   | 2100 | 2009-09-12 |  315168 |            | A8       | C9
 11   |  800 | 2009-09-22 |  188375 | 2009-11-24 | A3       | C10
 12   |  230 | 2009-10-07 |         | 2009-10-07 | A10      | C2
 13   |  100 | 2009-11-12 |         | 2009-11-12 | A11      | C11
 14   | 1221 | 2009-11-21 | 1367520 | 2010-08-11 | A12      | C3
 15   |   79 | 2009-12-10 |   88480 |            | A12      | C10
 16   |  523 | 2009-12-11 |         | 2009-12-11 | A9       | C8
 17   | 5330 | 2010-01-10 |  322358 | 2010-01-10 | A13      | C15
 18   | 1450 | 2010-01-22 | 2166416 |            | A4       | C13
 19   |  121 | 2010-02-02 |  180784 |            | A4       | C13
 20   |  446 | 2010-02-02 |   26974 | 2010-04-12 | A13      | C2
 21   | 1100 | 2010-02-14 | 1520288 |            | A1       | C8
 22   |  251 | 2010-02-21 |  142076 | 2010-02-21 | A7       | C12
 23   |  179 | 2010-02-28 |         | 2010-05-28 | A10      | C12
 24   |  223 | 2010-03-10 |  171139 | 2010-03-15 | A2       | C3

--6

select coda, nombre, to_char((pvp*(1+iva/100)),'9G999G999G999G999D99'), color
from ARTICULO a
where (color like 'A%' or color = 'ROJO') and pvp is not null;

--Resultado--

   coda   |       nombre       |        to_char        |   color
----------+--------------------+-----------------------+------------
 A2       | ARTICULO DOS       |                767,44 | AZUL
 A3       | ARTICULO TRES      |                235,47 | AZUL
 A7       | ARTICULO SIETE     |                566,04 | AMARILLO
 A8       | ARTICULO OCHO      |                150,08 | ROJO
 A12      | ARTICULO DOCE      |              1.120,00 | ROJO
 A16      | ARTICULO DIECISEIS |                855,68 | AMBAR

--7

select c.*
from CLIENTE c, FACTURA f
where c.codc = f.codc

where factura.pvp > 2000

--Resultado--

--8



--Resultado--