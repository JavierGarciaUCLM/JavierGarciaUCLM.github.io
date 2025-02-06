--practica1

--creacion de tablas
------Busca en el chat como las creaste, está ahí

--index cosas
--unique
create unique index if not exists icodc on PROVEEDOR (codc);
create unique index if not exists icoda on ARTICULO (coda);
create unique index if not exists idni on CLIENTE (dni);
create unique index if not exists inf on FACTURA (nf);
--not unique
create index if not exists inombre on MONEDAS (nombre);




--Insertamos los valores en las tablas, primero las que son llaves foráneas de otras
insert into MONEDAS (pais, nombre, pccompra, pventa) values
('Alemania','Euro',1,1),
('Argentina','Peso argentino',0.27844,0.27879),
('Australia','Dólar australiano',0.62331,0.62398),
('Dinamarca','Corona danesa',0.13396, 0.1340),
('EE.UU.','Dólar',0.82768,0.82802),
('España','Euro',1,1),
('Francia','Euro',1,1),
('G.Bretaña','Libra',1.46351,1.46505),
('Hungría','Forint',0.003947,0.003964),
('Japón', 'Yen', 0.007248, 0.007551);


insert into PROVEEDOR (codc, dni, nombre, direccion, tlf, ciudad, pais) values
('P1', '1234567801', 'PROVEEDOR UNO',  'c/ uno, 1', '111111110', 'Albacete', 'España'),
('P2', '1234567802', 'PROVEEDOR DOS',   'c/ dos, 2', '222222220', 'Aalborg', 'Dinamarca'),
('P3', '1234567803', 'PROVEEDOR TRES',   'c/ tres, 3', '333333330', 'Perth', 'Australia'),
('P4', '1234567804', 'PROVEEDOR CUATRO',   'c/ cuatro, 4', '444444440', 'Budapest', 'Hungría'),
('P5', '1234567805', 'PROVEEDOR CINCO',   'c/ cinco, 5', '555555550', 'Hiroshima', 'Japón'),
('P6', '1234567806', 'PROVEEDOR SEIS',   'c/ seis, 6', '666666660', 'La Plata', 'Argentina'),
('P7', '1234567807', 'PROVEEDOR SIETE',   'c/ siete, 7', '777777770', 'Liverpool', 'G. Bretaña'),
('P8', '1234567808', 'PROVEEDOR OCHO',   'c/ ocho, 8', '888888880', 'Adelaida', 'Australia'),
('P9', '1234567809', 'PROVEEDOR NUEVE',   'c/ nueve, 9 ', '999999990', 'Alicante', 'España'),
('P10', '1234567810', 'PROVEEDOR DIEZ', 'c/ diez, 10', '000000000', 'Paris', 'Francia'),
('P11', '1234567811', 'PROVEEDOR ONCE', 'c/ once, 11', '111111111', 'Odense', 'Dinamarca'),
('P12', '1234567812', 'PROVEEDOR DOCE', 'c/ doce, 12', '222222221', 'Madrid', 'España'),
('P13', '1234567813', 'PROVEEDOR TRECE', 'c/ trece, 13', '333333331', 'Paris', 'Francia'),
('P14', '1234567814', 'PROVEEDOR CATORCE', 'c/ catorce, 14', '444444441', 'Bonn', 'Alemania'),
('P15', '1234567815', 'PROVEEDOR QUINCE', 'c/ quince,15', '555555551', 'Albacete', 'España');

insert into ARTICULO (coda, nombre, pvp, color, ctd, iva) values
('A1', 'ARTICULO UNO',NULL,'VERDE',150,12),
('A2', 'ARTICULO DOS', NULL, 'AZUL',350, 6),
('A3', 'ARTICULO TRES', NULL, 'AZUL', 550,  6),
('A4', 'ARTICULO CUATRO', NULL, 'BLANCO', 1000,  12),
('A5', 'ARTICULO CNCO', NULL, 'NEGRO', 500,  12),
('A6', 'ARTICULO SEIS', NULL, 'NEGRO', 550,  12),
('A7', 'ARTICULO SIETE', NULL, 'AMARILLO', 350,  6),
('A8', 'ARTICULO OCHO', NULL, 'ROJO', 3050,  12),
('A9', 'ARTICULO NUEVE', NULL, 'ROJO', 50,  12),
('A10', 'ARTICULO DIEZ', NULL, 'AZUL', 30,  6),
('A11', 'ARTICULO ONCE', NULL, 'VERDE', 150,  12),
('A12', 'ARTICULO DOCE', NULL, 'ROJO', 700,  12),
('A13', 'ARTICULO TRECE', NULL, 'METALICO', 1350,  12),
('A14', 'ARTICULO CATORCE', NULL, 'BLANCO', 1100,  6),
('A15', 'ARTICULO QUINCE', NULL, 'NEGRO', 500,  12),
('A16', 'ARTICULO DIECISEIS', NULL, 'AMBAR', 50,  12),
('A17', 'ARTICULO DIECISIETE', NULL, 'OCRE', 2350,  6),
('A18', 'ARTICULO DIECIOCHO', NULL, 'GRIS', 3250,  12),
('A19', 'ARTICULO DIECINUEVE', NULL, 'ROJO', 5000,  6),
('A20', 'ARTICULO VEINTE', NULL, 'AZUL',300,  12);


