--Exercise 1

ALTER TABLE proveedor ADD COLUMN CODPJ CHAR(8);

--Unique identifier column  

alter table PROVEEDOR add constraint fk_proveedor_codpj FOREIGN KEY (CODPJ) references proveedor(codp);

--Exercise 2

--iNVESTIGAR LO QUE DICE CARMEN VS LO QUE PIENSO YO
-- podemos usar fk para referenciar cols de una misma tabla? 
-- diferencia de usar with data... vs insertar directamente