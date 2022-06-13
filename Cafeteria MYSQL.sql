CREATE DATABASE Cafeteria;

USE Cafeteria;

CREATE TABLE Almacen(
    idAlmacen int(11),
    numero varchar (10) not null,
    capacidad int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE Asentamiento(
    idAsentamiento int(11), 
    id int(11),
    nombre varchar (100) not null,
    codigoPostal char (5) not null,
    idTipoAsentamiento int(11) not null,
    idMunicipio int(11) not null,
    idEstado int(11) not null,
    idZona int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);


CREATE TABLE Asistencia(
    idAsistencia int(11),
    fecha date not null, 
    horaLlegada time not null,
    horaSalida time not null,
    idTrabajador int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE Cliente(
    idCliente int(11),
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoCliente int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Compra(
    idCompra int(11),
    referencia varchar (50) not null,
    fecha datetime not null,
    precio decimal (10,2) not null,
    idProveedor int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE CorteVenta(
    idCorteVenta int(11),
    caja varchar (50) not null,
    fecha datetime not null,
    venta decimal (10,2) not null,
    gasto decimal (10,2) not null,
    tarjeta decimal (10,2) not null,
    idTrabajador int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Descuento(
    idDescuento int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    porcentaje int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE DevolucionCompra(
    idDevolucionCompra int(11),
    articulo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int(11) not null,
    costo decimal (10,2) not null,
    idCompra int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE DevolucionVenta(
    idDevolucionVenta int(11),
    platillo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int(11) not null,
    costo decimal (10,2) not null,
    idVenta int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Estado
(
    idEstado int(11) UNIQUE,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Material(
    idMaterial int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    precio decimal (10,2) not null,
    cantidad int(11) not null,
    idCompra int(11) not null,
    idAlmacen int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null  
);

CREATE TABLE Municipio(
    idMunicipio int(11),
    nombre varchar (50) not null,
    codigo int(11) not null,
    idEstado int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Platillo (
    idPlatillo int(11),
    nombre varchar (50) not null,
    descripcion varchar (100) not null,
    costo decimal (10,2) not null,
    idTipoPlatillo int not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE Proveedor(
    idProveedor int(11),
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoProveedor int(11) not null,
    idAsentamiento int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Puesto(
    idPuesto int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Sucursal(
    idSucursal int(11),
    nombre varchar (50) not null,
    telefono char (10) not null,
    calle varchar (50) not null,
    idAsentamiento int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE TipoAsentamiento(
    idTipoAsentamiento int(11) UNIQUE,
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null  
);

CREATE TABLE TipoCliente(
    idTipoCliente int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null  
);

CREATE TABLE TipoPlatillo(
    idTipoPlatillo int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE TipoProveedor(
    idTipoProveedor int(11),
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Trabajador(
    idTrabajador int(11),
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    fechaNacimiento date not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
	idPuesto int(11) not null,
    idSucursal int(11) not null,
    fechaContrata date not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Usuario(
    idUsuario int(11),
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    correo varchar (50) not null UNIQUE,
    clave varbinary (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) null,
    fechaCrea datetime null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Vehiculo(
    idVehiculo int(11),
    numero varchar (10) not null,
    descripcion varchar (50) not null,
    idTrabajador int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Venta(
    idVenta int(11),
    referencia varchar (50) not null UNIQUE,
    fecha datetime not null,
    precio decimal (10,2) not null,
    idSucursal int(11) null,
    idCliente int(11) null,
    idCorteVenta int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null 
);

CREATE TABLE Zona(
    idZona int(11),
    nombre varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE DescuentoVenta(
    idDescuentoVenta int(11),
    idDescuento int(11) not null,
    idVenta int(11) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE PlatilloMaterial(
    idPlatilloMaterial int(11),
    idPlatillo int(11) not null,
    idMaterial int(11) not null,
    cantidad decimal (10,2) not null,
    unidad varchar (50) not null,
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

CREATE TABLE PlatilloVenta(
    idPlatilloVenta int(11),
    idPlatillo int(11) not null,
    idVenta int(11) not null,
    cantidad int(11) not null, 
    estatus bit default 1,
    idUsuarioCrea int(11) not null,
    fechaCrea datetime not null default CURRENT_TIMESTAMP,
    idUsuarioModifica int(11) default null,
    fechaModifica datetime default null
);

ALTER TABLE Almacen ADD PRIMARY KEY (idAlmacen);
ALTER TABLE Asentamiento ADD PRIMARY KEY (idAsentamiento);
ALTER TABLE Asistencia ADD PRIMARY KEY (idAsistencia);
ALTER TABLE Cliente ADD PRIMARY KEY (idCliente);
ALTER TABLE Compra ADD PRIMARY KEY (idCompra);
ALTER TABLE CorteVenta ADD PRIMARY KEY (idCorteVenta);
ALTER TABLE Descuento ADD PRIMARY KEY (idDescuento);
ALTER TABLE DevolucionCompra ADD PRIMARY KEY (idDevolucionCompra);
ALTER TABLE DevolucionVenta ADD PRIMARY KEY (idDevolucionVenta);
ALTER TABLE Estado ADD PRIMARY KEY (idEstado);
ALTER TABLE Material ADD PRIMARY KEY (idMaterial);
ALTER TABLE Municipio ADD PRIMARY KEY (idMunicipio);
ALTER TABLE Platillo ADD PRIMARY KEY (idPlatillo);
ALTER TABLE Proveedor ADD PRIMARY KEY (idProveedor);
ALTER TABLE Puesto ADD PRIMARY KEY (idPuesto);
ALTER TABLE Sucursal ADD PRIMARY KEY (idSucursal);
ALTER TABLE TipoAsentamiento ADD PRIMARY KEY (idTipoAsentamiento);
ALTER TABLE TipoCliente ADD PRIMARY KEY (idTipoCliente);
ALTER TABLE TipoPlatillo ADD PRIMARY KEY (idTipoPlatillo);
ALTER TABLE TipoProveedor ADD PRIMARY KEY (idTipoProveedor);
ALTER TABLE Trabajador ADD PRIMARY KEY (idTrabajador);
ALTER TABLE Usuario ADD PRIMARY KEY (idUsuario);
ALTER TABLE Vehiculo ADD PRIMARY KEY (idVehiculo);
ALTER TABLE Venta ADD PRIMARY KEY (idVenta);
ALTER TABLE Zona ADD PRIMARY KEY (idZona);
ALTER TABLE DescuentoVenta ADD PRIMARY KEY (idDescuentoVenta);
ALTER TABLE PlatilloMaterial ADD PRIMARY KEY (idPlatilloMaterial);
ALTER TABLE PlatilloVenta ADD PRIMARY KEY (idPlatilloVenta);

ALTER TABLE Almacen MODIFY idAlmacen int(11) not null AUTO_INCREMENT;
ALTER TABLE Asentamiento MODIFY idAsentamiento int(11) not null AUTO_INCREMENT;
ALTER TABLE Asistencia MODIFY idAsistencia int(11) not null AUTO_INCREMENT;
ALTER TABLE Cliente MODIFY idCliente int(11) not null AUTO_INCREMENT;
ALTER TABLE Compra MODIFY idCompra int(11) not null AUTO_INCREMENT;
ALTER TABLE CorteVenta MODIFY idCorteVenta int(11) not null AUTO_INCREMENT;
ALTER TABLE Descuento MODIFY idDescuento int(11) not null AUTO_INCREMENT;
ALTER TABLE DevolucionCompra MODIFY idDevolucionCompra int(11) not null AUTO_INCREMENT;
ALTER TABLE DevolucionVenta MODIFY idDevolucionVenta int(11) not null AUTO_INCREMENT;
ALTER TABLE Material MODIFY idMaterial int(11) not null AUTO_INCREMENT;
ALTER TABLE Municipio MODIFY idMunicipio int(11) not null AUTO_INCREMENT;
ALTER TABLE Platillo MODIFY idPlatillo int(11) not null AUTO_INCREMENT;
ALTER TABLE Proveedor MODIFY idProveedor int(11) not null AUTO_INCREMENT;
ALTER TABLE Puesto MODIFY idPuesto int(11) not null AUTO_INCREMENT;
ALTER TABLE Sucursal MODIFY idSucursal int(11) not null AUTO_INCREMENT;
ALTER TABLE TipoCliente MODIFY idTipoCliente int(11) not null AUTO_INCREMENT;
ALTER TABLE TipoPlatillo MODIFY idTipoPlatillo int(11) not null AUTO_INCREMENT;
ALTER TABLE TipoProveedor MODIFY idTipoProveedor int(11) not null AUTO_INCREMENT;
ALTER TABLE Trabajador MODIFY idTrabajador int(11) not null AUTO_INCREMENT;
ALTER TABLE Usuario MODIFY idUsuario int(11) not null AUTO_INCREMENT;
ALTER TABLE Vehiculo MODIFY idVehiculo int(11) not null AUTO_INCREMENT;
ALTER TABLE Venta MODIFY idVenta int(11) not null AUTO_INCREMENT;
ALTER TABLE Zona MODIFY idZona int(11) not null AUTO_INCREMENT;
ALTER TABLE DescuentoVenta MODIFY idDescuentoVenta int(11) not null AUTO_INCREMENT;
ALTER TABLE PlatilloMaterial MODIFY idPlatilloMaterial int(11) not null AUTO_INCREMENT;
ALTER TABLE PlatilloVenta MODIFY idPlatilloVenta int(11) not null AUTO_INCREMENT;

ALTER TABLE Almacen
ADD CONSTRAINT FKAlmacenUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Almacen
ADD CONSTRAINT FKAlmacenUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoTipoAsentamiento FOREIGN KEY (idTipoAsentamiento)
REFERENCES TipoAsentamiento(idTipoAsentamiento);

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoMunicipio FOREIGN KEY (idMunicipio)
REFERENCES Municipio(idMunicipio);

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoZona FOREIGN KEY (idZona)
REFERENCES Zona(idZona);

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Asentamiento
ADD CONSTRAINT FKAsentamientoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador);

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Asistencia
ADD CONSTRAINT FKAsistenciaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteTipoCliente FOREIGN KEY (idTipoCliente)
REFERENCES TipoCliente(idTipoCliente);

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Cliente
ADD CONSTRAINT FKClienteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Compra
ADD CONSTRAINT FKCompraProveedor FOREIGN KEY (idProveedor)
REFERENCES Proveedor(idProveedor);

ALTER TABLE Compra
ADD CONSTRAINT FKCompraUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Compra
ADD CONSTRAINT FKCompraUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador);

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE CorteVenta
ADD CONSTRAINT FKCorteVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Descuento
ADD CONSTRAINT FKDescuentoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraCompra FOREIGN KEY (idCompra)
REFERENCES Compra(idCompra);

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE DevolucionCompra
ADD CONSTRAINT FKDevolucionCompraUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta);

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE DevolucionVenta
ADD CONSTRAINT FKDevolucionVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Estado
ADD CONSTRAINT FKEstadoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Material
ADD CONSTRAINT FKMaterialCompra FOREIGN KEY (idCompra)
REFERENCES Compra(idCompra);

ALTER TABLE Material
ADD CONSTRAINT FKMaterialAlmacen FOREIGN KEY(idAlmacen)
REFERENCES Almacen(idAlmacen);

ALTER TABLE Material
ADD CONSTRAINT FKMaterialUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Material
ADD CONSTRAINT FKMaterialUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioEstado FOREIGN KEY (idEstado)
REFERENCES Estado(idEstado);

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Municipio
ADD CONSTRAINT FKMunicipioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloTipoPlatillo FOREIGN KEY (idTipoPlatillo)
REFERENCES TipoPlatillo(idTipoPlatillo);

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Platillo
ADD CONSTRAINT FKPlatilloUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorAsentamiento FOREIGN KEY (idAsentamiento)
REFERENCES Asentamiento(idAsentamiento);

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorTipoProveedor FOREIGN KEY (idTipoProveedor)
REFERENCES TipoProveedor(idTipoProveedor);

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Proveedor
ADD CONSTRAINT FKProveedorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Puesto
ADD CONSTRAINT FKPuestoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalAsentamiento FOREIGN KEY (idAsentamiento)
REFERENCES Asentamiento(idAsentamiento);

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Sucursal
ADD CONSTRAINT FKSucursalUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FKTipoAsentamientoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoAsentamiento
ADD CONSTRAINT FKTipoAsentamientoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoCliente
ADD CONSTRAINT FKTipoClienteUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoCliente
ADD CONSTRAINT FKTipoClienteUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoPlatillo
ADD CONSTRAINT FKTipoPlatilloUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoPlatillo
ADD CONSTRAINT FKTipoPlatilloUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoProveedor
ADD CONSTRAINT FKTipoProveedorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE TipoProveedor
ADD CONSTRAINT FKTipoProveedorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorSucursal FOREIGN KEY (idSucursal)
REFERENCES Sucursal(idSucursal);

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorPuesto FOREIGN KEY (idPuesto)
REFERENCES Puesto(idPuesto);

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Trabajador
ADD CONSTRAINT FKTrabajadorUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Usuario
ADD CONSTRAINT FKUsuarioUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoTrabajador FOREIGN KEY (idTrabajador)
REFERENCES Trabajador(idTrabajador);

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Vehiculo
ADD CONSTRAINT FKVehiculoUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Venta
ADD CONSTRAINT FKVentaCliente FOREIGN KEY (idCliente)
REFERENCES Cliente(idCliente);

ALTER TABLE Venta
ADD CONSTRAINT FKVentaSucursal FOREIGN KEY (idSucursal)
REFERENCES Sucursal(idSucursal);

ALTER TABLE Venta
ADD CONSTRAINT FKVentaCorteVenta FOREIGN KEY (idCorteVenta)
REFERENCES CorteVenta(idCorteVenta);

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Venta
ADD CONSTRAINT FKVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE Zona
ADD CONSTRAINT FKZonaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE Zona
ADD CONSTRAINT FKZonaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaDescuento FOREIGN KEY (idDescuento)
REFERENCES Descuento(idDescuento);

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta);

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE DescuentoVenta
ADD CONSTRAINT FKDescuentoVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialPlatillo FOREIGN KEY (idPlatillo)
REFERENCES Platillo(idPlatillo);

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialMaterial FOREIGN KEY (idMaterial)
REFERENCES Material(idMaterial);

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE PlatilloMaterial
ADD CONSTRAINT FKPlatilloMaterialUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaPlatillo FOREIGN KEY (idPlatillo)
REFERENCES Platillo(idPlatillo);

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaVenta FOREIGN KEY (idVenta)
REFERENCES Venta(idVenta);

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaUsuarioCrea FOREIGN KEY (idUsuarioCrea)
REFERENCES Usuario(idUsuario);

ALTER TABLE PlatilloVenta
ADD CONSTRAINT FKPlatilloVentaUsuarioModifica FOREIGN KEY (idUsuarioModifica)
REFERENCES Usuario(idUsuario);




INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave)
VALUES ('Estefanía', 'Rosales', 'Domínguez', 'aerd00@cafeteria.com', MD5('hola123'));

INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave, idUsuarioCrea, fechaCrea)
VALUES('Flor', 'Domínguez', 'Andrade', 'fda01@cafeteria.com', MD5('hola123'), 1, NOW()),
('Leonardo', 'Rosales', 'Domínguez', 'lrd0a@cafeteria.com', MD5('hola123'), 1, NOW()),
('Susana', 'Rodriguez', 'Buenavista', 'srb0b@cafeteria.com', MD5('hola123'), 1, NOW()),
('Gian', 'Recio', 'Milanés', 'grm0c@cafeteria.com', MD5('hola123'), 1, NOW()),
('Ney', 'Gonzalez', 'Perla', 'ngp0d@algodocito.com', MD5('hola123'), 1, NOW()),
('Lorena', 'Huacuja', 'Romero', 'lhr0e@cafeteria.com', MD5('hola123'),1, NOW()),
('Angel', 'Rangel', 'Ortega', 'aro0f@cafeteria.com', MD5('hola123'),1, NOW()),
('Cristofer', 'Gutierrez', 'LLungo', 'cgl0g@cafeteria.com', MD5('hola123'),1, NOW()),
('Sofia', 'Lopez', 'Silva', 'sls0h@cafeteria .com', MD5('hola123'),1, NOW());

INSERT INTO TipoCliente(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Frecuente', 'Realiza compras al menos una vez por semana', 1, NOW()),
('Mayorista', 'Sus compras normalmente son de más de 5 platillos', 1, NOW()),
('Minorista', 'Sus compras normalmente son menos de 5 platillos', 1, NOW()),
('Ocasional', 'Realiza compras una o dos veces al mes', 1, NOW()),
('Nuevo', 'No han realizado su primera compra', 1, NOW()),
('Por temporada', 'Compra siempre que haya rebajas de temporada', 1, NOW()),
('Leal', 'Prefiere nuestros platillos', 1, NOW()),
('Invitado', 'Se le ha hecho una invitación a comprar', 1, NOW()),
('TipoCliente00', 'No existe', 1, NOW()),
('TipoCliente01', 'HOla', 1, NOW());

INSERT INTO TipoProveedor(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('De producto', 'Proporcionan un artículo o producto', 1, NOW()),
('De servicios', 'Distribuyen los servicios', 1, NOW()),
('De recursos', 'Satisfacen necesidades económicas', 1, NOW()),
('Confiable', 'Son prioritarios para la empresa', 1, NOW()),
('Específicos', 'Abastecen productos con propiedades especiales', 1, NOW()),
('Tipo A', 'Riesgo asociado elevado', 1, NOW()),
('Tipo B', 'Riesgo asociado medio', 1, NOW()),
('Tipo C', 'Riesto asociado bajo', 1, NOW()),
('Fabricantes', 'Fabrican su propio producto o servicio', 1, NOW()),
('Proveedor01', 'Descripción01', 1, NOW());

INSERT INTO TipoPlatillo(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Bebida APT', 'Bebidas sin alcohol' ,1, NOW()),
('Bebida Plus', 'Bebidas con alcohol' ,1, NOW()),
('Postre SG', 'Postres que no tienen gluten' ,1, NOW()),
('Comida', 'Plato fuerte' ,1, NOW()),
('Entrada', 'Aperitivo' ,1, NOW()),
('Desayuno', 'Comida de 8 am a 11 am' ,1, NOW()),
('Cena', 'Comida de 6 pm a 11 pm' ,1, NOW()),
('Niño', 'Comida para niños menores de 12 años' ,1, NOW()),
('Frio', 'Bebidas con hielo o estilo frappe',1, NOW()),
('Caliente', 'Bebidas calientes' ,1, NOW());

INSERT INTO Almacen(numero, capacidad, idUsuarioCrea, fechaCrea)
VALUES ('A-1827', 2500, 1, NOW()),
('A-1828', 3800, 1, NOW()),
('A-1829', 4500, 1, NOW()),
('A-1830', 1800, 1, NOW()),
('A-1831', 1100, 1, NOW()),
('A-1832', 1000, 1, NOW()),
('A-1833', 4300, 1, NOW()),
('A-1834', 2200, 1, NOW()),
('A-1835', 1100, 1, NOW()),
('A-1836', 2300, 1, NOW());

INSERT INTO Cliente(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idTipoCliente, idUsuarioCrea, fechaCrea)
VALUES ('Hector', 'Mora', 'Rodriguez', 'ROMH001254TRE', '1234567890', 'morita@hotmail.com', 4, 1, NOW()),
('Pelayo', 'Santiago', 'De la Cruz', 'DESP125748PL5', '4552698713', 'pelayo@outloo.com', 8, 1, NOW()),
('Jon', 'Vera', 'Niego', 'NIVJ789625LO2', '5668963214', 'veraniego@gmail.com', 5, 1, NOW()),
('Malika', 'Mira', 'Vaesta', 'VAMM452013PL8', '5779681235', 'likavaesta@hotmail.com', 4, 1, NOW()),
('Aquilino', 'Alvaro', 'Rosales', 'ROAA458963AS5', '9874520231', 'alvalino@yahoo.com.mx', 7, 1, NOW()),
('Teofilo', 'Gordo', 'Juarez', 'JUGT789654NJ5', '7412369851', 'gordito@hotmail.com', 9, 1, NOW()),
('Mireya', 'Ares', 'Spotify', 'SPAM569874LK1', '1233699874', 'aressinvirus@gmail.com', 2, 1, NOW()),
('Arturo', 'Janire', 'Pelaez', 'PEJA021125HU8', '9517382640', 'pelaezraro@hotmail.es', 4, 1, NOW()),
('Elisabet', 'Jimenez', 'Martinez', 'MAJE121212NJ8', '8661234567', 'martijimeeli@yahoo.com.mx', 3, 1, NOW()),
('Ariana', 'Castaño', 'Rubio', 'RUCA980525LO1', '5554446669', 'rucar@hotmail.es', 7, 1, NOW());

INSERT INTO Descuento(nombre, descripcion, porcentaje, idUsuarioCrea, fechaCrea)
VALUES ('Nuevo', 'Descuento para cuentas nuevas', 15, 1, NOW()),
('Compra 10', 'Por cada 15 platillos pedidos', 30, 1, NOW()),
('Mayor de 5', 'Compra de más de 5 platillos', 10, 1, NOW()),
('Aniversario', 'Un año siendo cliente', 45, 1, NOW()),
('Mayoreo', 'Después del platillo no. 30', 15, 1, NOW()),
('Codigo anuncio', 'Usa codigo de anuncios', 20, 1, NOW()),
('Cupón', 'Presenta cupón recortado', 30, 1, NOW()),
('Fidelidad', 'Viene a comer cada semana', 20, 1, NOW()),
('Recomienda', 'Han llegado clientes por su recomendación', 15, 1, NOW()),
('Aleatorio', 'No tiener razón de ser', 10, 1, NOW());

INSERT INTO Puesto(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Contador', 'Hace la contabilidad', 1, NOW()),
('Psicologo', 'Para recursos humanos', 1, NOW()),
('Tec. Sistemas', 'Da mantenimiento', 1, NOW()),
('Mesero', 'Atiende a los clientes', 1, NOW()),
('Cajero', 'Encargado de ventas', 1, NOW()),
('Repartidor', 'Entrega pedidos a domicilio', 1, NOW()),
('Conserje', 'Hace la limpieza del lugar', 1, NOW()),
('Gerente', 'Procura que todo este en orden', 1, NOW()),
('Capturista', 'Captura compras o ventas', 1, NOW()),
('Propietario', 'Dueño de la sucursal', 1, NOW());


insert into Zona(nombre, idUsuarioCrea, fechaCrea)
VALUES ('Semiurbano', 1, NOW()),
('Urbano', 1, NOW()),
('Rural', 1, NOW());

insert into Estado(idEstado, nombre, idUsuarioCrea, fechaCrea) 
VALUES (1,'Aguascalientes',1,NOW()),
(2,'Baja California',1,NOW()),
(3,'Baja California Sur',1,NOW()),
(4,'Campeche',1,NOW()),
(5,'Coahuila de Zaragoza',1,NOW()),
(6,'Colima',1,NOW()),
(7,'Chiapas',1,NOW()),
(8,'Chihuahua',1,NOW()),
(9,'Ciudad de México',1,NOW()),
(10,'Durango',1,NOW()),
(11,'Guanajuato',1,NOW()),
(12,'Guerrero',1,NOW()),
(13,'Hidalgo',1,NOW()),
(14,'Jalisco',1,NOW()),
(15,'México',1,NOW()),
(16,'Michoacán de Ocampo',1,NOW()),
(17,'Morelos',1,NOW()),
(18,'Nayarit',1,NOW()),
(19,'Nuevo León',1,NOW()),
(20,'Oaxaca',1,NOW()),
(21,'Puebla',1,NOW()),
(22,'Querétaro',1,NOW()),
(23,'Quintana Roo',1,NOW()),
(24,'San Luis Potosí',1,NOW()),
(25,'Sinaloa',1,NOW()),
(26,'Sonora',1,NOW()),
(27,'Tabasco',1,NOW()),
(28,'Tamaulipas',1,NOW()),
(29,'Tlaxcala',1,NOW()),
(30,'Veracruz de Ignacio de la Llave',1,NOW()),
(31,'Yucatán',1,NOW()),
(32,'Zacatecas',1,NOW());

insert into TipoAsentamiento(idTipoAsentamiento, nombre, idUsuarioCrea, fechaCrea)
VALUES(1,'Aeropuerto',1,NOW()),
(2,'Barrio',1,NOW()),
(4,'Campamento',1,NOW()),
(9,'Colonia',1,NOW()),
(10,'Condominio',1,NOW()),
(11,'Congregación',1,NOW()),
(12,'Conjunto habitacional',1,NOW()),
(15,'Ejido',1,NOW()),
(16,'Estación',1,NOW()),
(17,'Equipamiento',1,NOW()),
(18,'Exhacienda',1,NOW()),
(20,'Finca',1,NOW()),
(21,'Fraccionamiento',1,NOW()),
(23,'Granja',1,NOW()),
(24,'Hacienda',1,NOW()),
(26,'Parque industrial',1,NOW()),
(27,'Poblado comunal',1,NOW()),
(28,'Pueblo',1,NOW()),
(29,'Ranchería',1,NOW()),
(30,'Residencial',1,NOW()),
(31,'Unidad habitacional',1,NOW()),
(32,'Villa',1,NOW()),
(33,'Zona comercial',1,NOW()),
(34,'Zona federal',1,NOW()),
(37,'Zona industrial',1,NOW()),
(40,'Puerto',1,NOW()),
(45,'Paraje',1,NOW()),
(46,'Zona naval',1,NOW()),
(47,'Zona militar',1,NOW()),
(48,'Rancho',1,NOW());


INSERT INTO Sucursal(nombre, telefono, calle, idAsentamiento, idUsuarioCrea, fechaCrea)
VALUES ('Angiteria', '8771452598', 'Algodón', 5, 1, NOW()),
('Esquina del café', '7442563968', 'Lanita', 152, 1, NOW()),
('Cafe gourmet', '1428749632', 'Esponjosa', 888, 1, NOW()),
('Cafesioso', '8889997777', 'Lana', 52, 1, NOW()),
('Capucch-ina', '8661411938', 'Chocolate', 857, 1, NOW()),
('Cafetería Tef', '5552223698', 'Jalisco', 666, 1, NOW()),
('Tefiteria', '2225558877', 'Queretaro', 77, 1, NOW()),
('Love-love cafetería', '4476692135', 'Bugambilias', 2563, 1, NOW()),
('SOLO VEN', '3667894521', 'Rosita', 4, 1, NOW()),
('No sé', '6995871436', 'Hola', 85, 1, NOW());

INSERT INTO Proveedor(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idAsentamiento, idTipoProveedor, idUsuarioCrea, fechaCrea)
VALUES ('Elias', 'Juarez', 'Ibarra', 'IBJE001263LS5', '6993641253', 'ibarrasinbarra@empresi.com', 8, 5, 1, NOW()),
('Felipe', 'Lopez', 'Alvarado', 'ALLF550396PO5', '8661254789', 'alvalopiz@hotmail.com', 985, 4, 1, NOW()),
('Cesar', 'Flores', 'Hipolito', 'HOFC140325SD7', '7441253698', 'hipocloroso@hipo.com.mx', 745, 5, 1, NOW()),
('Javier', 'Galindo', 'Guizopt', 'GUGJ001225WW5', '6665554441', 'gagaga@nose.com', 999, 6, 1, NOW()),
('Carlos', 'Gonzalez', 'Herrera', 'HEGO001231SJ8', '4412368547', 'herregonzo@hotmail.com', 748, 8, 1, NOW()),
('Benito', 'Camelo', 'Kchistoso', 'KCCB742236LK8', '6633221144', 'holacomo@estas.com.mx', 5111, 9, 1, NOW()),
('Juan', 'Bodoque', 'Gutierrez', 'GUBJ991122SD9', '5559991111', 'bodoquito@outlook.com', 963, 7, 1, NOW()),
('Homero', 'Simpson', 'Jefferson', 'JESH142536DC4', '4444455555', 'jeffsimhom@koko.com', 741, 6, 1, NOW()),
('Florencia', 'Rosales', 'Margarita', 'MARF225698LO4', '8661411938', 'flores@flores.com', 1593, 9, 1, NOW()),
('Juanita', 'Espinoza', 'Paz', 'PAEJ001111LK1', '4466882255', 'espipaz@jusete.com', 5000, 4, 1, NOW());

INSERT INTO Compra(referencia, fecha, precio, idUsuarioCrea, fechaCrea, idProveedor)
VALUES ('11111A', '2005-05-02 18:12:45', 1052, 1, NOW(), 8),
('11112A', '2005-05-02 19:35:58', 8965.66, 1, NOW(), 5),
('11113A', '2005-05-03 10:22:02', 7458.41, 1, NOW(), 7),
('11114A', '2005-05-03 13:48:11', 4589.22, 1, NOW(), 2),
('11115A', '2005-05-03 15:05:55', 415.70, 1, NOW(), 1),
('11116A', '2005-05-04 12:35:12', 748.88, 1, NOW(), 3),
('11117A', '2005-05-05 18:27:29', 2518.27, 1, NOW(), 4),
('11118A', '2005-05-06 14:47:23', 2563.11, 1, NOW(), 6),
('11119A', '2005-05-06 20:55:17', 7859.65, 1, NOW(), 10),
('11110A', '2005-05-06 22:14:21', 125.87, 1, NOW(), 9);

INSERT INTO Material(nombre, descripcion, precio, cantidad, idCompra, idUsuarioCrea, fechaCrea, idAlmacen)
VALUES ('Material 1A', 'Descripcion 1A', 459, 10, 5, 1, NOW(), 10),
('Material 2A', 'Descripcion 2A', 666, 4, 2, 1, NOW(), 2),
('Material 3A', 'Descripcion 3A', 475, 4, 5, 1, NOW(), 1),
('Material 4A', 'Descripcion 4A', 4966, 3, 4, 1, NOW(), 7),
('Material 5A', 'Descripcion 5A', 454, 4, 9, 1, NOW(), 8),
('Material 6A', 'Descripción 6A', 745.4, 10, 5, 1, NOW(), 5),
('Material 7A', 'Descripcion 7A', 496.55, 7, 2, 1, NOW(), 9),
('Material 8A', 'Descripcion 4A', 744.44, 4, 4, 1, NOW(), 10),
('Material 9A', 'Descripcion 9A', 799.55, 7, 6, 1, NOW(), 4),
('Material 10A', 'Descripcion 10A', 5499.99, 7, 4, 1, NOW(), 8);

INSERT INTO Platillo(nombre, descripcion, costo, idTipoPlatillo, idUsuarioCrea, fechaCrea)
VALUES ('Café americano', 'Café al estilo americano', 55.5, 10 , 1, NOW()),
('Piña colada', 'Bebida con piña y coco', 99.5, 1 , 1, NOW()),
('Pay de queso', 'Pay hecho de queso', 152.74, 3 , 1, NOW()),
('Frappe oreo', 'Café frío sabor oreo', 98.77, 5 , 1, NOW()),
('Hamburguesa', 'Pequeña con papas y refresco', 100, 8 , 1, NOW()),
('Donas Kakyoin', 'Donas con relleno de cereza', 30.22, 9 , 1, NOW()),
('Papas con queso', 'Se le puede añadir tocino', 57.66, 8 , 1, NOW()),
('Panini de queso', 'Con jamón, tomate y lechuga', 78.12, 5 , 1, NOW()),
('Frappe arcoiris', 'Frappe con varios colores', 185.2, 8 , 1, NOW()),
('Crepa', 'Puede ser de platano o fresas', 114.22, 4 , 1, NOW());

INSERT INTO Trabajador(nombre, apellidoMaterno, apellidoPaterno, rfc, fechaNacimiento, telefono, correo, fechaContrata, idPuesto, idSucursal, idUsuarioCrea, fechaCrea)
VALUES ('Susana', 'Juarez', 'Buenrostro', 'BUJS001029ET0', '2000-10-29', '8661411938', 'susanajb@coffeeshope.com', '2005-10-21', 5, 5, 1, NOW()),
('Jimena', 'Galindo', 'Gonzalez', 'GOGJ941225PT0', '1994-12-25', '8441425898', 'jimenita@coffeeshope.com', '2005-10-21', 7, 7, 1, NOW()),
('Pablo', 'Lozano', 'Lozano', 'LOLP750101SD0', '1975-01-01', '7445551236', 'pablito@coffeeshope.com', '2005-10-23', 2, 2, 1, NOW()),
('Lorena', 'Casas', 'Martinez', 'MACL850523SD9', '1985-05-23', '5661479632', 'lorena@coffeeshope.com', '2005-10-24', 8, 8, 1, NOW()),
('Gloria', 'Leon', 'Jaramillo', 'JALG800923PP1', '1980-09-23', '8994785210', 'glorita@coffeeshope.com', '2005-10-24', 4, 4, 1, NOW()),
('Julieta', 'Venegas', 'Estrada', 'ESVJ700421KD1', '1970-04-21', '8441253674', 'julimegas@coffeeshope.com', '2005-10-24', 7, 7, 1, NOW()),
('Veronica', 'Costello', 'Esponiza', 'ESCV850124AS9', '1985-01-24', '8997412586', 'verostello@coffeeshope.com', '2005-10-28', 9, 9, 1, NOW()),
('Carlos', 'Guerrero', 'Gomez', 'GOGC840712LK8', '1984-07-12', '8445521236', 'carlito@coffeeshope.com', '2005-10-28', 10, 10, 1, NOW()),
('Roberto', 'Valdez', 'Jaramillo', 'JAVR851128MN0', '1985-11-28', '7445698541', 'bertito@coffeeshope.com', '2005-10-29', 5, 5, 1, NOW()),
('Carolina', 'Herrera', 'Moreno', 'MOHC910504AS4', '1991-05-04', '8771423658', 'caroherre@coffeeshope.com', '2005-10-29', 4, 4, 1, NOW());

INSERT INTO Asistencia(fecha, horaLlegada, horaSalida, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('2005-12-01', '06:55', '14:59', 8 ,1, NOW()),
('2005-12-01', '06:56', '14:20', 7 ,1, NOW()),
('2005-12-01', '07:00', '14:55', 9 ,1, NOW()),
('2005-12-01', '07:01', '15:00', 5 ,1, NOW()),
('2005-12-01', '07:01', '15:05', 4 ,1, NOW()),
('2005-12-01', '07:01', '14:25', 3 ,1, NOW()),
('2005-12-01', '06:32', '19:21', 1 ,1, NOW()),
('2005-12-01', '06:45', '14:45', 10 ,1, NOW()),
('2005-12-01', '06:59', '18:32', 2 ,1, NOW()),
('2005-12-02', '07:05', '14:00', 6 ,1, NOW());

INSERT INTO Vehiculo(numero, descripcion, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('AE-85', 'Motocicleta', 7, 1, NOW()),
('AE-86', 'Autobus', 4, 1, NOW()),
('AE-87', 'Carrito', 1, 1, NOW()),
('AE-88', 'Furgoneta', 2, 1, NOW()),
('AE-89', 'Bicicleta', 3, 1, NOW()),
('AE-90', 'Avión de AMLO',5, 1, NOW()),
('AE-91', 'Tanque militar',6, 1, NOW()),
('AE-92', 'Carroza',8, 1, NOW()),
('AE-93', 'Tricilo',9, 1, NOW()),
('AE-94', 'Monociclo',10, 1, NOW());

INSERT INTO CorteVenta(venta, caja, fecha, gasto, tarjeta, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES (8956.25, 'A 185', '2005-02-02', 85.25, 155.2, 4, 1, NOW()),
(9784.25, 'A 186', '2005-02-02', 74.66, 985.2, 9, 1, NOW()),
(3256.88, 'A 187', '2005-02-02', 452, 88, 10, 1, NOW()),
(1250, 'A 188', '2005-02-02', 111, 748, 7, 1, NOW()),
(89652.25, 'S 174', '2005-02-02', 45.2, 87, 8, 1, NOW()),
(5896.22, 'A 185', '2005-02-03', 74.5, 785, 4, 1, NOW()),
(4785, 'A 186', '2005-02-03', 88.5, 995, 9, 1, NOW()),
(7498.65, 'A 187', '2005-02-03', 74.2, 99, 10, 1, NOW()),
(7485, 'A 188', '2005-02-03', 96.3, 78, 7, 1, NOW()),
(66520, 'S 174', '2005-02-03', 1528.88, 684, 8, 1, NOW());

INSERT INTO DevolucionCompra(articulo, razon, cantidad, costo, idCompra, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, NOW()),
('Ques ito', 'No citó', 850, 1250, 9, 1, NOW()),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, NOW()),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, NOW()),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, NOW()),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, NOW()),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, NOW()),
('Huevito frito', 'No cose', 5, 10523, 3, 1, NOW()),
('Piñita', 'Raspones', 254, 452, 8, 1, NOW()),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, NOW());

INSERT INTO Venta(referencia, fecha, precio, idSucursal, idCorteVenta, idUsuarioCrea, fechaCrea)
VALUES ('V 78', '2005-08-28', 879.52, 7, 7, 1, NOW()),
('V 79', '2005-08-28', 777, 8, 8, 1, NOW()),
('V 80', '2005-08-28', 541.20, 9, 9, 1, NOW()),
('V 81', '2005-08-28', 369, 4, 4, 1, NOW()),
('V 82', '2005-08-28', 895, 2, 2, 1, NOW()),
('V 83', '2005-08-29', 965, 5, 5, 1, NOW()),
('V 84', '2005-08-29', 7485, 4, 4, 1, NOW()),
('V 85', '2005-08-29', 456, 7, 7, 1, NOW()),
('V 86', '2005-08-29', 854, 10, 10, 1, NOW()),
('V 87', '2005-08-30', 123, 4, 4, 1, NOW());

INSERT INTO DevolucionVenta(platillo, razon, cantidad, costo, idVenta, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, NOW()),
('Ques ito', 'No citó', 850, 1250, 9, 1, NOW()),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, NOW()),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, NOW()),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, NOW()),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, NOW()),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, NOW()),
('Huevito frito', 'No cose', 5, 10523, 3, 1, NOW()),
('Piñita', 'Raspones', 254, 452, 8, 1, NOW()),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, NOW());

INSERT INTO DescuentoVenta(idDescuento, idVenta, idUsuarioCrea, fechaCrea)
VALUES (1,1, 1, NOW()),
(3, 3, 1, NOW()),
(5, 5, 1, NOW()),
(6, 6, 1, NOW()),
(7, 8, 1, NOW()),
(5, 1, 1, NOW()),
(8, 1, 1, NOW()),
(4, 1, 1, NOW()),
(5, 5, 1, NOW()),
(9, 1, 1, NOW());

INSERT INTO PlatilloMaterial(idPlatillo, idMaterial, cantidad, unidad, idUsuarioCrea, fechaCrea)
VALUES (1,1, 78.52, 'gramos', 1, NOW()),
(3, 3, 1827, 'gramos',1, NOW()),
(5, 5, 88, 'gramos',1, NOW()),
(6, 6, 47, 'gramos',1, NOW()),
(7, 8, 752, 'gramos',1, NOW()),
(5, 1, 962, 'gramos',1, NOW()),
(8, 1, 52, 'gramos',1, NOW()),
(4, 1, 777.52, 'gramos',1, NOW()),
(5, 5, 52.52, 'gramos',1, NOW()),
(9, 1, 98.2, 'gramos',1, NOW());

INSERT INTO PlatilloVenta(idPlatillo, idVenta, cantidad, idUsuarioCrea, fechaCrea)
VALUES (5,5,8 , 1, NOW()),
( 4, 4, 9, 1, NOW()),
( 2, 2, 1, 1, NOW()),
(7 ,5 ,8 , 1, NOW()),
(6, 8 , 2 , 1, NOW()),
(7 , 6 , 3 , 1, NOW()),
(4, 5, 8 , 1, NOW()),
(3, 2 ,1 , 1, NOW()),
(2, 2, 8 , 1, NOW()),
(8, 8, 5 , 1, NOW());
