Use Tienda_Online_EB

--- Registro de Compra
--- FLUJO DE PROCESO DE COMPRA

CREATE PROCEDURE InsertarFlujoPedido
    @ID_Pedido int,
    @FechaPedido date,
    @Descripcion nvarchar(250),
    @Cantidad int,
    @Subtotal float,
    @fk_Id_Estado_Pedido int,
    @fk_Id_Empleado int,
    @fk_Id_Producto int
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Flujo_Pedido (ID_Pedido, FechaPedido, Descripcion, Cantidad, Subtotal, fk_Id_Estado, fk_Id_Empleado, fk_Id_Producto)
        VALUES (@ID_Pedido, @FechaPedido, @Descripcion, @Cantidad, @Subtotal, @fk_Id_Estado_Pedido, @fk_Id_Empleado, @fk_Id_Producto);

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Flujo_Pedido exitosamente';
        SET @status = 0;

        SELECT @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


CREATE PROCEDURE InsertarFlujoOrden
    @ID_Orden int,
    @FechaOrden date,
    @FechaEntrega date,
    @Total float,
    @fk_Id_Estado_Orden int,
    @fk_Id_Pedido int,
    @fk_Id_Proveedor int
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO Flujo_Orden (ID_Orden, FechaOrden, FechaEntrega, Total, fk_Id_Estado, fk_Id_Pedido, fk_Id_Proveedor)
        VALUES (@ID_Orden, @FechaOrden, @FechaEntrega, @Total, @fk_Id_Estado_Orden, @fk_Id_Pedido, @fk_Id_Proveedor);

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Flujo_Orden exitosamente';
        SET @status = 0;

        SELECT @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


CREATE PROCEDURE InsertarCompras
    @ID_Compra int,
    @fk_Id_FormaPago char(2),
    @fk_Id_Documento int,
    @fk_Id_OrdenCompra int,
    @No_Doc int,
    @Descuento float,
    @Impuesto float,
    @Total_Compra float,
    @Fecha_Compra date
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Compras (ID_Compra, fk_Id_FormaPago, fk_Id_Documento, fk_Id_OrdenCompra, No_Doc, Descuento, Impuesto, Total_Compra, Fecha_Compra)
        VALUES (@ID_Compra, @fk_Id_FormaPago, @fk_Id_Documento, @fk_Id_OrdenCompra, @No_Doc, @Descuento, @Impuesto, @Total_Compra, @Fecha_Compra);

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Compras exitosamente';
        SET @status = 0;

        SELECT @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


CREATE PROCEDURE InsertarDetalleCompra
    @ID_detalleCompra int,
    @fk_Id_Compra int,
    @fk_Id_Producto int,
    @Descripcion_Compra nvarchar(250),
    @Cantidad int,
    @precioUnitario float,
    @subtotal float
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO Detalle_Compra (ID_detalleCompra, fk_Id_Compra, fk_Id_Producto, Descripcion_Compra, Cantidad, precioUnitario, subtotal)
        VALUES (@ID_detalleCompra, @fk_Id_Compra, @fk_Id_Producto, @Descripcion_Compra, @Cantidad, @precioUnitario, @subtotal);

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Detalle_Compra exitosamente';
        SET @status = 0;

        SELECT @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;

CREATE PROCEDURE RegistrarCompra
    @id_detcompra int
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE @id_producto int;
        DECLARE @cantidad int;

        DECLARE detalle_cursor CURSOR FOR
        SELECT fk_Id_Producto, Cantidad
        FROM Detalle_Compra
        WHERE ID_detalleCompra = @id_detcompra;

        OPEN detalle_cursor;

        FETCH NEXT FROM detalle_cursor INTO @id_producto, @cantidad;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO Movimiento_Inventario (fk_Id_Producto, fk_Id_tipoMov, Cantidad_Mov, Fecha_Movimiento)
            VALUES (@id_producto, 'compra', @cantidad, GETDATE());

            UPDATE Inventario
            SET Saldo = Saldo + @cantidad
            WHERE fk_Id_Producto = @id_producto;

            FETCH NEXT FROM detalle_cursor INTO @id_producto, @cantidad;
        END;

        CLOSE detalle_cursor;
        DEALLOCATE detalle_cursor;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        SET @status = ERROR_NUMBER();
        SET @msg = ERROR_MESSAGE();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


