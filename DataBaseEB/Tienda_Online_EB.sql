Create database Tienda_Online_EB

use Tienda_Online_EB

 ---TABLAS GENERALES

Create table Estados(
	Id_Estado int primary key not  null,
	Estado nvarchar(20) not null
)

Insert into Estados values(0, 'Inactivo'), (1, 'Activo');
Select * from Estados

Create table Compañias_Telefonica(
	ID_Compañia int primary key not null,
	Nombre_Compañia nvarchar(100) not null,
	Short_Name nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Pais(
	ID_Pais char(5) primary key not null,
	Nombre_Pais nvarchar(20) not null,
	Codigo_Pais int not null,
	Codigo_Postal int not null,
	Ubicacion nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Departamento(
	ID_Depto int primary key not null,
	Departamento nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Pais char(5) foreign key (fk_Id_Pais) references Pais(ID_Pais) not null,
	CodDepto nvarchar(25) not null
)

Create table Municipio(
    ID_Mun int primary key not null,
	Municipio nvarchar(50) not null,
	Distrito nvarchar(50) null,
	fk_Id_Depto int foreign key (fk_Id_Depto) references Departamento(ID_Depto) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not  null,
	CodMun nvarchar(25) not null
)

Create table Barrio_Municipio(
	ID_Barrio int primary key not null,
	Nombre nvarchar(100) not null,
	fk_Id_Mun int foreign key(fk_Id_Mun) references Municipio(ID_Mun) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not  null
)

 ---CLIENTE
 
Create table Clientes(
	ID_Cliente int identity primary key not null,
	Nombre1_Cliente nvarchar(50) not null,
	Nombre2_Cliente nvarchar(50) null,
	Apellido1_Cliente nvarchar (50) not null,
	Apellido2_Cliente nvarchar (50) null,
	Genero_Cliente char(1) check(Genero_Cliente IN ('M', 'm','F', 'f')) not null,
	Fecha_registroCliente datetime default(getdate()) not null,
	Fecha_Nac date,
)

Create table Telefono_Cliente(
	ID_telefonoCliente int identity primary key not null,
	Telefono varchar(15) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Cliente int foreign key (fk_Id_Cliente) references Clientes(ID_Cliente) not null,
	fk_Id_Compañia int foreign key (fk_Id_Compañia) references Compañias_Telefonica(ID_Compañia) not null,
)

Create table Correo_Cliente(
	ID_correoCliente int identity primary key not null,
	Correo_Cliente nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Cliente int foreign key (fk_Id_Cliente) references Clientes(ID_Cliente) not null
)

Create table Direccion_Cliente(
	ID_Dir int identity primary key not null,
	Direccion nvarchar(250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Cliente int foreign key (fk_Id_Cliente) references Clientes(ID_Cliente) not null,
	fk_Id_Barrio int foreign key(fk_Id_Barrio) references Barrio_Municipio(ID_Barrio)
)

--- USUARIOS Y TIPOS DE USUARIOS

Create table Usuarios_Clientes(
	ID_Users int identity primary key not null,
	Users nvarchar(100) not null,
	Contraseña nvarchar(100) not null,
	fk_Id_Cliente int foreign key(fk_Id_Cliente) references Clientes(ID_Cliente) not null,
	Fecha_Registro datetime default(getdate()) not null
)


  ---EMPLEADO
Create table Empleado(
	ID_Empleado int identity primary key not null,
	Nombre1_Empleado nvarchar(20) not null,
	Nombre2_Empleado nvarchar(20) not null,
	Apellido1_Empleado nvarchar(20) not null,
	Apellido2_Empleado nvarchar(20) not null,
	No_INSS varchar (12) not null,
	No_Cedula nvarchar (20) not null,
	Fecha_Nac date not null,
	Genero_Empleado char(1) check(Genero_Empleado IN ('M', 'm','F', 'f')) not null,
	Fecha_registroEmp datetime default(getdate()) not null
)

Create table Cargo_Personal(
	ID_Cargo int primary key not null,
	Nombre_Cargo nvarchar(30) not null,
	Descripcion nvarchar (30) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	Salario float not null,
	Area_cargo nvarchar (30) not null
)

Create table Telefono_Empleado(
	ID_telefonoEmpleado int identity primary key not null,
	Telefono varchar(15) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_Compañia int foreign key (fk_Id_Compañia) references Compañias_Telefonica(ID_Compañia) not null,
)

Create table Correo_Empleado(
	ID_correoEmpleado int identity primary key not null,
	Correo_Empleado nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null, 
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null
)

Create table Direccion_Empleado(
	ID_Dir int identity primary key not null,
	Direccion nvarchar(250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_Barrio int foreign key(fk_Id_Barrio) references Barrio_Municipio(ID_Barrio)
)

Create table Historial_Cargo(
	ID_HistorialCargo int identity primary key not null,
	Motivo_Nuevo_Cargo nvarchar(250),
	Fecha_Ingreso date not null,
	Autorizado_Por nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_CargoEmp int foreign key(fk_Id_CargoEmp) references Cargo_Personal(ID_Cargo) not null
)

--- USUARIOS Y TIPOS DE USUARIOS

Create table Usuarios_Empleado(
	ID_Users int identity primary key not null,
	Users nvarchar(100) not null,
	Contraseña nvarchar(100) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	Fecha_Registro datetime default(getdate()) not null
)


  ---PRODUCTO

Create table Detalle_Color(
	ID_detalleColor int primary key not null,
	Descripcion nvarchar(100) not null
)

Create table Colores_Productos(
	ID_Color char(4) primary key not null,
	Nombre_Color nvarchar(50) not null,
	fk_Id_detColor int foreign key(fk_Id_detColor) references Detalle_Color(ID_detalleColor) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Tallas_Producto(
	ID_Talla int primary key not null,
	tallaSize char(4) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado)
)

Create table Genero(
	ID_Genero int primary key not null,
	Nombre nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Telas_Producto(
	ID_Tela int primary key not null,
	Tela nvarchar(20) not null,
	Patron_Tela nvarchar(20),
	Composicion nvarchar(250),
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table SubCategorias(
	ID_Sub_Cat int primary key not null,
	Nombre_SubCat nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Categorias(
	ID_Categoria int primary key not null,
	Nombre_Cat nvarchar(50) not null,
	fk_Id_SubCat int foreign key(fk_Id_SubCat) references SubCategorias(ID_Sub_Cat) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Marcas(
	ID_Marca char(5) primary key not null,
	Nombre_Marca nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)


Create table Modelo_Marca(
	ID_Modelo int primary key not null,
	Nombre nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Marca char(5) foreign key(fk_Id_Marca) references Marcas(ID_Marca) not null
)


Create table Producto(
	ID_Producto int primary key not null,
	Nombre_Producto nvarchar(50) not null,
	Precio float not null,
	fk_Id_Genero int foreign key(fk_Id_Genero) references Genero(ID_Genero) not null,
	fk_Id_Categoria int foreign key (fk_Id_Categoria) references Categorias(ID_Categoria) not null,
	fk_Id_Color char(4) foreign key(fk_Id_Color) references Colores_Productos(ID_Color) not null,
	fk_Id_Marca char(5) foreign key(fk_Id_Marca) references Marcas(ID_Marca) not null,
	fk_Id_Talla int foreign key(fk_Id_Talla) references Tallas_Producto(ID_Talla) not null,
	fk_Id_Tela int foreign key(fk_Id_Tela) references Telas_Producto(ID_Tela) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

 ---PROVEEDOR

Create table Proveedor(
	ID_Proveedor int identity primary key not null,
	Nombre_Proveedor nvarchar(50) not null,
	Identificacion nvarchar(20) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Direccion_Proveedor(
	ID_Dir int primary key not null,
	fk_Id_Mun int foreign key(fk_Id_Mun) references Municipio(ID_Mun),
	Direccion nvarchar(250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Proveedor int foreign key(fk_Id_Proveedor) references Proveedor(ID_Proveedor) not null,
)

Create table Telefono_Proveedor(
	ID_Telefono int primary key not null,
	Telefono varchar(15) not null, 
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Proveedor int foreign key(fk_Id_Proveedor) references Proveedor(ID_Proveedor) not null,
	fk_Id_Compañia int foreign key (fk_Id_Compañia) references Compañias_Telefonica(ID_Compañia) not null
)

Create table Correo_Proveedor(
	ID_Correo int primary key not null,
	Correo_Cliente nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Proveedor int foreign key(fk_Id_Proveedor) references Proveedor(ID_Proveedor) not null,
)

Create table Horarios_Proveedor(
	ID_horarioAtencion int primary key not null,
	Dias_Atencion nvarchar(10),
	Hora_Inicial time,
	Hora_Final time
)

Create table Detalles_Proveedor(
	ID_detalleProv int primary key not null,
	Nombre_Contacto nvarchar(50),
	fk_Id_Horario int foreign key(fk_Id_Horario) references Horarios_Proveedor(ID_horarioAtencion),
	fk_Id_Proveedor int foreign key(fk_Id_Proveedor) references Proveedor(ID_Proveedor) not null,
)


  ---COMPRA & VENTA

Create table Tipo_Comprobante(
	ID_Documento int primary key not null,
	Documento nvarchar(20)
)

Create table FormasPago(
	ID_formaPago char(2) primary key not null,
	Forma_Pago nvarchar(20) not null 
)

--FLUJO 

create table Flujo_Pedido(
	ID_Pedido int primary key not null,
    FechaPedido date not null,
	Descripcion nvarchar (250) null,
    Cantidad int not null,
	Subtotal float not null,
    fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_Producto int foreign key (fk_Id_Producto) references Producto(ID_Producto) not null,
)

create table Flujo_Orden(
	ID_Orden int primary key not null,
    FechaOrden date not null,
    FechaEntrega date,
    Total float not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_Pedido int foreign key (fk_Id_Pedido) references Flujo_Pedido(ID_Pedido) not null,
	fk_Id_Proveedor int foreign key(fk_Id_Proveedor) references Proveedor(ID_Proveedor) not null,
)

Create table Compras(
	ID_Compra int primary key not null,
	fk_Id_FormaPago char(2) foreign key(fk_Id_FormaPago) references FormasPago(ID_formaPago) not null,
	fk_Id_Documento int foreign key(fk_Id_Documento) references Tipo_Comprobante(ID_Documento) not null,
	fk_Id_OrdenCompra int foreign key (fk_Id_OrdenCompra ) references Flujo_Orden(ID_Orden) not null,
	No_Doc int not null,
	Descuento float null,
	Impuesto float not null,
	Total_Compra float not null,
	Fecha_Compra date not null,
)

Create table Detalle_Compra(
	ID_detalleCompra int primary key not null,
	fk_Id_Compra int foreign key (fk_Id_Compra) references Compras(ID_Compra) not null,
	fk_Id_Producto int foreign key (fk_Id_Producto) references Producto(ID_Producto) not null,
	Descripcion_Compra nvarchar(250) not null,
	Cantidad int not null,
	precioUnitario float not null,
	subtotal float not null
)

Create table Ventas(
	ID_Venta int identity primary key not null,
	No_Doc int not null,
	Descuento float null,
	Impuesto float not null,
	Total_Compra float not null,
	Fecha_Venta date not null,
	fk_Id_Cliente int foreign key (fk_Id_Cliente) references Clientes(ID_Cliente) not null,
	fk_Id_FormaPago char(2) foreign key(fk_Id_FormaPago) references FormasPago(ID_formaPago) not null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_Documento int foreign key(fk_Id_Documento) references Tipo_Comprobante(ID_Documento) not null,
)

Create table Detalle_Venta(
	ID_detalleVenta int primary key not null,
	fk_Id_Ventas int foreign key(fk_Id_Ventas) references Ventas(ID_Venta) not null,
	fk_Id_Producto int  foreign key (fk_Id_Producto) references Producto(ID_Producto) not null,
	Descripcion_Venta nvarchar(250) not null,
	Cantidad float not null,
	precioUnitario float not null,
	subtotal float not null
)

  ---MOVIMIENTO DE INVENTARIO

Create table Ubicacion_Inventario(
	ID_Ubicacion int primary key not null,
	Ubicacion nvarchar(50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Inventario(
	ID_Inventario char(5) primary key not null,
	Fecha_Inventario date not null,
	Existencias int not null,
	Disponibilidad int not null,
	Saldo int not null,
	fk_Id_Ubicacion int foreign key(fk_Id_Ubicacion) references Ubicacion_Inventario(ID_Ubicacion) null,
	fk_Id_Producto int  foreign key (fk_Id_Producto) references Producto(ID_Producto) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
)

Create table Tipo_Movimiento(
	ID_tipoMov char(2) primary key not null,
	Movimiento nvarchar(50) not null,
	fk_Id_Documento int foreign key(fk_Id_Documento) references Tipo_Comprobante(ID_Documento) not null
)

Create table Movimiento_Inventario(
	ID_Movimiento int identity primary key not null,
	No_Doc int not null,
	Fecha_Movimiento date not null,
	Cantidad_Mov int not null,
	Saldo_Mov int not null,
	fk_Id_Producto int  foreign key (fk_Id_Producto) references Producto(ID_Producto) not null,
	fk_Id_tipoMov char(2) foreign key (fk_Id_tipoMov) references Tipo_Movimiento(ID_tipoMov) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

--- DEVOLUCIONES

create table Estado_Devolucion(
	ID_estadoDevolucion int primary key not null,
	Tipo_Estado nvarchar (50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

create table Tipo_Devolucion(
	ID_tipoDevolucion int primary key not null,
	Tipo_Devolucion nvarchar (50) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
)

create table DevolucionCompra(
	ID_Devolucion int primary key not null,
	Motivo nvarchar(250) not null,
	fk_Id_Compra int foreign key (fk_Id_Compra) references Compras(ID_Compra) not null,
	fk_Id_tipoDev int foreign key (fk_Id_tipoDev) references Tipo_Devolucion (ID_tipoDevolucion) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	Total float not null
) 
create table Detalle_devolucionCompra(
	ID_detalleDevolucion int primary key not null,
	fk_Id_DevCompra int foreign key (fk_Id_DevCompra) references DevolucionCompra (ID_Devolucion) not null,
	Cantidad_Devuelta float not null,
	Descripcion_Devolucion nvarchar (250) not null,
    Subtotal float not null
)

create table DevolucionVenta(
	ID_Devolucion int primary key not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	Motivo nvarchar(250) not null,
	fk_Id_Ventas int foreign key (fk_Id_Ventas) references Ventas(ID_Venta) not null,
	fk_Id_tipoDev int foreign key (fk_Id_tipoDev) references Tipo_Devolucion(ID_tipoDevolucion) not null,
	Total float not null
)

create table Detalle_devolucionVenta(
	ID_detalleDevolucionV int primary key not null,
	fk_Id_DevVenta int foreign key (fk_Id_DevVenta) references DevolucionVenta(ID_Devolucion) not null,
	Cantidad_Devuelta float not null,
	Descripcion_Devolucion nvarchar(250) not null,
    Subtotal float not null
)
---CAJA

create table Transacciones_Caja(
	ID_Transaccion int identity primary key not null,
	Fecha_Transaccion datetime default(getdate()) not null,
	fk_Id_Ventas int foreign key (fk_Id_Ventas) references Ventas(ID_Venta) null,
	fk_Id_Compra int foreign key (fk_Id_Compra) references Compras(ID_Compra) null,
	fk_Id_Empleado int foreign key(fk_Id_Empleado) references Empleado(ID_Empleado) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
)


Create table OptionsInNavbar (
	ID_Option int identity primary key not null,
	OptionNav nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Insert into OptionsInNavbar Values ('HOME', 1), ('SHOP', 1), ('ABOUT', 1), ('CONTACT', 1);
Select * from OptionsInNavbar

Create table NamesPage (
	ID_Name int identity primary key not null,
	NamePage nvarchar(100) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Insert into NamesPage Values('Exotic Boutique', 1)
Select * from NamesPage