USE master
GO

IF DB_ID (N'Cafeteria') IS NOT NULL
DROP DATABASE Cafeteria
GO

CREATE DATABASE Cafeteria
ON
( NAME = Cafeteria_dat,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cafeteria.mdf',
	SIZE = 100,
	MAXSIZE = 500,
	FILEGROWTH = 500 )
LOG ON 
( NAME = Cafeteria_log,
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Cafeteria.ldf',
	SIZE = 100MB,
	MAXSIZE = 500MB,
	FILEGROWTH = 500MB ) ;
GO

----------------------- TABLAS
USE Cafeteria
GO

CREATE TABLE Almacen(
    idAlmacen int IDENTITY,
    numero varchar (10) not null,
    capacidad int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKAlmacen PRIMARY KEY(idAlmacen)
)

CREATE TABLE Asentamiento(
    idAsentamiento int IDENTITY, 
    id int,
    nombre varchar (100) not null,
    codigoPostal char (5) not null,
    idTipoAsentamiento int not null,
    idMunicipio int not null,
    idEstado int not null,
    idZona int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKAsentamiento PRIMARY KEY(idAsentamiento)
)


CREATE TABLE Asistencia(
    idAsistencia int IDENTITY,
    fecha date not null, 
    horaLlegada time not null,
    horaSalida time not null,
    idTrabajador int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKAsistencia PRIMARY KEY(idAsistencia)
)

CREATE TABLE Cliente(
    idCliente int IDENTITY,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoCliente int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKCliente PRIMARY KEY(idCliente)
)

CREATE TABLE Compra(
    idCompra int IDENTITY,
    referencia varchar (50) not null,
    fecha datetime not null,
    precio decimal (10,2) not null,
    idProveedor int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKCompra PRIMARY KEY(idCompra)
)

CREATE TABLE CorteVenta(
    idCorteVenta int IDENTITY,
    caja varchar (50) not null,
    fecha datetime not null,
    venta decimal (10,2) not null,
    gasto decimal (10,2) not null,
    tarjeta decimal (10,2) not null,
    idTrabajador int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKCorteVenta PRIMARY KEY(idCorteVenta)
)

CREATE TABLE Descuento(
    idDescuento int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    porcentaje int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKDescuento PRIMARY KEY(idDescuento)
)

CREATE TABLE DevolucionCompra(
    idDevolucionCompra int IDENTITY,
    platillo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int not null,
    costo decimal (10,2) not null,
    idCompra int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKDevolucionCompra PRIMARY KEY(idDevolucionCompra)
)

CREATE TABLE DevolucionVenta(
    idDevolucionVenta int IDENTITY,
    platillo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int not null,
    costo decimal (10,2) not null,
    idVenta int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKDevolucionVenta PRIMARY KEY(idDevolucionVenta)
)

CREATE TABLE Estado
(
    idEstado int UNIQUE,
    nombre varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKEstado PRIMARY KEY(idEstado)
)

CREATE TABLE Material(
    idMaterial int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    precio decimal (10,2) not null,
    cantidad int not null,
    idCompra int not null,
    idAlmacen int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKMaterial PRIMARY KEY(idMaterial)   
)

CREATE TABLE Municipio(
    idMunicipio int IDENTITY,
    nombre varchar (50) not null,
    codigo int not null,
    idEstado int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKMunicipio PRIMARY KEY(idMunicipio) 
)

CREATE TABLE Platillo (
    idPlatillo int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (100) not null,
    costo decimal (10,2) not null,
    idTipoPlatillo int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKPlatillo PRIMARY KEY(idPlatillo) 
)

CREATE TABLE Proveedor(
    idProveedor int IDENTITY,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoProveedor int not null,
    idAsentamiento int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKProveedor PRIMARY KEY(idProveedor)
)

CREATE TABLE Puesto(
    idPuesto int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKPuesto PRIMARY KEY(idPuesto) 
)

CREATE TABLE Sucursal(
    idSucursal int IDENTITY,
    nombre varchar (50) not null,
    telefono char (10) not null,
    calle varchar (50) not null,
    idAsentamiento int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKSucursal PRIMARY KEY(idSucursal) 
)

CREATE TABLE TipoAsentamiento(
    idTipoAsentamiento int UNIQUE,
    nombre varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKTipoAsentamiento PRIMARY KEY(idTipoAsentamiento) 
)

CREATE TABLE TipoCliente(
    idTipoCliente int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKTipoCliente PRIMARY KEY(idTipoCliente) 
)

CREATE TABLE TipoPlatillo(
    idTipoPlatillo int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKTipoPlatillo PRIMARY KEY(idTipoPlatillo) 
)

CREATE TABLE TipoProveedor(
    idTipoProveedor int IDENTITY,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKTipoProveedor PRIMARY KEY(idTipoProveedor) 
)

CREATE TABLE Trabajador(
    idTrabajador int IDENTITY,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    fechaNacimiento date not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
	idPuesto int not null,
    idSucursal int not null,
    fechaContrata date not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKTrabajador PRIMARY KEY(idTrabajador)
)

CREATE TABLE Usuario(
    idUsuario int IDENTITY,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    correo varchar (50) not null UNIQUE,
    clave varbinary (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int null,
    fechaCrea datetime null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKUsuario PRIMARY KEY(idUsuario)
)

CREATE TABLE Vehiculo(
    idVehiculo int IDENTITY,
    numero varchar (10) not null,
    descripcion varchar (50) not null,
    idTrabajador int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKVehiculo PRIMARY KEY(idVehiculo)
)

CREATE TABLE Venta(
    idVenta int IDENTITY,
    referencia varchar (50) not null UNIQUE,
    fecha datetime not null,
    precio decimal (10,2) not null,
    idSucursal int not null,
    idCliente int not null,
    idCorteVenta int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null 
    CONSTRAINT PKVenta PRIMARY KEY(idVenta)
)

CREATE TABLE Zona(
    idZona int IDENTITY,
    nombre varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKZona PRIMARY KEY(idZona)
)

CREATE TABLE DescuentoVenta(
    idDescuentoVenta int IDENTITY,
    idDescuento int not null,
    idVenta int not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKDescuentoVenta PRIMARY KEY (idDescuentoVenta)
)

CREATE TABLE PlatilloMaterial(
    idPlatilloMaterial int IDENTITY,
    idPlatillo int not null,
    idMaterial int not null,
    cantidad decimal (10,2) not null,
    unidad varchar (50) not null,
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKPlatilloMaterial PRIMARY KEY (idPlatilloMaterial)
)

CREATE TABLE PlatilloVenta(
    idPlatilloVenta int IDENTITY,
    idPlatillo int not null,
    idVenta int not null,
    cantidad int not null, 
    estatus bit default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea datetime not null,
    idUsuarioModifica int default null,
    fechaModifica datetime default null
    CONSTRAINT PKPlatilloVenta PRIMARY KEY (idPlatilloVenta)
)

------------- RELACIONES -------------------------

ALTER TABLE Almacen
ADD CONSTRAINT FKAlmacenUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Almacen
ADD CONSTRAINT FKAlmacenUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoTipoAsentamiento FOREIGN KEY (idTipoAsentamiento)
REFERENCES TipoAsentamiento(idTipoAsentamiento)

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoMunicipio FOREIGN KEY (idMunicipio)
REFERENCES Municipio(idMunicipio)

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoZona FOREIGN KEY (idZona)
REFERENCES Zona(idZona)

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador)

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteTipoCliente FOREIGN KEY (idTipoCliente)
REFERENCES TipoCliente(idTipoCliente)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Compra
ADD CONSTRAINT FKCompraProveedor FOREIGN KEY (idProveedor)
REFERENCES Proveedor(idProveedor)

