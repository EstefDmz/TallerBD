CREATE TABLE Almacen(
    idAlmacen serial primary key,
    numero varchar (10) not null,
    capacidad int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE Asentamiento(
    idAsentamiento serial primary key, 
    id int,
    nombre varchar (100) not null,
    codigoPostal char (5) not null,
    idTipoAsentamiento int not null,
    idMunicipio int not null,
    idEstado int not null,
    idZona int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);


CREATE TABLE Asistencia(
    idAsistencia serial primary key,
    fecha date not null, 
    horaLlegada time not null,
    horaSalida time not null,
    idTrabajador int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE Cliente(
    idCliente serial primary key,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoCliente int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Compra(
    idCompra serial primary key,
    referencia varchar (50) not null,
    fecha timestamp not null,
    precio decimal (10,2) not null,
    idProveedor int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE CorteVenta(
    idCorteVenta serial primary key,
    caja varchar (50) not null,
    fecha timestamp not null,
    venta decimal (10,2) not null,
    gasto decimal (10,2) not null,
    tarjeta decimal (10,2) not null,
    idTrabajador int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Descuento(
    idDescuento serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    porcentaje int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE DevolucionCompra(
    idDevolucionCompra serial primary key,
    platillo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int not null,
    costo decimal (10,2) not null,
    idCompra int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE DevolucionVenta(
    idDevolucionVenta serial primary key,
    platillo varchar (50) not null,
    razon varchar (50) not null,
    cantidad int not null,
    costo decimal (10,2) not null,
    idVenta int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Estado
(
    idEstado int UNIQUE,
    nombre varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Material(
    idMaterial serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    precio decimal (10,2) not null,
    cantidad int not null,
    idCompra int not null,
    idAlmacen int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Municipio(
    idMunicipio serial primary key,
    nombre varchar (50) not null,
    codigo int not null,
    idEstado int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Platillo (
    idPlatillo serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (100) not null,
    costo decimal (10,2) not null,
    idTipoPlatillo int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Proveedor(
    idProveedor serial primary key,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    rfc char (13) not null,
    telefono char (10) not null UNIQUE,
    correo varchar (50) not null UNIQUE,
    idTipoProveedor int not null,
    idAsentamiento int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Puesto(
    idPuesto serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Sucursal(
    idSucursal serial primary key,
    nombre varchar (50) not null,
    telefono char (10) not null,
    calle varchar (50) not null,
    idAsentamiento int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE TipoAsentamiento(
    idTipoAsentamiento int UNIQUE,
    nombre varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE TipoCliente(
    idTipoCliente serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE TipoPlatillo(
    idTipoPlatillo serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE TipoProveedor(
    idTipoProveedor serial primary key,
    nombre varchar (50) not null,
    descripcion varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Trabajador(
    idTrabajador serial primary key,
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
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Usuario(
    idUsuario serial primary key,
    nombre varchar (50) not null,
    apellidoMaterno varchar (50) not null,
    apellidoPaterno varchar (50) not null,
    correo varchar (50) not null UNIQUE,
    clave varbinary (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int null,
    fechaCrea timestamp null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Vehiculo(
    idVehiculo serial primary key,
    numero varchar (10) not null,
    descripcion varchar (50) not null,
    idTrabajador int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Venta(
    idVenta serial primary key,
    referencia varchar (50) not null UNIQUE,
    fecha timestamp not null,
    precio decimal (10,2) not null,
    idSucursal int null,
    idCliente int null,
    idCorteVenta int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null 
);

CREATE TABLE Zona(
    idZona serial primary key,
    nombre varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE DescuentoVenta(
    idDescuentoVenta serial primary key,
    idDescuento int not null,
    idVenta int not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE PlatilloMaterial(
    idPlatilloMaterial serial primary key,
    idPlatillo int not null,
    idMaterial int not null,
    cantidad decimal (10,2) not null,
    unidad varchar (50) not null,
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE PlatilloVenta(
    idPlatilloVenta serial primary key,
    idPlatillo int not null,
    idVenta int not null,
    cantidad int not null, 
    estatus int default 1 not null,
    idUsuarioCrea int not null,
    fechaCrea timestamp not null,
    idUsuarioModifica int default null,
    fechaModifica timestamp default null
);

CREATE TABLE CPdescarga(
    d_codigo varchar(50),
    d_asenta varchar (100),
    d_tipo_asenta varchar (50),
    D_mnpio varchar(50),
    d_estado varchar(50),
    d_ciudad varchar(50),
    d_CP varchar(50),
    c_estado varchar(50),
    c_oficina varchar(50),
    c_CP varchar(50),
    c_tipo_asenta varchar(50),
    c_mnpio varchar(50),
    id_asenta_cpcons varchar(50),
    d_zona varchar(50),
    c_cve_ciudad varchar(50)
);

------------- RELACIONES -------------------------

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

---------------------------- CREACION DE INDEX ----------------------------
CREATE INDEX IX_Almacen on Almacen(idAlmacen);

CREATE INDEX IX_Asentamiento on Asentamiento(idAsentamiento);

CREATE INDEX IX_Asistencia on Asistencia(idAsistencia);

CREATE INDEX IX_Cliente on Cliente(idCliente);

CREATE INDEX IX_Compra on Compra(idCompra);

CREATE INDEX IX_CorteVenta on CorteVenta(idCorteVenta);

CREATE INDEX IX_Descuento on Descuento(idDescuento);

CREATE INDEX IX_DevolucionCompra on DevolucionCompra(idDevolucionCompra);

CREATE INDEX IX_DevolucionVenta on DevolucionVenta(idDevolucionVenta);

CREATE INDEX IX_Estado on Estado(idEstado);

CREATE INDEX IX_Material on Material(idMaterial);

CREATE INDEX IX_Municipio on Municipio(idMunicipio);

CREATE INDEX IX_Platillo on Platillo(idPlatillo);

CREATE INDEX IX_Proveedor on Proveedor(idProveedor);

CREATE INDEX IX_Puesto on Puesto(idPuesto);

CREATE INDEX IX_Sucursal on Sucursal(idSucursal);

CREATE INDEX IX_TipoAsentamiento on TipoAsentamiento(idTipoAsentamiento);

CREATE INDEX IX_TipoCliente on TipoCliente(idTipoCliente);

CREATE INDEX IX_TipoPlatillo on TipoPlatillo(idTipoPlatillo);

CREATE INDEX IX_TipoProveedor on TipoProveedor(idTipoProveedor);

CREATE INDEX IX_Trabajador on Trabajador(idTrabajador);

CREATE INDEX IX_Usuario on Usuario(idUsuario);

CREATE INDEX IX_Vehiculo on Vehiculo(idVehiculo);

CREATE INDEX IX_Venta on Venta(idVenta);

CREATE INDEX IX_Zona on Zona(idZona);

CREATE INDEX IX_DescuentoVenta on DescuentoVenta(idDescuentoVenta);

CREATE INDEX IX_PlatilloMaterial on PlatilloMaterial(idPlatilloMaterial);

CREATE INDEX IX_PlatilloVenta on PlatilloVenta(idPlatilloVenta);


-------------------- POBLAR D: -----------------

INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave)
VALUES ('Estefanía', 'Rosales', 'Domínguez', 'aerd00@cafeteria.com', 'hola123');

INSERT INTO Usuario(nombre, apellidoMaterno, apellidoPaterno, correo, clave, idUsuarioCrea, fechaCrea)
VALUES('Flor', 'Domínguez', 'Andrade', 'fda01@cafeteria.com', 'hola123', 1, CURRENT_TIMESTAMP),
('Leonardo', 'Rosales', 'Domínguez', 'lrd0a@cafeteria.com', 'hola123', 1, CURRENT_TIMESTAMP),
('Susana', 'Rodriguez', 'Buenavista', 'srb0b@cafeteria.com', 'hola123', 1, CURRENT_TIMESTAMP),
('Gian', 'Recio', 'Milanés', 'grm0c@cafeteria.com', 'hola123', 1, CURRENT_TIMESTAMP),
('Ney', 'Gonzalez', 'Perla', 'ngp0d@algodocito.com', 'hola123', 1, CURRENT_TIMESTAMP),
('Lorena', 'Huacuja', 'Romero', 'lhr0e@cafeteria.com', 'hola123',1, CURRENT_TIMESTAMP),
('Angel', 'Rangel', 'Ortega', 'aro0f@cafeteria.com', 'hola123',1, CURRENT_TIMESTAMP),
('Cristofer', 'Gutierrez', 'LLungo', 'cgl0g@cafeteria.com', 'hola123',1, CURRENT_TIMESTAMP),
('Sofia', 'Lopez', 'Silva', 'sls0h@cafeteria .com', 'hola123',1, CURRENT_TIMESTAMP); 

INSERT INTO TipoCliente(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Frecuente', 'Realiza compras al menos una vez por semana', 1, CURRENT_TIMESTAMP),
('Mayorista', 'Sus compras normalmente son de más de 5 platillos', 1, CURRENT_TIMESTAMP),
('Minorista', 'Sus compras normalmente son menos de 5 platillos', 1, CURRENT_TIMESTAMP),
('Ocasional', 'Realiza compras una o dos veces al mes', 1, CURRENT_TIMESTAMP),
('Nuevo', 'No han realizado su primera compra', 1, CURRENT_TIMESTAMP),
('Por temporada', 'Compra siempre que haya rebajas de temporada', 1, CURRENT_TIMESTAMP),
('Leal', 'Prefiere nuestros platillos', 1, CURRENT_TIMESTAMP),
('Invitado', 'Se le ha hecho una invitación a comprar', 1, CURRENT_TIMESTAMP),
('TipoCliente00', 'No existe', 1, CURRENT_TIMESTAMP),
('TipoCliente01', 'HOla', 1, CURRENT_TIMESTAMP);

INSERT INTO TipoProveedor(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('De producto', 'Proporcionan un artículo o producto', 1, CURRENT_TIMESTAMP),
('De servicios', 'Distribuyen los servicios', 1, CURRENT_TIMESTAMP),
('De recursos', 'Satisfacen necesidades económicas', 1, CURRENT_TIMESTAMP),
('Confiable', 'Son prioritarios para la empresa', 1, CURRENT_TIMESTAMP),
('Específicos', 'Abastecen productos con propiedades especiales', 1, CURRENT_TIMESTAMP),
('Tipo A', 'Riesgo asociado elevado', 1, CURRENT_TIMESTAMP),
('Tipo B', 'Riesgo asociado medio', 1, CURRENT_TIMESTAMP),
('Tipo C', 'Riesto asociado bajo', 1, CURRENT_TIMESTAMP),
('Fabricantes', 'Fabrican su propio producto o servicio', 1, CURRENT_TIMESTAMP),
('Proveedor01', 'Descripción01', 1, CURRENT_TIMESTAMP);

INSERT INTO TipoPlatillo(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Bebida APT', 'Bebidas sin alcohol' ,1, CURRENT_TIMESTAMP),
('Bebida Plus', 'Bebidas con alcohol' ,1, CURRENT_TIMESTAMP),
('Postre SG', 'Postres que no tienen gluten' ,1, CURRENT_TIMESTAMP),
('Comida', 'Plato fuerte' ,1, CURRENT_TIMESTAMP),
('Entrada', 'Aperitivo' ,1, CURRENT_TIMESTAMP),
('Desayuno', 'Comida de 8 am a 11 am' ,1, CURRENT_TIMESTAMP),
('Cena', 'Comida de 6 pm a 11 pm' ,1, CURRENT_TIMESTAMP),
('Niño', 'Comida para niños menores de 12 años' ,1, CURRENT_TIMESTAMP),
('Frio', 'Bebidas con hielo o estilo frappe',1, CURRENT_TIMESTAMP),
('Caliente', 'Bebidas calientes' ,1, CURRENT_TIMESTAMP);

INSERT INTO Almacen(numero, capacidad, idUsuarioCrea, fechaCrea)
VALUES ('A-1827', 2500, 1, CURRENT_TIMESTAMP),
('A-1828', 3800, 1, CURRENT_TIMESTAMP),
('A-1829', 4500, 1, CURRENT_TIMESTAMP),
('A-1830', 1800, 1, CURRENT_TIMESTAMP),
('A-1831', 1100, 1, CURRENT_TIMESTAMP),
('A-1832', 1000, 1, CURRENT_TIMESTAMP),
('A-1833', 4300, 1, CURRENT_TIMESTAMP),
('A-1834', 2200, 1, CURRENT_TIMESTAMP),
('A-1835', 1100, 1, CURRENT_TIMESTAMP),
('A-1836', 2300, 1, CURRENT_TIMESTAMP);

INSERT INTO Cliente(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idTipoCliente, idUsuarioCrea, fechaCrea)
VALUES ('Hector', 'Mora', 'Rodriguez', 'ROMH001254TRE', '1234567890', 'morita@hotmail.com', 4, 1, CURRENT_TIMESTAMP),
('Pelayo', 'Santiago', 'De la Cruz', 'DESP125748PL5', '4552698713', 'pelayo@outloo.com', 8, 1, CURRENT_TIMESTAMP),
('Jon', 'Vera', 'Niego', 'NIVJ789625LO2', '5668963214', 'veraniego@gmail.com', 5, 1, CURRENT_TIMESTAMP),
('Malika', 'Mira', 'Vaesta', 'VAMM452013PL8', '5779681235', 'likavaesta@hotmail.com', 4, 1, CURRENT_TIMESTAMP),
('Aquilino', 'Alvaro', 'Rosales', 'ROAA458963AS5', '9874520231', 'alvalino@yahoo.com.mx', 7, 1, CURRENT_TIMESTAMP),
('Teofilo', 'Gordo', 'Juarez', 'JUGT789654NJ5', '7412369851', 'gordito@hotmail.com', 9, 1, CURRENT_TIMESTAMP),
('Mireya', 'Ares', 'Spotify', 'SPAM569874LK1', '1233699874', 'aressinvirus@gmail.com', 2, 1, CURRENT_TIMESTAMP),
('Arturo', 'Janire', 'Pelaez', 'PEJA021125HU8', '9517382640', 'pelaezraro@hotmail.es', 4, 1, CURRENT_TIMESTAMP),
('Elisabet', 'Jimenez', 'Martinez', 'MAJE121212NJ8', '8661234567', 'martijimeeli@yahoo.com.mx', 3, 1, CURRENT_TIMESTAMP),
('Ariana', 'Castaño', 'Rubio', 'RUCA980525LO1', '5554446669', 'rucar@hotmail.es', 7, 1, CURRENT_TIMESTAMP);

INSERT INTO Descuento(nombre, descripcion, porcentaje, idUsuarioCrea, fechaCrea)
VALUES ('Nuevo', 'Descuento para cuentas nuevas', 15, 1, CURRENT_TIMESTAMP),
('Compra 10', 'Por cada 15 platillos pedidos', 30, 1, CURRENT_TIMESTAMP),
('Mayor de 5', 'Compra de más de 5 platillos', 10, 1, CURRENT_TIMESTAMP),
('Aniversario', 'Un año siendo cliente', 45, 1, CURRENT_TIMESTAMP),
('Mayoreo', 'Después del platillo no. 30', 15, 1, CURRENT_TIMESTAMP),
('Codigo anuncio', 'Usa codigo de anuncios', 20, 1, CURRENT_TIMESTAMP),
('Cupón', 'Presenta cupón recortado', 30, 1, CURRENT_TIMESTAMP),
('Fidelidad', 'Viene a comer cada semana', 20, 1, CURRENT_TIMESTAMP),
('Recomienda', 'Han llegado clientes por su recomendación', 15, 1, CURRENT_TIMESTAMP),
('Aleatorio', 'No tiener razón de ser', 10, 1, CURRENT_TIMESTAMP);

INSERT INTO Puesto(nombre, descripcion, idUsuarioCrea, fechaCrea)
VALUES ('Contador', 'Hace la contabilidad', 1, CURRENT_TIMESTAMP),
('Psicologo', 'Para recursos humanos', 1, CURRENT_TIMESTAMP),
('Tec. Sistemas', 'Da mantenimiento', 1, CURRENT_TIMESTAMP),
('Mesero', 'Atiende a los clientes', 1, CURRENT_TIMESTAMP),
('Cajero', 'Encargado de ventas', 1, CURRENT_TIMESTAMP),
('Repartidor', 'Entrega pedidos a domicilio', 1, CURRENT_TIMESTAMP),
('Conserje', 'Hace la limpieza del lugar', 1, CURRENT_TIMESTAMP),
('Gerente', 'Procura que todo este en orden', 1, CURRENT_TIMESTAMP),
('Capturista', 'Captura compras o ventas', 1, CURRENT_TIMESTAMP),
('Propietario', 'Dueño de la sucursal', 1, CURRENT_TIMESTAMP);

---------------- DATOS DE CPdescarga -----------------------

insert into Zona(nombre, idUsuarioCrea, fechaCrea) select distinct d_zona, 1, CURRENT_TIMESTAMP from CPdescarga;

insert into Estado(idEstado, nombre, idUsuarioCrea, fechaCrea) select distinct CAST (c_estado as integer), d_estado, 1, CURRENT_TIMESTAMP from CPdescarga;

insert into TipoAsentamiento(idTipoAsentamiento, nombre, idUsuarioCrea, fechaCrea) select distinct CAST (c_tipo_asenta as integer), d_tipo_asenta, 1, CURRENT_TIMESTAMP from CPdescarga;

insert into Municipio(nombre, idEstado, codigo, idUsuarioCrea, fechaCrea) select distinct D_mnpio, CAST (c_estado as integer),  CAST (c_mnpio as integer), 1, CURRENT_TIMESTAMP from CPdescarga;

insert into Asentamiento(nombre, codigoPostal, idTipoAsentamiento, idMunicipio, idZona, idEstado, id, idUsuarioCrea, fechaCrea) 
select d_asenta, d_codigo, CAST (c_tipo_asenta as integer), CAST (c_mnpio as integer), 1, CAST (c_estado as integer), CAST (id_asenta_cpcons as integer), 1, CURRENT_TIMESTAMP from CPdescarga;

update Asentamiento set idzona = (select idzona from zona where nombre =
(select d_zona from CPdescarga, asentamiento where c_mnpio = CAST (Asentamiento.idmunicipio as varchar) and
c_estado = CAST (Asentamiento.idestado as varchar) and d_codigo = Asentamiento.codigopostal and d_asenta = Asentamiento.nombre
and id_asenta_cpcons = CAST (Asentamiento.id as varchar)));

----------------------------------------------------------

INSERT INTO Sucursal(nombre, telefono, calle, idAsentamiento, idUsuarioCrea, fechaCrea)
VALUES ('Angiteria', '8771452598', 'Algodón', 5, 1, CURRENT_TIMESTAMP),
('Esquina del café', '7442563968', 'Lanita', 152, 1, CURRENT_TIMESTAMP),
('Cafe gourmet', '1428749632', 'Esponjosa', 888, 1, CURRENT_TIMESTAMP),
('Cafesioso', '8889997777', 'Lana', 52, 1, CURRENT_TIMESTAMP),
('Capucch-ina', '8661411938', 'Chocolate', 857, 1, CURRENT_TIMESTAMP),
('Cafetería Tef', '5552223698', 'Jalisco', 666, 1, CURRENT_TIMESTAMP),
('Tefiteria', '2225558877', 'Queretaro', 77, 1, CURRENT_TIMESTAMP),
('Love-love cafetería', '4476692135', 'Bugambilias', 2563, 1, CURRENT_TIMESTAMP),
('SOLO VEN', '3667894521', 'Rosita', 4, 1, CURRENT_TIMESTAMP),
('No sé', '6995871436', 'Hola', 85, 1, CURRENT_TIMESTAMP);

INSERT INTO Proveedor(nombre, apellidoMaterno, apellidoPaterno, rfc, telefono, correo, idAsentamiento, idTipoProveedor, idUsuarioCrea, fechaCrea)
VALUES ('Elias', 'Juarez', 'Ibarra', 'IBJE001263LS5', '6993641253', 'ibarrasinbarra@empresi.com', 8, 5, 1, CURRENT_TIMESTAMP),
('Felipe', 'Lopez', 'Alvarado', 'ALLF550396PO5', '8661254789', 'alvalopiz@hotmail.com', 985, 4, 1, CURRENT_TIMESTAMP),
('Cesar', 'Flores', 'Hipolito', 'HOFC140325SD7', '7441253698', 'hipocloroso@hipo.com.mx', 745, 5, 1, CURRENT_TIMESTAMP),
('Javier', 'Galindo', 'Guizopt', 'GUGJ001225WW5', '6665554441', 'gagaga@nose.com', 9999, 6, 1, CURRENT_TIMESTAMP),
('Carlos', 'Gonzalez', 'Herrera', 'HEGO001231SJ8', '4412368547', 'herregonzo@hotmail.com', 7485, 8, 1, CURRENT_TIMESTAMP),
('Benito', 'Camelo', 'Kchistoso', 'KCCB742236LK8', '6633221144', 'holacomo@estas.com.mx', 55555, 9, 1, CURRENT_TIMESTAMP),
('Juan', 'Bodoque', 'Gutierrez', 'GUBJ991122SD9', '5559991111', 'bodoquito@outlook.com', 96325, 7, 1, CURRENT_TIMESTAMP),
('Homero', 'Simpson', 'Jefferson', 'JESH142536DC4', '4444455555', 'jeffsimhom@koko.com', 74185, 6, 1, CURRENT_TIMESTAMP),
('Florencia', 'Rosales', 'Margarita', 'MARF225698LO4', '8661411938', 'flores@flores.com', 15935, 9, 1, CURRENT_TIMESTAMP),
('Juanita', 'Espinoza', 'Paz', 'PAEJ001111LK1', '4466882255', 'espipaz@jusete.com', 5420, 4, 1, CURRENT_TIMESTAMP);

INSERT INTO Compra(referencia, fecha, precio, idUsuarioCrea, fechaCrea, idProveedor)
VALUES ('11111A', '2005-05-02 18:12:45', 1052, 1, CURRENT_TIMESTAMP, 8),
('11112A', '2005-05-02 19:35:58', 8965.66, 1, CURRENT_TIMESTAMP, 5),
('11113A', '2005-05-03 10:22:02', 7458.41, 1, CURRENT_TIMESTAMP, 7),
('11114A', '2005-05-03 13:48:11', 4589.22, 1, CURRENT_TIMESTAMP, 2),
('11115A', '2005-05-03 15:05:55', 415.70, 1, CURRENT_TIMESTAMP, 1),
('11116A', '2005-05-04 12:35:12', 748.88, 1, CURRENT_TIMESTAMP, 3),
('11117A', '2005-05-05 18:27:29', 2518.27, 1, CURRENT_TIMESTAMP, 4),
('11118A', '2005-05-06 14:47:23', 2563.11, 1, CURRENT_TIMESTAMP, 6),
('11119A', '2005-05-06 20:55:17', 7859.65, 1, CURRENT_TIMESTAMP, 10),
('11110A', '2005-05-06 22:14:21', 125.87, 1, CURRENT_TIMESTAMP, 9);

INSERT INTO Material(nombre, descripcion, precio, cantidad, idCompra, idUsuarioCrea, fechaCrea, idAlmacen)
VALUES ('Material 1A', 'Descripcion 1A', 459, 10, 5, 1, CURRENT_TIMESTAMP, 10),
('Material 2A', 'Descripcion 2A', 666, 4, 2, 1, CURRENT_TIMESTAMP, 2),
('Material 3A', 'Descripcion 3A', 475, 4, 5, 1, CURRENT_TIMESTAMP, 1),
('Material 4A', 'Descripcion 4A', 4966, 3, 4, 1, CURRENT_TIMESTAMP, 7),
('Material 5A', 'Descripcion 5A', 454, 4, 9, 1, CURRENT_TIMESTAMP, 8),
('Material 6A', 'Descripción 6A', 745.4, 10, 5, 1, CURRENT_TIMESTAMP, 5),
('Material 7A', 'Descripcion 7A', 496.55, 7, 2, 1, CURRENT_TIMESTAMP, 9),
('Material 8A', 'Descripcion 4A', 744.44, 4, 4, 1, CURRENT_TIMESTAMP, 10),
('Material 9A', 'Descripcion 9A', 799.55, 7, 6, 1, CURRENT_TIMESTAMP, 4),
('Material 10A', 'Descripcion 10A', 5499.99, 7, 4, 1, CURRENT_TIMESTAMP, 8);

INSERT INTO Platillo(nombre, descripcion, costo, idTipoPlatillo, idUsuarioCrea, fechaCrea)
VALUES ('Café americano', 'Café al estilo americano', 55.5, 10 , 1, CURRENT_TIMESTAMP),
('Piña colada', 'Bebida con piña y coco', 99.5, 1 , 1, CURRENT_TIMESTAMP),
('Pay de queso', 'Pay hecho de queso', 152.74, 3 , 1, CURRENT_TIMESTAMP),
('Frappe oreo', 'Café frío sabor oreo', 98.77, 5 , 1, CURRENT_TIMESTAMP),
('Hamburguesa', 'Pequeña con papas y refresco', 100, 8 , 1, CURRENT_TIMESTAMP),
('Donas Kakyoin', 'Donas con relleno de cereza', 30.22, 9 , 1, CURRENT_TIMESTAMP),
('Papas con queso', 'Se le puede añadir tocino', 57.66, 8 , 1, CURRENT_TIMESTAMP),
('Panini de queso', 'Con jamón, tomate y lechuga', 78.12, 5 , 1, CURRENT_TIMESTAMP),
('Frappe arcoiris', 'Frappe con varios colores', 185.2, 8 , 1, CURRENT_TIMESTAMP),
('Crepa', 'Puede ser de platano o fresas', 114.22, 4 , 1, CURRENT_TIMESTAMP);

INSERT INTO Trabajador(nombre, apellidoMaterno, apellidoPaterno, rfc, fechaNacimiento, telefono, correo, fechaContrata, idPuesto, idSucursal, idUsuarioCrea, fechaCrea)
VALUES ('Susana', 'Juarez', 'Buenrostro', 'BUJS001029ET0', '2000-10-29', '8661411938', 'susanajb@coffeeshope.com', '2005-10-21', 5, 5, 1, CURRENT_TIMESTAMP),
('Jimena', 'Galindo', 'Gonzalez', 'GOGJ941225PT0', '1994-12-25', '8441425898', 'jimenita@coffeeshope.com', '2005-10-21', 7, 7, 1, CURRENT_TIMESTAMP),
('Pablo', 'Lozano', 'Lozano', 'LOLP750101SD0', '1975-01-01', '7445551236', 'pablito@coffeeshope.com', '2005-10-23', 2, 2, 1, CURRENT_TIMESTAMP),
('Lorena', 'Casas', 'Martinez', 'MACL850523SD9', '1985-05-23', '5661479632', 'lorena@coffeeshope.com', '2005-10-24', 8, 8, 1, CURRENT_TIMESTAMP),
('Gloria', 'Leon', 'Jaramillo', 'JALG800923PP1', '1980-09-23', '8994785210', 'glorita@coffeeshope.com', '2005-10-24', 4, 4, 1, CURRENT_TIMESTAMP),
('Julieta', 'Venegas', 'Estrada', 'ESVJ700421KD1', '1970-04-21', '8441253674', 'julimegas@coffeeshope.com', '2005-10-24', 7, 7, 1, CURRENT_TIMESTAMP),
('Veronica', 'Costello', 'Esponiza', 'ESCV850124AS9', '1985-01-24', '8997412586', 'verostello@coffeeshope.com', '2005-10-28', 9, 9, 1, CURRENT_TIMESTAMP),
('Carlos', 'Guerrero', 'Gomez', 'GOGC840712LK8', '1984-07-12', '8445521236', 'carlito@coffeeshope.com', '2005-10-28', 10, 10, 1, CURRENT_TIMESTAMP),
('Roberto', 'Valdez', 'Jaramillo', 'JAVR851128MN0', '1985-11-28', '7445698541', 'bertito@coffeeshope.com', '2005-10-29', 5, 5, 1, CURRENT_TIMESTAMP),
('Carolina', 'Herrera', 'Moreno', 'MOHC910504AS4', '1991-05-04', '8771423658', 'caroherre@coffeeshope.com', '2005-10-29', 4, 4, 1, CURRENT_TIMESTAMP);

INSERT INTO Asistencia(fecha, horaLlegada, horaSalida, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('2005-12-01', '06:55', '14:59', 8 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '06:56', '14:20', 7 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '07:00', '14:55', 9 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '07:01', '15:00', 5 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '07:01', '15:05', 4 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '07:01', '14:25', 3 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '06:32', '19:21', 1 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '06:45', '14:45', 10 ,1, CURRENT_TIMESTAMP),
('2005-12-01', '06:59', '18:32', 2 ,1, CURRENT_TIMESTAMP),
('2005-12-02', '07:05', '14:00', 6 ,1, CURRENT_TIMESTAMP);

INSERT INTO Vehiculo(numero, descripcion, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES ('AE-85', 'Motocicleta', 7, 1, CURRENT_TIMESTAMP),
('AE-86', 'Autobus', 4, 1, CURRENT_TIMESTAMP),
('AE-87', 'Carrito', 1, 1, CURRENT_TIMESTAMP),
('AE-88', 'Furgoneta', 2, 1, CURRENT_TIMESTAMP),
('AE-89', 'Bicicleta', 3, 1, CURRENT_TIMESTAMP),
('AE-90', 'Avión de AMLO',5, 1, CURRENT_TIMESTAMP),
('AE-91', 'Tanque militar',6, 1, CURRENT_TIMESTAMP),
('AE-92', 'Carroza',8, 1, CURRENT_TIMESTAMP),
('AE-93', 'Tricilo',9, 1, CURRENT_TIMESTAMP),
('AE-94', 'Monociclo',10, 1, CURRENT_TIMESTAMP);

INSERT INTO CorteVenta(venta, caja, fecha, gasto, tarjeta, idTrabajador, idUsuarioCrea, fechaCrea)
VALUES (8956.25, 'A 185', '2005-02-02', 85.25, 155.2, 4, 1, CURRENT_TIMESTAMP),
(9784.25, 'A 186', '2005-02-02', 74.66, 985.2, 9, 1, CURRENT_TIMESTAMP),
(3256.88, 'A 187', '2005-02-02', 452, 88, 10, 1, CURRENT_TIMESTAMP),
(1250, 'A 188', '2005-02-02', 111, 748, 7, 1, CURRENT_TIMESTAMP),
(89652.25, 'S 174', '2005-02-02', 45.2, 87, 8, 1, CURRENT_TIMESTAMP),
(5896.22, 'A 185', '2005-02-03', 74.5, 785, 4, 1, CURRENT_TIMESTAMP),
(4785, 'A 186', '2005-02-03', 88.5, 995, 9, 1, CURRENT_TIMESTAMP),
(7498.65, 'A 187', '2005-02-03', 74.2, 99, 10, 1, CURRENT_TIMESTAMP),
(7485, 'A 188', '2005-02-03', 96.3, 78, 7, 1, CURRENT_TIMESTAMP),
(66520, 'S 174', '2005-02-03', 1528.88, 684, 8, 1, CURRENT_TIMESTAMP);

INSERT INTO DevolucionCompra(platillo, razon, cantidad, costo, idCompra, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, CURRENT_TIMESTAMP),
('Ques ito', 'No citó', 850, 1250, 9, 1, CURRENT_TIMESTAMP),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, CURRENT_TIMESTAMP),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, CURRENT_TIMESTAMP),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, CURRENT_TIMESTAMP),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, CURRENT_TIMESTAMP),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, CURRENT_TIMESTAMP),
('Huevito frito', 'No cose', 5, 10523, 3, 1, CURRENT_TIMESTAMP),
('Piñita', 'Raspones', 254, 452, 8, 1, CURRENT_TIMESTAMP),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, CURRENT_TIMESTAMP);

INSERT INTO Venta(referencia, fecha, precio, idSucursal, idCorteVenta, idUsuarioCrea, fechaCrea)
VALUES ('V 78', '2005-08-28', 879.52, 7, 7, 1, CURRENT_TIMESTAMP),
('V 79', '2005-08-28', 777, 8, 8, 1, CURRENT_TIMESTAMP),
('V 80', '2005-08-28', 541.20, 9, 9, 1, CURRENT_TIMESTAMP),
('V 81', '2005-08-28', 369, 4, 4, 1, CURRENT_TIMESTAMP),
('V 82', '2005-08-28', 895, 2, 2, 1, CURRENT_TIMESTAMP),
('V 83', '2005-08-29', 965, 5, 5, 1, CURRENT_TIMESTAMP),
('V 84', '2005-08-29', 7485, 4, 4, 1, CURRENT_TIMESTAMP),
('V 85', '2005-08-29', 456, 7, 7, 1, CURRENT_TIMESTAMP),
('V 86', '2005-08-29', 854, 10, 10, 1, CURRENT_TIMESTAMP),
('V 87', '2005-08-30', 123, 4, 4, 1, CURRENT_TIMESTAMP);

INSERT INTO DevolucionVenta(platillo, razon, cantidad, costo, idVenta, idUsuarioCrea, fechaCrea)
VALUES ('Manzana poncho', 'No ponchó', 100, 152.2, 5, 1, CURRENT_TIMESTAMP),
('Ques ito', 'No citó', 850, 1250, 9, 1, CURRENT_TIMESTAMP),
('Zipper man', 'Pepsi man', 144, 952.2, 7, 1, CURRENT_TIMESTAMP),
('Fresas compré', 'No compró', 520, 9856.54, 3, 1, CURRENT_TIMESTAMP),
('Caca de elefante', 'Algo aquí', 70, 599, 8, 1, CURRENT_TIMESTAMP),
('Batidora', 'No enciende', 2, 9856.22, 5, 1, CURRENT_TIMESTAMP),
('Cacahuates', 'Defecto de fábrica', 10, 5996.20, 2, 1, CURRENT_TIMESTAMP),
('Huevito frito', 'No cose', 5, 10523, 3, 1, CURRENT_TIMESTAMP),
('Piñita', 'Raspones', 254, 452, 8, 1, CURRENT_TIMESTAMP),
('Milanesa de pollo', 'Era de res', 74, 2555, 9, 1, CURRENT_TIMESTAMP);

INSERT INTO DescuentoVenta(idDescuento, idVenta, idUsuarioCrea, fechaCrea)
VALUES (1,1, 1, CURRENT_TIMESTAMP),
(3, 3, 1, CURRENT_TIMESTAMP),
(5, 5, 1, CURRENT_TIMESTAMP),
(6, 6, 1, CURRENT_TIMESTAMP),
(7, 8, 1, CURRENT_TIMESTAMP),
(5, 1, 1, CURRENT_TIMESTAMP),
(8, 1, 1, CURRENT_TIMESTAMP),
(4, 1, 1, CURRENT_TIMESTAMP),
(5, 5, 1, CURRENT_TIMESTAMP),
(9, 1, 1, CURRENT_TIMESTAMP);

INSERT INTO PlatilloMaterial(idPlatillo, idMaterial, cantidad, unidad, idUsuarioCrea, fechaCrea)
VALUES (1,1, 78.52, 'gramos', 1, CURRENT_TIMESTAMP),
(3, 3, 1827, 'gramos',1, CURRENT_TIMESTAMP),
(5, 5, 88, 'gramos',1, CURRENT_TIMESTAMP),
(6, 6, 47, 'gramos',1, CURRENT_TIMESTAMP),
(7, 8, 752, 'gramos',1, CURRENT_TIMESTAMP),
(5, 1, 962, 'gramos',1, CURRENT_TIMESTAMP),
(8, 1, 52, 'gramos',1, CURRENT_TIMESTAMP),
(4, 1, 777.52, 'gramos',1, CURRENT_TIMESTAMP),
(5, 5, 52.52, 'gramos',1, CURRENT_TIMESTAMP),
(9, 1, 98.2, 'gramos',1, CURRENT_TIMESTAMP);

INSERT INTO PlatilloVenta(idPlatillo, idVenta, cantidad, idUsuarioCrea, fechaCrea)
VALUES (5,5,8 , 1, CURRENT_TIMESTAMP),
( 4, 4, 9, 1, CURRENT_TIMESTAMP),
( 2, 2, 1, 1, CURRENT_TIMESTAMP),
(7 ,5 ,8 , 1, CURRENT_TIMESTAMP),
(6, 8 , 2 , 1, CURRENT_TIMESTAMP),
(7 , 6 , 3 , 1, CURRENT_TIMESTAMP),
(4, 5, 8 , 1, CURRENT_TIMESTAMP),
(3, 2 ,1 , 1, CURRENT_TIMESTAMP),
(2, 2, 8 , 1, CURRENT_TIMESTAMP),
(8, 8, 5 , 1, CURRENT_TIMESTAMP);
