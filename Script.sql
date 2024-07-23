Use Tienda_Online_EB

Create table Cliente( 
	ID_Cliente int identity primary key not null,
	Nombre1_Cliente nvarchar(50) not null,
	Nombre2_Cliente nvarchar(50) null,
	Apellido1_Cliente nvarchar (50) not null,
	Apellido2_Cliente nvarchar (50) null,
	Genero_Cliente char(1) check(Genero_Cliente IN ('M', 'm','F', 'f')) not null,
	Fecha_registroCliente datetime default(getdate()) not null
)

Create table Usuarios_Clientes(
	ID_Users int identity primary key not null,
	Users nvarchar(100) not null,
	Contraseña nvarchar(20) not null,
	fk_Id_Cliente int foreign key(fk_Id_Cliente) references Cliente(ID_Cliente) not null,
	Fecha_Registro datetime default(getdate()) not null
)

Create table Usuarios(
	ID_Users int identity primary key not null,
	Users nvarchar(250) not null,
	Contraseña nvarchar(20) not null,
	Fecha_Registro datetime default(getdate()) not null
)

--- Procedure

CREATE PROCEDURE RegistrarClienteConUsuario
    @Nombre1 nvarchar(50),
    @Nombre2 nvarchar(50) = NULL,
    @Apellido1 nvarchar(50),
    @Apellido2 nvarchar(50) = NULL,
    @Genero char(1),
    @Users nvarchar(20),
    @Contraseña nvarchar(20)
AS
BEGIN
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Insertar en la tabla Cliente
        INSERT INTO Cliente (Nombre1_Cliente, Nombre2_Cliente, Apellido1_Cliente, Apellido2_Cliente, Genero_Cliente)
        VALUES (@Nombre1, @Nombre2, @Apellido1, @Apellido2, @Genero);

        -- Obtener el ID del cliente recién insertado
        DECLARE @NuevoID_Cliente int;
        SET @NuevoID_Cliente = SCOPE_IDENTITY();

        -- Insertar en la tabla Usuarios_Clientes
        INSERT INTO Usuarios_Clientes (Users, Contraseña, fk_Id_Cliente)
        VALUES (@Users, @Contraseña, @NuevoID_Cliente);

        -- Confirmar la transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        ROLLBACK TRANSACTION;

        -- Capturar los detalles del error
        DECLARE @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        -- Lanzar el error capturado
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;

