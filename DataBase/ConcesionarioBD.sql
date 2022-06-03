--BASE DATOS CONCESIONARIOS DE VEHICULOS

Create database Concensionario_BD

Go
Use Concensionario_BD
Go


 Create Table Facturacion(
	ID int primary key identity not null,
	Nombre_Cliente varchar,
	Apellido_Cliente varchar,
	ID_Placa int, --Para vehiculos vendidos
	Telefono int,
	Fecha datetime,
	Detalle varchar, --venta de vehiculo o mantenimiento
	Costo money,
);
Insert into Facturacion values 
 ('Jose Ernesto','Rivera Rivera','001','76812345','14/122020','Cambio de Aceite','10.59'),
 ('Juan David','Hercules Rivera','002','78746565','1/52020','Cambio de bijias','10.59'),
 ('Andre Edwin','Zoto Hernandez','003','87521416','5/8/2020','Cambio de bateria','10.59'),
 ('Jose Ernesto','Rivera Rivera','004','32157487','1/6/2020','Cambio de radiador','10.59'),
 ('Edwin Saul','Rivaz Herrera','005','79846132','9/2/2020','Cambio de llantas','10.59')

Create Table Mantenimiento(
	Placa_ID int primary key identity not null,
	Nombres_Cliente varchar(255),
	Apellidos_Cliente varchar(255),
	Fecha datetime,
	Descripcion varchar,--Mantenimiento, reparacion
	Costo  money ,
	CONSTRAINT fk_Facturacion FOREIGN KEY (Placa_ID) REFERENCES Facturacion (ID),
);
Insert into Mantenimiento values 
 ('001','Jose Ernesto','Rivera Rivera','14/122020','Cambio de Aceite','10.59'),
 ('002','Juan David','Hercules Rivera','1/52020','Cambio de bijias','10.59'),
 ('003','Andre Edwin','Zoto Hernandez','5/8/2020','Cambio de bateria','10.59'),
 ('004','Jose Ernesto','Rivera Rivera','1/6/2020','Cambio de radiador','10.59'),
 ('005','Edwin Saul','Rivaz Herrera','9/2/2020','Cambio de llantas','10.59')


Create Table Inventario(
	ID_Placa int primary key identity not null,
	Marca varchar ,
	Modelo varchar,
	Año datetime,
	Color varchar,
	Estado varchar,--Nuevo o usado
	CONSTRAINT fk_Facturacion1 FOREIGN KEY (ID_Placa) REFERENCES Facturacion (ID),
);

Insert into Inventario values 
('Toyota','Sedan','1/1/2020','Azul','Nuevo'),
 ('Nissan','Sedan','1/2/2018','Rojo','Nuevo'),
 ('Mazda','Sedan','1/5/2015','Blanco','Nuevo'),
 ('Toyota','Pickup','1/10/2019','Verde','Nuevo'),
 ('Hyundai','Hatchback','1/5/1999','Morado','Usado')

Create Table Clientes(
	ID  int primary key identity not null,
    ID_Placa int,
	Placa_ID int,
	Nombres varchar(255),
	Apellidos varchar(255),
	Telefono int,
	DUI int,
	Direccion varchar(255),
	CONSTRAINT fk_Inventario FOREIGN KEY (ID_Placa) REFERENCES Inventario (ID_Placa),
	CONSTRAINT fk_Mantenimiento FOREIGN KEY (Placa_ID) REFERENCES Mantenimiento (Placa_ID)

);
Insert into Clientes values
('001','000','Jose Ernesto','Rivera Rivera','76812345','4567788909','La vega Chalatenango'),
 ('002','000','Juan David','Hercules Rivera','78746565','4521587759','El centro San Salvador'),
 ('003','000','Andre Edwin','Zoto Hernandez','87521416','5459546489','La vega Chalatenango'),
 ('000','001','Jose Ernesto','Rivera Rivera','32157487','7895268759','La vega Chalatenango'),
 ('000','002','Edwin Saul','Rivaz Herrera','79846132','1349898869','La vega Chalatenango')

go