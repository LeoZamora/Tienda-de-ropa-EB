--- ROLES A NIVEL DE SERVIDOR
use Tienda_Online_EB

Create table Perfiles(
	ID_Perfil int primary key not null,
	Nombre_Perfil nvarchar(50) not null,
	Descripcion nvarchar(300) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null, 
	Fecha_registro Datetime default(getdate())
)

Create table Det_Perfil_Empleado(
	ID_DetPerfil int primary key not null,
	fk_Id_Perfil int foreign key(fk_Id_Perfil) references Perfiles(ID_Perfil) not null,
	fk_Id_HistorialCargo int foreign key(fk_Id_HistorialCargo) references Historial_Cargo(ID_HistorialCargo) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null, 
)

Create table Roll_Privilegio(
	ID_Roll int primary key not null,
	Nombre_Roll nvarchar(250) not null,
	Descripcion nvarchar (250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Det_RollPerfil_Empleado (
	ID_Det_RollPerfil int primary key not null,
	fk_Id_DetPerfil int foreign key(fk_Id_DetPerfil) references Det_Perfil_Empleado(ID_DetPerfil) not null,
	fk_Id_Roll int foreign key(fk_Id_Roll) references Roll_Privilegio(ID_Roll) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)


create table Usuario_Roll_Empleado(
	ID_UsuarioRollEmp int primary key not null,
	fk_Id_RollPerfil int foreign key(fk_Id_RollPerfil) references Det_RollPerfil_Empleado(ID_Det_RollPerfil) not null,
	fk_Id_Usuario int foreign key(fk_Id_Usuario) references Usuarios_Empleado(ID_Users) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null, 
)

Create table Permisos(
	ID_Permiso int primary key not null,
	Nombre_Permiso nvarchar(250) not null,
	Descripcion nvarchar(250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
)

Create table Usuario_Permisos_Empleado(
	ID_usuarioPermiso int primary key not null,
	fk_Id_UsuarioRollEmp int foreign key(fk_Id_UsuarioRollEmp) references Usuario_Roll_Empleado(ID_UsuarioRollEmp) not null,
	fk_Id_Permisos int foreign key(fk_Id_Permisos) references Permisos (ID_Permiso) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null, 
)


Create table Det_Perfil_Cliente(
	ID_Det_PerfilCliente int primary key not null,
	fk_Id_Perfil int foreign key(fk_Id_Perfil) references Perfiles(ID_Perfil) not null,
	fk_Id_Usuario int foreign key(fk_Id_Usuario) references Usuarios_Clientes(ID_Users) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

Create table Det_RollPerfil_Cliente(
	ID_Det_RollPerfil int primary key not null,
	fk_Id_PerfilCliente int foreign key (fk_Id_PerfilCliente) references Det_Perfil_Cliente(ID_Det_PerfilCliente) not null,
	fk_Id_Roll int foreign key(fk_Id_Roll) references Roll_Privilegio(ID_Roll) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

 Create table Usuario_Permisos_Cliente(
	ID_usuarioPermiso int primary key not null,
	fk_Id_Det_RollCliente int foreign key(fk_Id_Det_RollCliente) references Det_RollPerfil_Cliente (ID_Det_RollPerfil) not null,
	fk_Id_Permisos int foreign key(fk_Id_Permisos) references Permisos (ID_Permiso) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 )

 Create table Tipo_Usuarios(
	Id_tipoUsuario int primary key not null,
	Tipo_Usuario nvarchar(50) check(Tipo_Usuario IN ('Cliente', 'Empleado')) not null, 
	fk_Id_UsuarioEmp int foreign key(fk_Id_UsuarioEmp) references Usuario_Permisos_Empleado(ID_usuarioPermiso),
	fk_Id_UsuarioCliente int foreign key(fk_Id_UsuarioCliente) references Usuario_Permisos_Cliente(ID_usuarioPermiso),
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 )

 create table Conexion(
	ID_Conexion int primary key not null,
	Ip_Origen varchar(50) null,
	Fecha_Conexion Datetime default(getdate()),
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
	fk_Id_tipoUsuario int foreign key(fk_Id_tipoUsuario) references Tipo_Usuarios(Id_tipoUsuario) not null
)
 Create table Historial_InicioSesion(
	ID_HistorialSesion int primary key not null,
	Fecha_InicioSesion Datetime default(getdate())not null,
	Fecha_FinSesion Datetime default(getdate()) not null,
	Duracion as datediff(minute,Fecha_InicioSesion,Fecha_FinSesion) persisted not null,
	fk_Id_Conexion int foreign key (fk_Id_Conexion) references Conexion (ID_Conexion)not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 )

 create table ClasificacionPC(
	ID_Clasificacion int primary key not null,
	Nombre_Clasificacion nvarchar (250) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 ) 
  create table Palabras_Claves(
	ID_Clave int primary key not null,
	Clave nvarchar (300) not null,
	fk_Id_Clasificacion int foreign key (fk_Id_Clasificacion) references ClasificacionPC(ID_Clasificacion)not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 )
Create table Bitacora(
	ID_Bitacora int primary key not null,
	Fecha_Accion Datetime default(getdate()) not null,
	fk_Id_tipoUsuario int foreign key(fk_Id_tipoUsuario) references Tipo_Usuarios(Id_tipoUsuario) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null,
 )
 create table Detalle_Bitacora(
	ID_DetBitacora Int primary key not null,
	Descripcion nvarchar(300) not null,
	fk_Id_Clave int foreign key (fk_Id_Clave) references Palabras_Claves (ID_Clave)not null,
	fk_Id_Bitacora int foreign key (fk_Id_Bitacora) references Bitacora(ID_Bitacora) not null,
	fk_Id_Estado int foreign key (fk_Id_Estado) references Estados(Id_Estado) not null
)