ALTER TABLE Compra
ADD CONSTRAINT FKCompraUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Compra
ADD CONSTRAINT FKCompraUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador)

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraCompra FOREIGN KEY (idCompra)
REFERENCES Compra(idCompra)

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta)

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Material
ADD CONSTRAINT FKMaterialCompra FOREIGN KEY (idCompra)
REFERENCES Compra(idCompra)

ALTER TABLE Material
ADD CONSTRAINT FKMaterialAlmacen FOREIGN KEY(idAlmacen)
REFERENCES Almacen(idAlmacen)

ALTER TABLE Material
ADD CONSTRAINT FKMaterialUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Material
ADD CONSTRAINT FKMaterialUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioEstado FOREIGN KEY (idEstado)
REFERENCES Estado(idEstado)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloTipoPlatillo FOREIGN KEY (idTipoPlatillo)
REFERENCES TipoPlatillo(idTipoPlatillo)

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorAsentamiento FOREIGN KEY (idAsentamiento)
REFERENCES Asentamiento(idAsentamiento)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorTipoProveedor FOREIGN KEY (idTipoProveedor)
REFERENCES TipoProveedor(idTipoProveedor)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalAsentamiento FOREIGN KEY (idAsentamiento)
REFERENCES Asentamiento(idAsentamiento)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FKTipoAsentamientoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FKTipoAsentamientoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoCliente
ADD CONSTRAINT FKTipoClienteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoCliente
ADD CONSTRAINT FKTipoClienteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoPlatillo
ADD CONSTRAINT FKTipoPlatilloUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoPlatillo
ADD CONSTRAINT FKTipoPlatilloUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoProveedor
ADD CONSTRAINT FKTipoProveedorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE TipoProveedor
ADD CONSTRAINT FKTipoProveedorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorSucursal FOREIGN KEY (idSucursal)
REFERENCES Sucursal(idSucursal)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorPuesto FOREIGN KEY (idPuesto)
REFERENCES Puesto(idPuesto)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador)

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaCliente FOREIGN KEY (idCliente)
REFERENCES Cliente(idCliente)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaSucursal FOREIGN KEY (idSucursal)
REFERENCES Sucursal(idSucursal)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaCorteVenta FOREIGN KEY (idCorteVenta)
REFERENCES CorteVenta(idCorteVenta)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE Zona
ADD CONSTRAINT FKZonaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE Zona
ADD CONSTRAINT FKZonaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaDescuento FOREIGN KEY (idDescuento)
REFERENCES Descuento(idDescuento)

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta)

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialPlatillo FOREIGN KEY (idPlatillo)
REFERENCES Platillo(idPlatillo)

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialMaterial FOREIGN KEY (idMaterial)
REFERENCES Material(idMaterial)

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaPlatillo FOREIGN KEY (idPlatillo)
REFERENCES Platillo(idPlatillo)

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta)

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario)

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario)

USE [Cafeteria]
GO

---------------------------- CREACION DE INDEX ----------------------------
CREATE INDEX IX_Almacen on Almacen(idAlmacen);
GO

CREATE INDEX IX_Asentamiento on Asentamiento(idAsentamiento);
GO

CREATE INDEX IX_Asistencia on Asistencia(idAsistencia);
GO

CREATE INDEX IX_Cliente on Cliente(idCliente);
GO

CREATE INDEX IX_Compra on Compra(idCompra);
GO

CREATE INDEX IX_CorteVenta on CorteVenta(idCorteVenta);
GO

CREATE INDEX IX_Descuento on Descuento(idDescuento);
GO

CREATE INDEX IX_DevolucionCompra on DevolucionCompra(idDevolucionCompra);
GO

CREATE INDEX IX_DevolucionVenta on DevolucionVenta(idDevolucionVenta);
GO

CREATE INDEX IX_Estado on Estado(idEstado);
GO

CREATE INDEX IX_Material on Material(idMaterial);
GO

CREATE INDEX IX_Municipio on Municipio(idMunicipio);
GO

CREATE INDEX IX_Platillo on Platillo(idPlatillo);
GO

CREATE INDEX IX_Proveedor on Proveedor(idProveedor);
GO

CREATE INDEX IX_Puesto on Puesto(idPuesto);
GO

CREATE INDEX IX_Sucursal on Sucursal(idSucursal);
GO

CREATE INDEX IX_TipoAsentamiento on TipoAsentamiento(idTipoAsentamiento);
GO

CREATE INDEX IX_TipoCliente on TipoCliente(idTipoCliente);
GO

CREATE INDEX IX_TipoPlatillo on TipoPlatillo(idTipoPlatillo);
GO

CREATE INDEX IX_TipoProveedor on TipoProveedor(idTipoProveedor);
GO

CREATE INDEX IX_Trabajador on Trabajador(idTrabajador);
GO

CREATE INDEX IX_Usuario on Usuario(idUsuario);
GO

CREATE INDEX IX_Vehiculo on Vehiculo(idVehiculo);
GO

CREATE INDEX IX_Venta on Venta(idVenta);
GO

CREATE INDEX IX_Zona on Zona(idZona);
GO

CREATE INDEX IX_DescuentoVenta on DescuentoVenta(idDescuentoVenta);
GO

CREATE INDEX IX_PlatilloMaterial on PlatilloMaterial(idPlatilloMaterial);
GO

CREATE INDEX IX_PlatilloVenta on PlatilloVenta(idPlatilloVenta);
GO

------------------ TRIGGERS -------------------------------------------

CREATE TRIGGER trgModificaTrabajador ON Trabajador
FOR UPDATE AS UPDATE Trabajador SET fechaModifica = CURRENT_TIMESTAMP FROM inserted
WHERE Trabajador.idTrabajador = inserted.idTrabajador
GO

CREATE TRIGGER trgMayusRfcTrab on Trabajador
FOR INSERT, UPDATE AS 
declare @longitud int
select @longitud = LEN(inserted.rfc)
from Trabajador, inserted
WHERE Trabajador.idTrabajador = inserted.idTrabajador
IF (@longitud < 13)
begin
raiserror ('El RFC debe de contener 13 carácteres', 16, 1)
ROLLBACK TRANSACTION
end
ELSE
UPDATE Trabajador SET rfc = UPPER(inserted.rfc) WHERE Trabajador.idTrabajador = inserted.idTrabajador
GO