insert into CLIENTE (codc, dni, nombre, direccion, tlf) values
('C1', '0123456701', 'CLIENTE UNO', 'c/ cuno,1', '999234546'),
('C2', '0123456702', 'CLIENTE DOS', 'c/ cdos, 2', '999343434'),
('C3', '0123456703', 'CLIENTE TRES', 'c/ ctres, 3', '666123455'),
('C4', '0123456704', 'CLIENTE CUATRO', 'c/ ccuatro, 4', '666445566'),
('C5', '0123456705', 'CLIENTE CINCO', 'c/ ccinco,5', '777553434'),
('C6', '0123456706', 'CLIENTE SEIS', 'c/ cseis, 6', '777664567'),
('C7', '0123456707', 'CLIENTE SIETE', 'c/ csiete, 7', '444773457'),
('C8', '0123456708', 'CLIENTE OCHO', 'c/ cocho, 8', '444887865'),
('C9', '0123456709', 'CLIENTE NUEVE', 'c/ cnueve, 9', '998776'),
('C10', '0123456710', 'CLIENTE DIEZ', 'c/ cdiez, 10', '101010'),
('C11', '0123456711', 'CLIENTE ONCE', 'c/ conce, 11', '111122'),
('C12', '0123456712', 'CLIENTE DOCE', 'c/ cdoce, 12', '123432'),
('C13', '0123456713', 'CLIENTE TRECE', 'c/ ctrece, 13', '131323'),
('C14', '0123456714', 'CLIENTE CATORCE', 'c/ ccatorce, 14', '143442'),
('C15', '0123456715', 'CLIENTE QUINCE', 'c/ cquince,15', '152345');


insert into FACTURA (nf, ctd, fecha, precio, pagada, coda, codc) values
('1', 10, '13/02/2009', 350, '13/02/2009', 'A1', 'C1'),
('2', 21, '12/04/2009', 550, '12/04/2009', 'A2', 'C7'),
('3', 80, '12/04/2009', 1000, NULL, 'A1', 'C1'),
('4', 23, '12/04/2009', 550, '17/05/2009', 'A3', 'C2'),
('5', 100, '2009-04-12', 446, NULL, 'A1', 'C3'),
('6', 21, '2009-05-21', 1150, '2009-05-21', 'A4', 'C4'),
('7', 80, '2009-05-31', 1040, NULL, 'A4', 'C5'),
('8', 623, '2009-07-21', 460, '2009-07-26', 'A5', 'C8'),
('9', 5000, '2009-08-10', 1350, '2009-08-10', 'A8', 'C9'),
('10', 2100, '2009-09-12', 1550, NULL, 'A8', 'C9'),
('11', 800, '2009-09-22', 1000, '2009-11-24', 'A3', 'C10'),
('12', 230, '2009-10-07', 234, '2009-10-07', 'A10', 'C2'),
('13', 100, '2009-11-12', 129, '2009-11-12', 'A11', 'C11'),
('14', 1221, '2009-11-21', 1350, '2010-08-11', 'A12', 'C3'),
('15', 79, '2009-12-10', 40, NULL, 'A12', 'C10'),
('16', 523, '2009-12-11', 3478, '2009-12-11', 'A9', 'C8'),
('17', 5330, '2010-01-10', 350, '2010-01-10', 'A13', 'C15'),
('18', 1450, '2010-01-22', 323, NULL, 'A4', 'C13'),
('19', 121, '2010-02-02', 1123, NULL, 'A4', 'C13'),
('20', 446, '2010-02-02', 234, '2010-04-12', 'A13', 'C2'),
('21', 1100, '2010-02-14', 1129, NULL, 'A1', 'C8'),
('22', 251, '2010-02-21', 150, '2010-02-21', 'A7', 'C12'),
('23', 179, '2010-02-28', 400, '2010-05-28', 'A10', 'C12'),
('24', 223, '2010-03-10', 2178, '2010-03-15', 'A2', 'C3');

insert into SUMINISTRO (codp, coda, puc)  values
('P13', 'A1', 1234),
('P13', 'A4', 234),
('P13', 'A15', 934),
('P14', 'A2', 724),
('P14', 'A3', 134),
('P14', 'A16', 764),
('P15', 'A5', 334),
('P15', 'A6', 224),
('P15', 'A14', 1123),
('P9', 'A7', 534),
('P9', 'A8', 134),
('P9', 'A13', 54),
('P10', 'A12', 434),
('P10', 'A16', 674),
('P10', 'A4', 1334),
('P11', 'A18', 324),
('P11', 'A17', 35),
('P11', 'A1', 456),
('P11', 'A3', 754),
('P2', 'A2', 95),
('P2', 'A14', 134),
('P3', 'A5', 174),
('P3', 'A12', 1000),
('P3', 'A3', 356),
('P12', 'A2', 77),
('P12', 'A7', 336),
('P5', 'A12', 454),
('P5', 'A16', 1195),
('P5', 'A4', 634),
('P6', 'A1', 374),
('P13', 'A12', 1000),
('P3', 'A6', 500);
