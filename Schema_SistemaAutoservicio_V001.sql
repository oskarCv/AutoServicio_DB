-- 11-09-2015
-- Ver: 0.1
--

create schema Autoservicio;
use Autoservicio;

-- drop schema Autoservicio

create table UnidadMedida(
	IdUnidad	smallint		auto_increment,
    Tipo_Unidad	varchar(50)		not null,
    Decripcion	varchar(100)	not null,
    Cantidad	smallint		not null,
    
    primary key(IdUnidad)
);

create table Articulo(
	IdArticulo		integer			not null,
    Descripcion		varchar(100)	not null,
    Costo			decimal(8,2)	not null,
    Precio			decimal(8,2) 	not null,
    Maximos			smallint		not null,
    Minimos			smallint		not null,
    Existencia 		smallint		not null,
    IdUnidad		smallint		not null,
    
    primary key(IdArticulo),
    foreign key(IdUnidad)	references UnidadMedida(IdUnidad)
);

create table Proveedor(
	IdProveedor 	integer auto_increment,
    Nombre			varchar(50) 	not null,
    Telefeno		varchar(12)		not null,
    Direccion		varchar(50)		not null,
    Ciudad			varchar(50)		not null,
    Email			varchar(50)		not null,
    RFC				varchar(13)		not null,
    
    primary key(IdProveedor)
);

create table Roles(
	IdRol			integer auto_increment,
	Descripcion		varchar(100)	not null,
    primary key(IdRol)
);

create table Usuario(
	IdUsuario		integer			not null,
    Nombre			varchar(50)		not null,
    Direccion		varchar(50)		not null,
    Email			varchar(50)		not null,
    Telefono		varchar(12)		not null,
    
    primary key(IdUsuario)
);

create table Rol_Usuario(
	IdRol			integer			not null,
    IdUsuario		integer 		not null,
    Nota			varchar(100),
    
    primary key(IdRol,IdUsuario),
    foreign key(IdRol) references Roles(IdRol),
    foreign key(IdUsuario) references Usuario(IdUsuario)
);

create table Compra(
	IdCompra 		integer 		auto_increment,
    IdUsuario		integer 		not null,
    Fecha			datetime		not null,
    IdProveedor		integer			not null,
    IVA				decimal(8,2)	not null,
    
    primary key(IdCompra),
    foreign key(IdUsuario) references Usuario(IdUsuario),
    foreign key(IdProveedor) references Proveedor(IdProveedor)
);

create table Detalle_Compra(
	Folio			integer 		auto_increment,
    IdCompra		integer			not null,
    IdArticulo		integer			not null,
    Cantidad		smallint		not null,
    Precio			decimal(8,2)	not null,
    
    primary key(Folio,IdCompra),
    foreign key(IdCompra) references Compra(IdCompra),
    foreign key(IdArticulo) references Articulo(IdArticulo)
);

create table Venta(
	IdVenta			integer 		auto_increment,
    IdUsuario		integer 		not null,
    Fecha			datetime		not null,
    IVA				decimal(8,2)	not null,
    
    primary key(IdVenta),
    foreign key(IdUsuario) references Usuario(IdUsuario)
);

create table Detalle_Venta(
	Folio		integer 			auto_increment,
    IdVenta		integer 			not null,
    IdArticulo	integer				not null,
    Cantidad	smallint			not null,
    Precio		decimal(8,2)		not null,
    
    primary key(Folio, IdVenta),
    foreign key(IdVenta) references Venta(IdVenta),
    foreign key(IdArticulo) references Articulo(IdArticulo)
);