---- REGISTRO DE VENTA
CREATE PROCEDURE InsertarVenta
    @No_Doc int,
    @Descuento float,
    @Impuesto float,
    @Total_Compra float,
    @Fecha_Venta date,
    @fk_Id_Cliente int,
    @fk_Id_FormaPago char(2),
    @fk_Id_Empleado int,
    @fk_Id_Documento int
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Ventas (No_Doc, Descuento, Impuesto, Total_Compra, Fecha_Venta, fk_Id_Cliente, fk_Id_FormaPago, fk_Id_Empleado, fk_Id_Documento)
        VALUES (@No_Doc, @Descuento, @Impuesto, @Total_Compra, @Fecha_Venta, @fk_Id_Cliente, @fk_Id_FormaPago, @fk_Id_Empleado, @fk_Id_Documento);

        DECLARE @ID_Venta int;
        SET @ID_Venta = SCOPE_IDENTITY();

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Ventas exitosamente';
        SET @status = 0;

        SELECT @ID_Venta AS ID_Venta, @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


CREATE PROCEDURE InsertarDetalleVenta
    @ID_detalleVenta int,
    @fk_Id_Ventas int,
    @fk_Id_Producto int,
    @Descripcion_Venta nvarchar(250),
    @Cantidad float,
    @precioUnitario float,
    @subtotal float
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);

    SET LANGUAGE Spanish;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Detalle_Venta (ID_detalleVenta, fk_Id_Ventas, fk_Id_Producto, Descripcion_Venta, Cantidad, precioUnitario, subtotal)
        VALUES (@ID_detalleVenta, @fk_Id_Ventas, @fk_Id_Producto, @Descripcion_Venta, @Cantidad, @precioUnitario, @subtotal);

        COMMIT TRANSACTION;

        SET @msg = 'Datos insertados en Detalle_Venta exitosamente';
        SET @status = 0;

        SELECT @msg AS Mensaje, @status AS Estado;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;


CREATE PROCEDURE RegistrarVenta
    @id_venta int
AS
BEGIN
    DECLARE @status int;
    DECLARE @msg nvarchar(300);
    DECLARE @id_producto int;
    DECLARE @cantidad int;
    DECLARE @existencias_actuales int;

    SET LANGUAGE Spanish;

    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE detalle_cursor CURSOR FOR
        SELECT fk_Id_Producto, Cantidad
        FROM Detalle_Venta
        WHERE ID_detalleVenta = @id_venta;

        OPEN detalle_cursor;

        FETCH NEXT FROM detalle_cursor INTO @id_producto, @cantidad;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @existencias_actuales = Saldo 
            FROM Inventario 
            WHERE fk_Id_Producto = @id_producto;

            IF @existencias_actuales < @cantidad
            BEGIN
                CLOSE detalle_cursor;
                DEALLOCATE detalle_cursor;

                ROLLBACK TRANSACTION;

                SET @msg = 'No hay suficientes existencias para completar la venta para el producto ' + CAST(@id_producto AS nvarchar(10));
                SET @status = 99;

                SELECT @msg AS Mensaje, @status AS Estado;

                RETURN;
            END;

            INSERT INTO Movimiento_Inventario (fk_Id_Producto, fk_Id_tipoMov, Cantidad_Mov, Fecha_Movimiento)
            VALUES (@id_producto, 'venta', @cantidad, GETDATE());

            UPDATE Inventario
            SET Saldo = Saldo - @cantidad
            WHERE fk_Id_Producto = @id_producto;

            FETCH NEXT FROM detalle_cursor INTO @id_producto, @cantidad;
        END;

        CLOSE detalle_cursor;
        DEALLOCATE detalle_cursor;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH

        SET @msg = ERROR_MESSAGE();
        SET @status = ERROR_NUMBER();

        ROLLBACK TRANSACTION;

        SELECT @status AS Estado, @msg AS Mensaje;
    END CATCH;
END;

---- REGISTRO DE CLIENTE Y USUARIO