CREATE TRIGGER trgTelfTrab on Trabajador
FOR INSERT, UPDATE AS
declare @long int
select @long = LEN(i.telefono)
FROM Trabajador t, inserted i 
WHERE t.idTrabajador = i.idTrabajador
IF (@long < 10)
begin
raiserror ('El número de teléfono debe ser de 10 dígitos', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgTerceraEdadTrab on Trabajador
FOR INSERT AS
declare @años int
select @años = DATEDIFF(year, i.fechaNacimiento, GETDATE())
FROM inserted i
IF (@años > 60)
begin
raiserror ('Pronto a jubilarse', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgTelfCli on Cliente
FOR INSERT, UPDATE AS
declare @long int
select @long = LEN(i.telefono)
FROM Cliente t, inserted i 
WHERE t.idCliente = i.idCliente
IF (@long < 10)
begin
raiserror ('El número de teléfono debe ser de 10 dígitos', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgCorreoCli on Cliente
FOR INSERT, UPDATE AS
declare @email varchar(50)
select @email = i.correo
from Cliente c, inserted i
WHERE c.idCliente = i.idCliente
IF (@email NOT LIKE '%@%') AND (@email NOT LIKE '%.%')
begin
raiserror ('Favor de ingresar una dirección de correo válida', 16, 1)
ROLLBACK TRANSACTION
end
else
UPDATE Cliente SET correo = LOWER(i.correo) WHERE c.idCliente = i.idCliente
GO

CREATE TRIGGER trgDescuento ON Descuento 
FOR INSERT, UPDATE AS 
declare @porcentaje int 
select @porcentaje = i.porcentaje
from  Descuento d, inserted i
WHERE d.idDescuento = i.idDescuento
IF (@porcentaje <= 0) OR (@porcentaje >= 100)
begin 
raiserror ('El descuento debe de ser mayor a 0 y menor a 100', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgCantidadCostoDC on DevolucionCompra
FOR INSERT, UPDATE AS 
declare @cantidad int, 
@costo decimal (10,2)
select @cantidad = i.cantidad,
@costo = i.costo
from DevolucionCompra dc, inserted i
WHERE dc.idDevolucionCompra = i.idDevolucionCompra
IF (@costo <= 0) OR (@cantidad <= 0)
begin 
raiserror ('El costo y la cantidad deben ser mayores a 0', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgActualizarBorrar on Trabajador 
INSTEAD OF DELETE AS
MERGE Trabajador as EmpTab
USING (Select * FROM DELETED) AS Emp
ON EmpTab.idTrabajador = Emp.idTrabajador
WHEN MATCHED then UPDATE SET estatus = 0;
GO

CREATE TRIGGER trgInsertarEstado on Estado
FOR INSERT AS 
declare @id int
select @id = i.idEstado
FROM inserted i
DELETE FROM Estado WHERE idEstado = @id
GO

CREATE TRIGGER trgDescuentoPrimeraVenta on Venta
FOR INSERT 
AS 
declare @numPed int, @idVen int
select @idVen = inserted.idVenta, @numPED = (SELECT COUNT(idVenta) FROM Venta WHERE idCliente = inserted.idCliente)
FROM inserted
IF (@numPed = 1)
begin
INSERT INTO DescuentoVenta(idDescuento, idVenta, fechaCrea, idUsuarioCrea) VALUES(1, @idVen, GETDATE(), 5)
end
GO

CREATE TRIGGER trgDescuentoTipoCliente on Venta
FOR INSERT
AS 
declare @idV int, @idTipC int
select @idV = inserted.idVenta, @idTipC = SELECT(idTipoCliente FROM Cliente WHERE idCliente = inserted.idCliente)
FROM inserted
IF (@idTipC = 2)
begin
INSERT INTO DescuentoVuenta(idDescuento, idVenta, fechaCrea, idUsuairoCrea) VALUES(2, @idV, GETDATE(), 5)
end
GO

CREATE TRIGGER trgMsjInsertar ON Zona
FOR INSERT 
AS
PRINT ('Zona insertada exitosamente')
GO

CREATE TRIGGER trgCapacidadAlmacen on Material
FOR INSERT
AS
declare @cantNueva int, @capaTotal int, @capaExis int 
select @cantNueva = inserted.cantidad, @capaTotal = (SELECT capacidad FROM Alamcen WHERE idAlmacen = inserted.idAlmacen), @capaExis = (SELECT SUM(cantidad) FROM Material wHERE idAlmacen = inserted.idAlmacen)
FROM inserted
IF ((@cantNueva + @capaExis) > @capaTotal)
begin
raiserror ('No se puede insertar porque el almacen está lleno', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgCantidadMaterial on PlatilloMaterial
FOR INSERT, UPDATE 
AS 
declare @cantNva decimal (10,2), @cantExist decimal (10,2), @cantTot decimal (10,2)
select @cantNva = i.cantidad, @cantExist = (SELECT SUM(cantidad) FROM PlatilloMaterial WHERE idMaterial = i.idMaterial), 
@cantTot = (SELECT SUM(cantidad) FROM Material WHERE nombre = (SELECT nombre FROM Material WHERE idMaterial = i.idMaterial) and 
descripcion = (SELECT descripcion FROM Material WHERE idMaterial = i.idMaterial) and estatus = 1)
FROM inserted i
IF ((@cantNva + @cantExist) > @cantTot)
begin
raiserror ('No se puede insertar porque no hay materiales suficientes', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgMayorEdad on Trabajador
FOR INSERT 
AS 
declare @años int
select @años = DATEDIFF(year, i.fechaNacimiento, GETDATE())
FROM inserted i
IF (@años < 18)
begin
raiserror ('No es mayor de edad', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgDevolverVenta on DevolucionVenta
FOR INSERT, UPDATE AS
declare @precioNvo decimal(10,2), @precioExis decimal(10,2), @cant int, @cantExis int
select @precioNvo = i.costo, @cant = i.cantidad, @precioExis = (SELECT precio FROM Venta WHERE idVenta = i.idVenta), @cantExis = (SELECT cantidad FROM Venta WHERE idVenta = i.idVenta)
FROM inserted i
IF (@precioNvo > @precioExis || @cant > @cantExis)
begin
raiserror ('El precio o la cantidad son mayores de lo que existe', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgActuCompra ON DevolucionCompra
FOR INSERT AS
UPDATE Compra SET precio = precio - i.costo WHERE idCompra = i.idCompra
FROM inserted i 
GO

CREATE TRIGGER trgActuVenta ON PlatilloVenta
FOR INSERT 
AS
declare @costo decimal (10,2), @cant int, @idV int
select @costo = (SELECT costo FROM Platillo WHERE idPlatillo = i.idPlatillo), @cant = i.cantidad, @idV = i.idVenta
FROM inserted i
UPDATE Venta SET precio = precio + (@costo * @cant) WHERE idVenta = @idV
GO

CREATE TRIGGER trgCompraMaterial ON Material
FOR INSERT 
AS
declare @costo decimal(10,2), @idCom int
select @costo = i.precio * i.cantidad, @idCom = i.idCompra
FROM inserted i
UPDATE Compra SET precio = precio + @costo WHERE idCompra = @idCom
GO

CREATE TRIGGER trgCorreoValidoUsuario ON Usuario
FOR INSERT, UPDATE AS 
declare @correo varchar(50)
select @correo = i.correo 
FROM inserted i
IF (@correo NOT LIKE '%@cafeteria.com')
begin
raiserror ('Correo electrónico inválido', 16, 1)
ROLLBACK TRANSACTION
end
GO

CREATE TRIGGER trgCalcularTotal ON PlatilloVenta
FOR INSERT 
AS
declare @tot decimal(10,2)
select @tot = p.costo * i.cantidad
from Platillo p, inserted i
PRINT (@tot)
GO

CREATE TRIGGER trgCorreoMinus on Proveedor
FOR INSERT, UPDATE 
AS
declare @correo varchar(50), @idProv int
select @correo = LOWER(i.correo), @idProv = i.idProveedor
FROM inserted i
UPDATE Proveedor SET correo = @correo WHERE @idProv = Proveedor.idProveedor
GO

CREATE TRIGGER trgDescuentoVentaCien on Venta
FOR INSERT 
AS 
declare @numPed int, @idVen int
select @idVen = inserted.idVenta, @numPED = (SELECT COUNT(idVenta) FROM Venta WHERE idCliente = inserted.idCliente)
FROM inserted
IF (@numPed = 100)
begin
INSERT INTO DescuentoVenta(idDescuento, idVenta, fechaCrea, idUsuarioCrea) VALUES(8, @idVen, GETDATE(), 5)
end
GO

CREATE TRIGGER trgValidarRFC ON Cliente
FOR INSERT, UPDATE
AS
declare @rfc char(13) 
select @rfc = i.rfc 
FROM inserted i
IF (@rfc NOT LIKE '%[0-9]%')
begin
raiserror ('RFC inválido', 16, 1)
ROLLBACK TRANSACTION
end
GO

---------------------------- Procedimientos almacenados -------------------------

CREATE PROCEDURE AumentoPrecio (@porc decimal)
AS
BEGIN
UPDATE Platillo SET costo = (costo * (1 + @porc/100))
END
GO

CREATE PROCEDURE BajarPrecio (@porc decimal)
AS
BEGIN
UPDATE platillo set costo = (costo * (1 - @porc/100))
END
GO

CREATE PROCEDURE SucursalCierra (@id int)
AS 
BEGIN
UPDATE trabajador SET estatus = 0 WHERE idSucursal = @id;
UPDATE sucursal SET estatus = 0 WHERE idSucursal = @id;
UPDATE ventas SET estatus = 0 WHERE idSucursal = @id;
END
GO

CREATE PROCEDURE BuscarTrabajador (@nombre varchar(150))
AS
BEGIN
SELECT @nombre = '%' + TRIM(@nombre) + '%';
SELECT t.idTrabajador, CONCAT_WS(' ', t.nombre, t.apellidoMaterno, t.apellidoPaterno) as 'Trabajador', p.nombre AS 'Puesto', s.nombre AS 'Sucursal', t.telefono AS Telefono
FROM Trabajador t JOIN Puesto p ON t.idPuesto = p.idPuesto JOIN Sucursal s ON s.idSucursal = t.idSucursal WHERE (t.nombre LIKE @nombre) OR t.apellidoMaterno LIKE @nombre OR t.apellidoPaterno LIKE @nombre;
END
GO

CREATE PROCEDURE PagoQuincena (@pagoHr decimal(10,2), @idP int)
AS
BEGIN
SELECT a.idTrabajador, CONCAT_WS(' ', t.nombre, t.apellidoPaterno) as Trabajador, SUM(DATEDIFF(hour, a.horaLlegada, a.horaSalida)) * @pagoHr as 'Pago total'
FROM Trabajador t JOIN Asistencia a ON t.idTrabajador = a.idTrabajador WHERE t.estatus=1 and t.idPuesto = @idP GROUP BY a.idTrabajador, t.nombre, t.apellidoPaterno 
END
GO

CREATE PROCEDURE Vacaciones (@id int, @pagoDia decimal(10,2))
AS
BEGIN
DECLARE @yt int, @vaca int
SET @yt = DATEDIFF(year, (SELECT fechaContrata FROM Trabajador WHERE idTrabajador = @id), GETDATE()) 
SET @vaca =
CASE 
WHEN @yt = 0 THEN 0
WHEN @yt = 1 THEN 6
WHEN @yt = 2 THEN 8
WHEN @yt = 3 THEN 10
WHEN @yt = 4 THEN 12
WHEN @yt >= 5 and @yt <= 9 THEN 14
WHEN @yt >= 10 and @yt <= 14 THEN 16
WHEN @yt >= 15 and @yt <= 19 THEN 18
WHEN @yt >=20 THEN 20
END
SELECT idTrabajador, CONCAT_WS(' ', nombre, apellidoPaterno) as Trabajador, @vaca as 'Días de vacaciones', @vaca * @pagoDia * 0.25 as 'Prima Vacacional' 
FROM Trabajador WHERE idTrabajador = @id
END
GO

CREATE PROCEDURE GananciaDia
AS
BEGIN
SELECT CAST(fecha as DATE) as 'Día', SUM(venta + tarjeta) as 'Venta total', SUM(gasto) as 'Gasto total', (SUM(venta + tarjeta) - SUM(gasto)) AS 'Resultado total' FROM CorteVenta GROUP BY CAST(fecha as DATE)
END
GO

CREATE PROCEDURE GananciaPromMens
AS
BEGIN
SELECT CONCAT_WS('-', DATEPART(month, fecha), DATEPART(year, fecha)) as 'Periodo', AVG((venta + tarjeta) - gasto) as 'Promedio' FROM CorteVenta GROUP BY CONCAT_WS('-', DATEPART(month, fecha), DATEPART(year, fecha))
END
GO

CREATE PROCEDURE AguinaldoTrab (@idPues int, @pagoDia decimal(10,2))
AS
BEGIN
SELECT CONCAT_WS(' ', nombre, apellidoPaterno) as 'Trabajador', 15 * @pagoDia as 'Aguinaldo' FROM Trabajador WHERE idPuesto = @idPues and estatus=1
END
GO

CREATE PROCEDURE FiniquitoRenuncia (@id int, @pagoDia decimal(10,2), @renuncia date)
AS
BEGIN
DECLARE @yt int, @vaca int, @diasTrab int, @aguin decimal(10,2), @primVac decimal(10,2)
SET @yt = DATEDIFF(year, (SELECT fechaContrata FROM Trabajador WHERE idTrabajador = @id), @renuncia) 
SET @diasTrab = DATEDIFF(day, (SELECT fechaContrata FROM Trabajador WHERE idTrabajador = @id), @renuncia);
SET @vaca =
CASE 
WHEN @yt = 0 THEN 0
WHEN @yt = 1 THEN 6
WHEN @yt = 2 THEN 8
WHEN @yt = 3 THEN 10
WHEN @yt = 4 THEN 12
WHEN @yt >= 5 and @yt <= 9 THEN 14
WHEN @yt >= 10 and @yt <= 14 THEN 16
WHEN @yt >= 15 and @yt <= 19 THEN 18
WHEN @yt >=20 THEN 20
END
if (@yt = 0)
begin
SET @aguin = 0.04109 * @diasTrab * @pagoDia
SET @primVac = 0.01643 * @diasTrab * @pagoDia * 0.25
end
ELSE
begin
SET @aguin = 15 * @pagoDia
SET @primVac = @vaca * @pagoDia * 0.25
end
SELECT CONCAT_WS(' ', nombre, apellidoMaterno, apellidoPaterno) as 'Trabajador', (@aguin + @primVac) as 'Finiquito' FROM Trabajador WHERE idTrabajador = @id
END
GO

CREATE PROCEDURE EstadisticaPlatillo (@id int)
AS
BEGIN
SELECT p.idPlatillo, p.nombre as 'Platillo', p.costo as 'Costo', AVG(pv.cantidad) as 'Promedio Venta', VAR(pv.cantidad)
FROM platillo p JOIN platilloVenta pv ON p.idPlatillo = pv.idPlatillo WHERE p.idPlatillo = @id GROUP BY p.nombre, p.costo
END
GO

CREATE PROCEDURE RankingPlatillos
AS
BEGIN
SELECT tp.nombre as 'Tipo Platillo', p.nombre AS 'Platillo', SUM(pv.cantidad) AS 'Ventas', ROW_NUMBER() OVER (PARTITION BY tp.nombre ORDER BY SUM(pv.cantidad) DESC) AS 'Ranking' 
FROM Platillo p JOIN TipoPlatillo tp ON p.idTipoPlatillo = tp.idTipoPlatillo JOIN PlatilloVenta pv on p.idPlatillo = pv.idPlatillo 
GROUP BY tp.nombre, p.nombre
END
GO

CREATE PROCEDURE ClientesSucursales
AS
BEGIN
SELECT s.nombre as 'Sucursal', e.nombre as 'Estado', COUNT(v.idCliente) as 'Clientes' 
FROM Sucursal s JOIN Asentamiento a ON s.idAsentamiento = a.idAsentamiento JOIN Estado e ON e.idEstado = a.idEstado JOIN Venta v ON v.idSucursal = s.idSucursal
GROUP BY s.nombre, e.nombre ORDER BY COUNT(v.idCliente) DESC
END
GO

CREATE PROCEDURE FechaRenovacionContrato
AS
BEGIN
SELECT CONCAT_WS(' ', nombre, apellidoMaterno, apellidoPaterno) as 'Trabajador', fechaContrata as 'Contratación', DATEADD(day, 150, fechaContrata)  as 'Fecha renovación', 
DATEDIFF(day, (DATEADD(day, 150, fechaContrata)), GETDATE()) AS 'Días faltantes o pasados'
FROM Trabajador
END
GO

CREATE PROCEDURE HacerCorte (@caja varchar(50), @gasto decimal(10,2), @tarjeta decimal (10,2), @idTrab int, @fecha date) 
AS
BEGIN
INSERT INTO CorteVenta(caja, fecha, venta, gasto, tarjeta, idTrabajador, idUsuarioCrea, fechaCrea) 
VALUES (@caja, @fecha, ((SELECT SUM(precio) WHERE CAST(fecha as DATE) = @fecha) - @tarjeta), @gasto, @tarjeta, @idTrab, 4, GETDATE())
END
GO

CREATE PROCEDURE CodigoDescuento (@codigo varchar(50), @idVen int)
AS
BEGIN
IF (@codigo = '699618278059RD')
begin 
INSERT INTO DescuentoVenta(idDescuento, idVenta, idUsuarioCrea, fechaCrea) VALUES(6, @idVen, 8, GETDATE())
end
ELSE
PRINT 'Código inválido o fuera de temporada'
END
GO

CREATE PROCEDURE CumpleañosSemana
AS
BEGIN
declare @semana int, 
select @semana = DATEPART(week, GETDATE())
SELECT CONCAT_WS (' ', nombre, apellidoPaterno) as 'Trabajador', CONCAT_WS('-', DATEPART(month, fechaNacimiento), DATEPART(day, fechaNacimiento)) AS 'Cumpleaños' 
FROM Trabajador WHERE DATEPART(week, fechaNacimiento) = @semana and estatus = 1
END
GO

CREATE PROCEDURE UbicacionProveedores
AS
BEGIN
SELECT CONCAT_WS(' ', p.nombre, p.apellidoPaterno) as 'Proveedor', p.telefono as 'Teléfono', e.nombre as 'Estado', m.nombre as 'Municipio' 
FROM Proveedor p JOIN Asentamiento a ON p.idAsentamiento = a.idAsentamiento JOIN Estado e ON a.idEstado = e.idEstado JOIN Municipio m ON m.idEstado = e.idEstado
WHERE p.estatus = 1 and m.codigo = a.idMunicipio
END
GO

CREATE PROCEDURE GananciaPerdidaTotal
AS
BEGIN
SELECT (SUM(v.precio) - SUM(dv.costo)) AS 'Ganancia', SUM(dv.costo) AS 'Pérdidas'
FROM Venta v JOIN DevolucionVenta dv ON v.idVenta = dv.idVenta
END
GO

CREATE PROCEDURE OrdenAnterior (@idCli int)
AS
BEGIN
SELECT p.nombre as 'Platillo', pv.cantidad as 'Cantidad', p.costo as 'Costo', CAST(v.fecha as DATE) AS 'Fecha'
FROM Platillo p INNER JOIN PlatilloVenta pv ON p.idPlatillo = pv.idPlatillo INNER JOIN Venta v ON v.idVenta = pv.idVenta INNER JOIN Cliente c ON c.idCliente = v.idCliente
WHERE c.idCliente = @idCli GROUP BY v.idVenta, p.nombre, pv.cantidad, p.costo, v.fecha ORDER BY v.fecha DESC
END
GO

CREATE PROCEDURE ActualizarVenta (@idV int)
AS
BEGIN
declare @precioTot decimal (10,2)
SET @precioTot = (SELECT SUM(p.costo * pv.cantidad) FROM PlatilloVenta pv INNER JOIN Venta v ON v.idVenta = pv.idVenta INNER JOIN Platillo p ON pv.idPlatillo = p.idPlatillo
WHERE v.idVenta = @idV)
UPDATE Venta SET precio = @precioTot WHERE idVenta = @idV
END
GO

CREATE PROCEDURE VentasSucursal
AS
BEGIN
SELECT s.nombre as 'Sucursal', CONCAT_WS(', ', a.nombre, m.nombre, e.nombre) as 'Dirección', AVG(v.precio) as 'Venta' 
FROM Sucursal s INNER JOIN Asentamiento a ON a.idAsentamiento = s.idAsentamiento INNER JOIN Municipio m ON m.idMunicipio = a.idMunicipio 
INNER JOIN Estado e ON e.idEstado = m.codigo INNER JOIN Venta v ON v.idSucursal = s.idSucursal
WHERE s.estatus = 1
GROUP BY s.nombre, CONCAT_WS(', ', a.nombre, m.nombre, e.nombre)
ORDER BY 'Venta' DESC
END
GO

CREATE PROCEDURE JubilacionProxima
AS
BEGIN 
SELECT CONCAT_WS(' ', nombre, apellidoMaterno, apellidoPaterno) as 'Trabajador', DATEDIFF(year, fechaNacimiento, GETDATE()) as 'Edad'
FROM Trabajador WHERE DATEDIFF(year, fechaNacimiento, GETDATE()) >= 58 and estatus = 1
ORDER BY 'Edad' DESC
END
GO

CREATE PROCEDURE DespedirJubilados
AS 
BEGIN
UPDATE Trabajador SET estatus = 0 WHERE DATEDIFF(year, fechaNacimiento, GETDATE()) >= 65
END
GO

-------------------- POBLAR D: -----------------

INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave)
VALUES ('Estefanía', 'Rosales', 'Domínguez', 'aerd00@cafeteria.com', HASHBYTES('MD5','hola123'));

INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave, idUsuarioCrea, fechaCrea)
VALUES('Flor', 'Domínguez', 'Andrade', 'fda01@cafeteria.com', HASHBYTES('MD5','hola123'), 1, GETDATE()),
('Leonardo', 'Rosales', 'Domínguez', 'lrd0a@cafeteria.com', HASHBYTES('MD5','hola123'), 1, GETDATE()),
('Susana', 'Rodriguez', 'Buenavista', 'srb0b@cafeteria.com', HASHBYTES('MD5','hola123'), 1, GETDATE()),
('Gian', 'Recio', 'Milanés', 'grm0c@cafeteria.com', HASHBYTES('MD5','hola123'), 1, GETDATE()),
('Ney', 'Gonzalez', 'Perla', 'ngp0d@algodocito.com', HASHBYTES('MD5','hola123'), 1, GETDATE()),
('Lorena', 'Huacuja', 'Romero', 'lhr0e@cafeteria.com', HASHBYTES('MD5','hola123'),1, GETDATE()),
('Angel', 'Rangel', 'Ortega', 'aro0f@cafeteria.com', HASHBYTES('MD5','hola123'),1, GETDATE()),
('Cristofer', 'Gutierrez', 'LLungo', 'cgl0g@cafeteria.com', HASHBYTES('MD5','hola123'),1, GETDATE()),
('Sofia', 'Lopez', 'Silva', 'sls0h@cafeteria.com', HASHBYTES('MD5','hola123'),1, GETDATE());

INSERT INTO TipoCliente(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Frecuente', 'Realiza compras al menos una vez por semana', 1, GETDATE()),
('Mayorista', 'Sus compras normalmente son de más de 5 platillos', 1, GETDATE()),
('Minorista', 'Sus compras normalmente son menos de 5 platillos', 1, GETDATE()),
('Ocasional', 'Realiza compras una o dos veces al mes', 1, GETDATE()),
('Nuevo', 'No han realizado su primera compra', 1, GETDATE()),
('Por temporada', 'Compra siempre que haya rebajas de temporada', 1, GETDATE()),
('Leal', 'Prefiere nuestros platillos', 1, GETDATE()),
('Invitado', 'Se le ha hecho una invitación a comprar', 1, GETDATE()),
('TipoCliente00', 'No existe', 1, GETDATE()),
('TipoCliente01', 'HOla', 1, GETDATE());

INSERT INTO TipoProveedor(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('De producto', 'Proporcionan un artículo o producto', 1, GETDATE()),
('De servicios', 'Distribuyen los servicios', 1, GETDATE()),
('De recursos', 'Satisfacen necesidades económicas', 1, GETDATE()),
('Confiable', 'Son prioritarios para la empresa', 1, GETDATE()),
('Específicos', 'Abastecen productos con propiedades especiales', 1, GETDATE()),
('Tipo A', 'Riesgo asociado elevado', 1, GETDATE()),
('Tipo B', 'Riesgo asociado medio', 1, GETDATE()),
('Tipo C', 'Riesto asociado bajo', 1, GETDATE()),
('Fabricantes', 'Fabrican su propio producto o servicio', 1, GETDATE()),
('Proveedor01', 'Descripción01', 1, GETDATE());

INSERT INTO TipoPlatillo(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Bebida APT', 'Bebidas sin alcohol' ,1, GETDATE()),
('Bebida Plus', 'Bebidas con alcohol' ,1, GETDATE()),
('Postre SG', 'Postres que no tienen gluten' ,1, GETDATE()),
('Comida', 'Plato fuerte' ,1, GETDATE()),
('Entrada', 'Aperitivo' ,1, GETDATE()),
('Desayuno', 'Comida de 8 am a 11 am' ,1, GETDATE()),
('Cena', 'Comida de 6 pm a 11 pm' ,1, GETDATE()),
('Niño', 'Comida para niños menores de 12 años' ,1, GETDATE()),
('Frio', 'Bebidas con hielo o estilo frappe',1, GETDATE()),
('Caliente', 'Bebidas calientes' ,1, GETDATE());

INSERT INTO Almacen(numero, capacidad, idUsuarioCrea, fechaCrea)
VALUES ('A-1827', 2500, 1, GETDATE()),
('A-1828', 3800, 1, GETDATE()),
('A-1829', 4500, 1, GETDATE()),
('A-1830', 1800, 1, GETDATE()),
('A-1831', 1100, 1, GETDATE()),
('A-1832', 1000, 1, GETDATE()),
('A-1833', 4300, 1, GETDATE()),
('A-1834', 2200, 1, GETDATE()),
('A-1835', 1100, 1, GETDATE()),
('A-1836', 2300, 1, GETDATE());

INSERT INTO Cliente(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idTipoCliente, idUsuarioCrea, fechaCrea)
VALUES ('Hector', 'Mora', 'Rodriguez', 'ROMH001254TRE', '1234567890', 'morita@hotmail.com', 4, 1, GETDATE()),
('Pelayo', 'Santiago', 'De la Cruz', 'DESP125748PL5', '4552698713', 'pelayo@outloo.com', 8, 1, GETDATE()),
('Jon', 'Vera', 'Niego', 'NIVJ789625LO2', '5668963214', 'veraniego@gmail.com', 5, 1, GETDATE()),
('Malika', 'Mira', 'Vaesta', 'VAMM452013PL8', '5779681235', 'likavaesta@hotmail.com', 4, 1, GETDATE()),
('Aquilino', 'Alvaro', 'Rosales', 'ROAA458963AS5', '9874520231', 'alvalino@yahoo.com.mx', 7, 1, GETDATE()),
('Teofilo', 'Gordo', 'Juarez', 'JUGT789654NJ5', '7412369851', 'gordito@hotmail.com', 9, 1, GETDATE()),
('Mireya', 'Ares', 'Spotify', 'SPAM569874LK1', '1233699874', 'aressinvirus@gmail.com', 2, 1, GETDATE()),
('Arturo', 'Janire', 'Pelaez', 'PEJA021125HU8', '9517382640', 'pelaezraro@hotmail.es', 4, 1, GETDATE()),
('Elisabet', 'Jimenez', 'Martinez', 'MAJE121212NJ8', '8661234567', 'martijimeeli@yahoo.com.mx', 3, 1, GETDATE()),
('Ariana', 'Castaño', 'Rubio', 'RUCA980525LO1', '5554446669', 'rucar@hotmail.es', 7, 1, GETDATE());

INSERT INTO Descuento(nombre, descripcion, porcentaje, idUsuarioCrea, fechaCrea)
VALUES ('Nuevo', 'Descuento para cuentas nuevas', 15, 1, GETDATE()),
('Compra 10', 'Por cada 15 platillos pedidos', 30, 1, GETDATE()),
('Mayor de 5', 'Compra de más de 5 platillos', 10, 1, GETDATE()),
('Aniversario', 'Un año siendo cliente', 45, 1, GETDATE()),
('Mayoreo', 'Después del platillo no. 30', 15, 1, GETDATE()),
('Codigo anuncio', 'Usa codigo de anuncios', 20, 1, GETDATE()),
('Cupón', 'Presenta cupón recortado', 30, 1, GETDATE()),
('Fidelidad', 'Viene a comer cada semana', 20, 1, GETDATE()),
('Recomienda', 'Han llegado clientes por su recomendación', 15, 1, GETDATE()),
('Aleatorio', 'No tiener razón de ser', 10, 1, GETDATE());

INSERT INTO Puesto(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Contador', 'Hace la contabilidad', 1, GETDATE()),
('Psicologo', 'Para recursos humanos', 1, GETDATE()),
('Tec. Sistemas', 'Da mantenimiento', 1, GETDATE()),
('Mesero', 'Atiende a los clientes', 1, GETDATE()),
('Cajero', 'Encargado de ventas', 1, GETDATE()),
('Repartidor', 'Entrega pedidos a domicilio', 1, GETDATE()),
('Conserje', 'Hace la limpieza del lugar', 1, GETDATE()),
('Gerente', 'Procura que todo este en orden', 1, GETDATE()),
('Capturista', 'Captura compras o ventas', 1, GETDATE()),
('Propietario', 'Dueño de la sucursal', 1, GETDATE());

---------------- DATOS DE CPdescarga -----------------------

insert into Zona(nombre, idUsuarioCrea, fechaCrea) select distinct d_zona, 1, GETDATE() from CPdescarga

insert into Estado(idEstado, nombre, idUsuarioCrea, fechaCrea) select distinct c_estado, d_estado, 1, GETDATE() from CPdescarga

insert into TipoAsentamiento(idTipoAsentamiento, nombre, idUsuarioCrea, fechaCrea) select distinct c_tipo_asenta, d_tipo_asenta, 1, GETDATE() from CPdescarga

insert into Municipio(nombre, idEstado, codigo, idUsuarioCrea, fechaCrea) select distinct D_mnpio, c_estado,  c_mnpio, 1, GETDATE() from CPdescarga

insert into Asentamiento(nombre, codigoPostal, idTipoAsentamiento, idMunicipio, idZona, idEstado, id, idUsuarioCrea, fechaCrea) 
select d_asenta, d_codigo, c_tipo_asenta, c_mnpio , 1, c_estado, id_asenta_cpcons, 1, GETDATE() from CPdescarga

update Asentamiento set idzona = (select idzona from zona where nombre =
(select d_zona from CPdescarga where c_mnpio =Asentamiento.idmunicipio and
c_estado =Asentamiento.idestado and d_codigo = Asentamiento.codigopostal and d_asenta=Asentamiento.nombre
and id_asenta_cpcons =Asentamiento.id))

----------------------------------------------------------

INSERT INTO Sucursal(nombre, telefono, calle, idAsentamiento, idUsuarioCrea, fechaCrea)
VALUES ('Angiteria', '8771452598', 'Algodón', 5, 1, GETDATE()),
('Esquina del café', '7442563968', 'Lanita', 152, 1, GETDATE()),
('Cafe gourmet', '1428749632', 'Esponjosa', 888, 1, GETDATE()),
('Cafesioso', '8889997777', 'Lana', 52, 1, GETDATE()),
('Capucch-ina', '8661411938', 'Chocolate', 857, 1, GETDATE()),
('Cafetería Tef', '5552223698', 'Jalisco', 666, 1, GETDATE()),
('Tefiteria', '2225558877', 'Queretaro', 77, 1, GETDATE()),
('Love-love cafetería', '4476692135', 'Bugambilias', 2563, 1, GETDATE()),
('SOLO VEN', '3667894521', 'Rosita', 4, 1, GETDATE()),
('No sé', '6995871436', 'Hola', 85, 1, GETDATE());

INSERT INTO Proveedor(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idAsentamiento, idTipoProveedor, idUsuarioCrea, fechaCrea)
VALUES ('Elias', 'Juarez', 'Ibarra', 'IBJE001263LS5', '6993641253', 'ibarrasinbarra@empresi.com', 8, 5, 1, GETDATE()),
('Felipe', 'Lopez', 'Alvarado', 'ALLF550396PO5', '8661254789', 'alvalopiz@hotmail.com', 985, 4, 1, GETDATE()),
('Cesar', 'Flores', 'Hipolito', 'HOFC140325SD7', '7441253698', 'hipocloroso@hipo.com.mx', 745, 5, 1, GETDATE()),
('Javier', 'Galindo', 'Guizopt', 'GUGJ001225WW5', '6665554441', 'gagaga@nose.com', 9999, 6, 1, GETDATE()),
('Carlos', 'Gonzalez', 'Herrera', 'HEGO001231SJ8', '4412368547', 'herregonzo@hotmail.com', 7485, 8, 1, GETDATE()),
('Benito', 'Camelo', 'Kchistoso', 'KCCB742236LK8', '6633221144', 'holacomo@estas.com.mx', 55555, 9, 1, GETDATE()),
('Juan', 'Bodoque', 'Gutierrez', 'GUBJ991122SD9', '5559991111', 'bodoquito@outlook.com', 96325, 7, 1, GETDATE()),
('Homero', 'Simpson', 'Jefferson', 'JESH142536DC4', '4444455555', 'jeffsimhom@koko.com', 74185, 6, 1, GETDATE()),
('Florencia', 'Rosales', 'Margarita', 'MARF225698LO4', '8661411938', 'flores@flores.com', 15935, 9, 1, GETDATE()),
('Juanita', 'Espinoza', 'Paz', 'PAEJ001111LK1', '4466882255', 'espipaz@jusete.com', 5420, 4, 1, GETDATE());

INSERT INTO Compra(referencia, fecha, precio, idUsuarioCrea, fechaCrea, idProveedor)
VALUES ('11111A', '2005-05-02 18:12:45', 1052, 1, GETDATE(), 8),
('11112A', '2005-05-02 19:35:58', 8965.66, 1, GETDATE(), 5),
('11113A', '2005-05-03 10:22:02', 7458.41, 1, GETDATE(), 7),
('11114A', '2005-05-03 13:48:11', 4589.22, 1, GETDATE(), 2),
('11115A', '2005-05-03 15:05:55', 415.70, 1, GETDATE(), 1),
('11116A', '2005-05-04 12:35:12', 748.88, 1, GETDATE(), 3),
('11117A', '2005-05-05 18:27:29', 2518.27, 1, GETDATE(), 4),
('11118A', '2005-05-06 14:47:23', 2563.11, 1, GETDATE(), 6),
('11119A', '2005-05-06 20:55:17', 7859.65, 1, GETDATE(), 10),
('11110A', '2005-05-06 22:14:21', 125.87, 1, GETDATE(), 9);

INSERT INTO Material(nombre, descripcion, precio, cantidad, idCompra, idUsuarioCrea, fechaCrea, idAlmacen)
VALUES ('Material 1A', 'Descripcion 1A', 459, 10, 5, 1, GETDATE(), 10),
('Material 2A', 'Descripcion 2A', 666, 4, 2, 1, GETDATE(), 2),
('Material 3A', 'Descripcion 3A', 475, 4, 5, 1, GETDATE(), 1),
('Material 4A', 'Descripcion 4A', 4966, 3, 4, 1, GETDATE(), 7),
('Material 5A', 'Descripcion 5A', 454, 4, 9, 1, GETDATE(), 8),
('Material 6A', 'Descripción 6A', 745.4, 10, 5, 1, GETDATE(), 5),
('Material 7A', 'Descripcion 7A', 496.55, 7, 2, 1, GETDATE(), 9),
('Material 8A', 'Descripcion 4A', 744.44, 4, 4, 1, GETDATE(), 10),
('Material 9A', 'Descripcion 9A', 799.55, 7, 6, 1, GETDATE(), 4),
('Material 10A', 'Descripcion 10A', 5499.99, 7, 4, 1, GETDATE(), 8);

INSERT INTO Platillo(nombre, descripcion, costo, idTipoPlatillo, idUsuarioCrea, fechaCrea)
VALUES ('Café americano', 'Café al estilo americano', 55.5, 10 , 1, GETDATE()),
('Piña colada', 'Bebida con piña y coco', 99.5, 1 , 1, GETDATE()),
('Pay de queso', 'Pay hecho de queso', 152.74, 3 , 1, GETDATE()),
('Frappe oreo', 'Café frío sabor oreo', 98.77, 5 , 1, GETDATE()),
('Hamburguesa', 'Pequeña con papas y refresco', 100, 8 , 1, GETDATE()),
('Donas Kakyoin', 'Donas con relleno de cereza', 30.22, 9 , 1, GETDATE()),
('Papas con queso', 'Se le puede añadir tocino', 57.66, 8 , 1, GETDATE()),
('Panini de queso', 'Con jamón, tomate y lechuga', 78.12, 5 , 1, GETDATE()),
('Frappe arcoiris', 'Frappe con varios colores', 185.2, 8 , 1, GETDATE()),
('Crepa', 'Puede ser de platano o fresas', 114.22, 4 , 1, GETDATE());

INSERT INTO Trabajador(nombre, apellidoMaterno, apellidoPaterno, rfc, fechaNacimiento, telefono, correo, fechaContrata, idPuesto, idSucursal, idUsuarioCrea, fechaCrea)
VALUES ('Susana', 'Juarez', 'Buenrostro', 'BUJS001029ET0', '2000-10-29', '8661411938', 'susanajb@coffeeshope.com', '2005-10-21', 5, 5, 1, GETDATE()),
('Jimena', 'Galindo', 'Gonzalez', 'GOGJ941225PT0', '1994-12-25', '8441425898', 'jimenita@coffeeshope.com', '2005-10-21', 7, 7, 1, GETDATE()),
('Pablo', 'Lozano', 'Lozano', 'LOLP750101SD0', '1975-01-01', '7445551236', 'pablito@coffeeshope.com', '2005-10-23', 2, 2, 1, GETDATE()),
('Lorena', 'Casas', 'Martinez', 'MACL850523SD9', '1985-05-23', '5661479632', 'lorena@coffeeshope.com', '2005-10-24', 8, 8, 1, GETDATE()),
('Gloria', 'Leon', 'Jaramillo', 'JALG800923PP1', '1980-09-23', '8994785210', 'glorita@coffeeshope.com', '2005-10-24', 4, 4, 1, GETDATE()),
('Julieta', 'Venegas', 'Estrada', 'ESVJ700421KD1', '1970-04-21', '8441253674', 'julimegas@coffeeshope.com', '2005-10-24', 7, 7, 1, GETDATE()),
('Veronica', 'Costello', 'Esponiza', 'ESCV850124AS9', '1985-01-24', '8997412586', 'verostello@coffeeshope.com', '2005-10-28', 9, 9, 1, GETDATE()),
('Carlos', 'Guerrero', 'Gomez', 'GOGC840712LK8', '1984-07-12', '8445521236', 'carlito@coffeeshope.com', '2005-10-28', 10, 10, 1, GETDATE()),
('Roberto', 'Valdez', 'Jaramillo', 'JAVR851128MN0', '1985-11-28', '7445698541', 'bertito@coffeeshope.com', '2005-10-29', 5, 5, 1, GETDATE()),
('Carolina', 'Herrera', 'Moreno', 'MOHC910504AS4', '1991-05-04', '8771423658', 'caroherre@coffeeshope.com', '2005-10-29', 4, 4, 1, GETDATE());

INSERT INTO Asistencia(fecha, horaLlegada, horaSalida, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('2005-12-01', '06:55', '14:59', 8 ,1, GETDATE()),
('2005-12-01', '06:56', '14:20', 7 ,1, GETDATE()),
('2005-12-01', '07:00', '14:55', 9 ,1, GETDATE()),
('2005-12-01', '07:01', '15:00', 5 ,1, GETDATE()),
('2005-12-01', '07:01', '15:05', 4 ,1, GETDATE()),
('2005-12-01', '07:01', '14:25', 3 ,1, GETDATE()),
('2005-12-01', '06:32', '19:21', 1 ,1, GETDATE()),
('2005-12-01', '06:45', '14:45', 10 ,1, GETDATE()),
('2005-12-01', '06:59', '18:32', 2 ,1, GETDATE()),
('2005-12-02', '07:05', '14:00', 6 ,1, GETDATE());

INSERT INTO Vehiculo(numero, descripcion, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('AE-85', 'Motocicleta', 7, 1, GETDATE()),
('AE-86', 'Autobus', 4, 1, GETDATE()),
('AE-87', 'Carrito', 1, 1, GETDATE()),
('AE-88', 'Furgoneta', 2, 1, GETDATE()),
('AE-89', 'Bicicleta', 3, 1, GETDATE()),
('AE-90', 'Avión de AMLO',5, 1, GETDATE()),
('AE-91', 'Tanque militar',6, 1, GETDATE()),
('AE-92', 'Carroza',8, 1, GETDATE()),
('AE-93', 'Tricilo',9, 1, GETDATE()),
('AE-94', 'Monociclo',10, 1, GETDATE());

INSERT INTO CorteVenta(venta, caja, fecha, gasto, tarjeta, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES (8956.25, 'A 185', '2005-02-02', 85.25, 155.2, 4, 1, GETDATE()),
(9784.25, 'A 186', '2005-02-02', 74.66, 985.2, 9, 1, GETDATE()),
(3256.88, 'A 187', '2005-02-02', 452, 88, 10, 1, GETDATE()),
(1250, 'A 188', '2005-02-02', 111, 748, 7, 1, GETDATE()),
(89652.25, 'S 174', '2005-02-02', 45.2, 87, 8, 1, GETDATE()),
(5896.22, 'A 185', '2005-02-03', 74.5, 785, 4, 1, GETDATE()),
(4785, 'A 186', '2005-02-03', 88.5, 995, 9, 1, GETDATE()),
(7498.65, 'A 187', '2005-02-03', 74.2, 99, 10, 1, GETDATE()),
(7485, 'A 188', '2005-02-03', 96.3, 78, 7, 1, GETDATE()),
(66520, 'S 174', '2005-02-03', 1528.88, 684, 8, 1, GETDATE());

INSERT INTO DevolucionCompra(platillo, razon, cantidad, costo, idCompra, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, GETDATE()),
('Ques ito', 'No citó', 850, 1250, 9, 1, GETDATE()),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, GETDATE()),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, GETDATE()),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, GETDATE()),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, GETDATE()),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, GETDATE()),
('Huevito frito', 'No cose', 5, 10523, 3, 1, GETDATE()),
('Piñita', 'Raspones', 254, 452, 8, 1, GETDATE()),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, GETDATE());

INSERT INTO Venta(referencia, fecha, precio, idSucursal, idCorteVenta, idUsuarioCrea, fechaCrea, idCliente)
VALUES ('V 78', '2005-08-28', 879.52, 7, 7, 1, GETDATE(), 5),
('V 79', '2005-08-28', 777, 8, 8, 1, GETDATE(), 7),
('V 80', '2005-08-28', 541.20, 9, 9, 1, GETDATE(), 7),
('V 81', '2005-08-28', 369, 4, 4, 1, GETDATE(), 6),
('V 82', '2005-08-28', 895, 2, 2, 1, GETDATE(), 2),
('V 83', '2005-08-29', 965, 5, 5, 1, GETDATE(), 1),
('V 84', '2005-08-29', 7485, 4, 4, 1, GETDATE(), 8),
('V 85', '2005-08-29', 456, 7, 7, 1, GETDATE(), 1),
('V 86', '2005-08-29', 854, 10, 10, 1, GETDATE(), 1),
('V 87', '2005-08-30', 123, 4, 4, 1, GETDATE(), 4);

INSERT INTO DevolucionVenta(platillo, razon, cantidad, costo, idVenta, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, GETDATE()),
('Ques ito', 'No citó', 850, 1250, 9, 1, GETDATE()),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, GETDATE()),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, GETDATE()),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, GETDATE()),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, GETDATE()),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, GETDATE()),
('Huevito frito', 'No cose', 5, 10523, 3, 1, GETDATE()),
('Piñita', 'Raspones', 254, 452, 8, 1, GETDATE()),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, GETDATE());

INSERT INTO DescuentoVenta(idDescuento, idVenta, idUsuarioCrea, fechaCrea)
VALUES (1,1, 1, GETDATE()),
(3, 3, 1, GETDATE()),
(5, 5, 1, GETDATE()),
(6, 6, 1, GETDATE()),
(7, 8, 1, GETDATE()),
(5, 1, 1, GETDATE()),
(8, 1, 1, GETDATE()),
(4, 1, 1, GETDATE()),
(5, 5, 1, GETDATE()),
(9, 1, 1, GETDATE());

INSERT INTO PlatilloMaterial(idPlatillo, idMaterial, cantidad, unidad, idUsuarioCrea, fechaCrea)
VALUES (1,1, 78.52, 'gramos', 1, GETDATE()),
(3, 3, 1827, 'gramos',1, GETDATE()),
(5, 5, 88, 'gramos',1, GETDATE()),
(6, 6, 47, 'gramos',1, GETDATE()),
(7, 8, 752, 'gramos',1, GETDATE()),
(5, 1, 962, 'gramos',1, GETDATE()),
(8, 1, 52, 'gramos',1, GETDATE()),
(4, 1, 777.52, 'gramos',1, GETDATE()),
(5, 5, 52.52, 'gramos',1, GETDATE()),
(9, 1, 98.2, 'gramos',1, GETDATE());

INSERT INTO PlatilloVenta(idPlatillo, idVenta, cantidad, idUsuarioCrea, fechaCrea)
VALUES (5,5,8 , 1, GETDATE()),
( 4, 4, 9, 1, GETDATE()),
( 2, 2, 1, 1, GETDATE()),
(7 ,5 ,8 , 1, GETDATE()),
(6, 8 , 2 , 1, GETDATE()),
(7 , 6 , 3 , 1, GETDATE()),
(4, 5, 8 , 1, GETDATE()),
(3, 2 ,1 , 1, GETDATE()),
(2, 2, 8 , 1, GETDATE()),
(8, 8, 5 , 1, GETDATE());