CREATE PROCEDURE RegistrarClienteConUsuario
    @Nombre1 nvarchar(50),
    @Nombre2 nvarchar(50) = NULL,
    @Apellido1 nvarchar(50),
    @Apellido2 nvarchar(50) = NULL,
    @Genero char(1),
	@Fecha_Nac Date,
    @Users nvarchar(100),
    @Contraseña nvarchar(100)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Clientes (Nombre1_Cliente, Nombre2_Cliente, Apellido1_Cliente, Apellido2_Cliente, Genero_Cliente, Fecha_Nac)
        VALUES (@Nombre1, @Nombre2, @Apellido1, @Apellido2, @Genero, @Fecha_Nac);

        DECLARE @NuevoID_Cliente int;
        SET @NuevoID_Cliente = SCOPE_IDENTITY();

		---DECLARE @HashPasword nvarchar(64);
		---SET @HashPasword = CONVERT(nvarchar(64), HASHBYTES('SHA2_256', @Contraseña), 2);

        INSERT INTO Usuarios_Clientes (Users, Contraseña, fk_Id_Cliente)
        VALUES (@Users, @Contraseña, @NuevoID_Cliente);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
        
        SET @ErrorMessage = ERROR_MESSAGE()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE();

		ROLLBACK TRANSACTION;

		SELECT @ErrorMessage AS Mensaje, @ErrorSeverity AS Severidad, @ErrorState AS Estado

    END CATCH
END;

Select * from Clientes

--- REGISTRO DE EMPLEADO Y USUARIO

CREATE PROCEDURE RegistroEmpleadoConUsuario
	@Nombre1_Empleado nvarchar(20),
	@Nombre2_Empleado nvarchar(20),
	@Apellido1_Empleado nvarchar(20),
	@Apellido2_Empleado nvarchar(20),
	@No_INSS varchar(12),
	@No_Cedula nvarchar(20),
	@Fecha_Nac date,
	@Genero_Empleado char(1),
	@Users nvarchar(100),
	@Contraseña nvarchar(100)

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		INSERT INTO Empleado (Nombre1_Empleado, Nombre2_Empleado, Apellido1_Empleado, Apellido2_Empleado, No_INSS, No_Cedula, Fecha_Nac, Genero_Empleado)
		VALUES (@Nombre1_Empleado, @Nombre2_Empleado, @Apellido1_Empleado, @Apellido2_Empleado, @No_INSS, @No_Cedula, @Fecha_Nac, @Genero_Empleado);

		DECLARE @NuevoID_Empleado int;
		SET @NuevoID_Empleado = SCOPE_IDENTITY();

		DECLARE @HasPassword nvarchar(64);
		SET @HasPassword = CONVERT(nvarchar(64), HASHBYTES('SHA2_256', @Contraseña), 2);

		INSERT INTO Usuarios_Empleado(Users, Contraseña, fk_Id_Empleado)
		VALUES (@Users, @Contraseña, @NuevoID_Empleado);

		COMMIT TRANSACTION

	END TRY

	BEGIN CATCH
	DECLARE @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
        
        SET @ErrorMessage = ERROR_MESSAGE()
        SET @ErrorSeverity = ERROR_SEVERITY()
        SET @ErrorState = ERROR_STATE();

		ROLLBACK TRANSACTION;

		SELECT @ErrorMessage AS Mensaje, @ErrorSeverity AS Severidad, @ErrorState AS Estado

    END CATCH;

END;


CREATE PROCEDURE RegistrarClienteYUsuario
    @Nombre1 nvarchar(50),
    @Nombre2 nvarchar(50) = NULL,
    @Apellido1 nvarchar(50),
    @Apellido2 nvarchar(50) = NULL,
    @Genero char(1),
    @Users nvarchar(100),
    @Contraseña nvarchar(100),
	@Telefono nvarchar(15)
AS
Begin
	Begin Try
		Begin Transaction
		
        INSERT INTO Clientes (Nombre1_Cliente, Nombre2_Cliente, Apellido1_Cliente, Apellido2_Cliente, Genero_Cliente)
        VALUES (@Nombre1, @Nombre2, @Apellido1, @Apellido2, @Genero);

        DECLARE @NuevoID_Cliente int;
        SET @NuevoID_Cliente = SCOPE_IDENTITY();

	    INSERT INTO Usuarios_Clientes (Users, Contraseña, fk_Id_Cliente)
        VALUES (@Users, @Contraseña, @NuevoID_Cliente);

		INSERT INTO Telefono_Cliente (Telefono, fk_Id_Estado, fk_Id_Cliente, fk_Id_Compañia)
		VALUES (@Telefono, 1, @NuevoID_Cliente, 1);

