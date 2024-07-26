--- ROLES Y PERMISOS

--- Roles
Create Role Cliente
Create Role Emp_Ventas
Create Role Emp_Compras
Create Role Emp_Caja
Create Role Administrador

--- Permisos Cliente
Grant select on Productos to Cliente
Grant select on Direccion_Cliente to Cliente
Grant select on Correo_Cliente to Cliente
Grant select on Telefono_Cliente to Cliente

Grant update on Direccion_Cliente to Cliente
Grant update on Correo_Cliente to Cliente
Grant update on Telefono_Cliente to Cliente

Grant insert on Direccion_Cliente to Cliente
Grant insert on Correo_Cliente to Cliente
Grant insert on Telefono_Cliente to Cliente

Grant delete on Direccion_Cliente to Cliente
Grant delete on Correo_Cliente to Cliente
Grant delete on Telefono_Cliente to Cliente

--- Permisos Empleado

Grant select on Productos to Emp_Ventas
Grant select on Ventas to Emp_Ventas
Grant select on Detalle_Venta to Emp_Ventas
Grant select on Ubicacion_Inventario to Emp_Ventas
Grant select on Inventario to Emp_Ventas
Grant select on Tipo_Comprobante to Emp_Ventas
Grant select on Tipo_Movimiento to Emp_Ventas
Grant select on Movimiento_Inventario to Emp_Ventas

Grant update on Productos to Emp_Ventas
Grant update on Ventas to Emp_Ventas
Grant update on Detalle_Venta to Emp_Ventas
Grant update on Ubicacion_Inventario to Emp_Ventas
Grant update on Inventario to Emp_Ventas
Grant update on Tipo_Comprobante to Emp_Ventas
Grant update on Tipo_Movimiento to Emp_Ventas

Grant insert on Ventas to Emp_Ventas
Grant insert on Detalle_Ventas to Emp_Ventas
Grant insert on Ubicacion_Inventario to Emp_Ventas
Grant insert on Inventario to Emp_Ventas

--- Permisos Empleado de compra

Grant select on Productos to Emp_Compras
Grant select on Compras to Emp_Compras
Grant select on Detalle_Compra to Emp_Compras
Grant select on Ubicacion_Inventario to Emp_Compras
Grant select on Inventario to Emp_Compras
Grant select on Tipo_Comprobante to Emp_Compras
Grant select on Tipo_Movimiento to Emp_Compras
Grant select on Movimiento_Inventario to Emp_Compras

Grant update on Productos to Emp_Compras
Grant update on Compras to Emp_Compras
Grant update on Detalle_Compra to Emp_Compras
Grant update on Ubicacion_Inventario to Emp_Compras
Grant update on Inventario to Emp_Compras
Grant update on Tipo_Comprobante to Emp_Compras
Grant update on Tipo_Movimiento to Emp_Compras

Grant insert on Compras to Emp_Compras
Grant insert on Detalle_Compras to Emp_Compras
Grant insert on Ubicacion_Inventario to Emp_Compras
Grant insert on Inventario to Emp_Compras

--- Permisos Administrador

Grant select on Compañias_Telefonica to Administrador
Grant select on Pais to Administrador
Grant select on Departamento to Administrador
Grant select on Municipio to Administrador
Grant select on Barrio_Municipio to Administrador
Grant select on Clientes to Administrador
Grant select on Telefono_Cliente to Administrador
Grant select on Correo_Cliente to Administrador
Grant select on Direccion_Cliente to Administrador
Grant select on Usuarios_Clientes to Administrador
Grant select on Empleado to Administrador
Grant select on Cargo_Personal to Administrador
Grant select on Telefono_Empleado to Administrador
Grant select on Correo_Empleado to Administrador
Grant select on Direccion_Empleado to Administrador
Grant select on Historial_Cargo to Administrador
Grant select on Usuarios_Empleado to Administrador
Grant select on Detalle_Color to Administrador
Grant select on Colores_Productos to Administrador
Grant select on Tallas_Producto to Administrador
Grant select on Genero to Administrador
Grant select on Telas_Producto to Administrador
Grant select on SubCategorias to Administrador
Grant select on Categorias to Administrador
Grant select on Marcas to Administrador
Grant select on Modelo_Marca to Administrador
Grant select on Producto to Administrador
Grant select on Proveedor to Administrador
Grant select on Direccion_Proveedor to Administrador
Grant select on Telefono_Proveedor to Administrador
Grant select on Correo_Proveedor to Administrador
Grant select on Horarios_Proveedor to Administrador
Grant select on Detalles_Proveedor to Administrador
Grant select on Tipo_Comprobante to Administrador
Grant select on FormasPago to Administrador
Grant select on Flujo_Pedido to Administrador
Grant select on Flujo_Orden to Administrador
Grant select on Compras to Administrador
Grant select on Detalle_Compra to Administrador
Grant select on Ventas to Administrador
Grant select on Detalle_Venta to Administrador
Grant select on Ubicacion_Inventario to Administrador
Grant select on Inventario to Administrador
Grant select on Tipo_Movimiento to Administrador
Grant select on Movimiento_Inventario to Administrador
Grant select on Estado_Devolucion to Administrador
Grant select on Tipo_Devolucion to Administrador
Grant select on DevolucionCompra to Administrador
Grant select on Detalle_devolucionCompra to Administrador
Grant select on DevolucionVenta to Administrador
Grant select on Detalle_devolucionVenta to Administrador
Grant select on Transacciones_Caja to Administrador

Grant update on Compañias_Telefonica to Administrador
Grant update on Pais to Administrador
Grant update on Departamento to Administrador
Grant update on Municipio to Administrador
Grant update on Barrio_Municipio to Administrador
Grant update on Clientes to Administrador
Grant update on Telefono_Cliente to Administrador
Grant update on Correo_Cliente to Administrador
Grant update on Direccion_Cliente to Administrador
Grant update on Usuarios_Clientes to Administrador
Grant update on Empleado to Administrador
Grant update on Cargo_Personal to Administrador
Grant update on Telefono_Empleado to Administrador
Grant update on Correo_Empleado to Administrador
Grant update on Direccion_Empleado to Administrador
Grant update on Historial_Cargo to Administrador
Grant update on Usuarios_Empleado to Administrador
Grant update on Detalle_Color to Administrador
Grant update on Colores_Productos to Administrador
Grant update on Tallas_Producto to Administrador
Grant update on Genero to Administrador
Grant update on Telas_Producto to Administrador
Grant update on SubCategorias to Administrador
Grant update on Categorias to Administrador
Grant update on Marcas to Administrador
Grant update on Modelo_Marca to Administrador
Grant update on Producto to Administrador
Grant update on Proveedor to Administrador
Grant update on Direccion_Proveedor to Administrador
Grant update on Telefono_Proveedor to Administrador
Grant update on Correo_Proveedor to Administrador
Grant update on Horarios_Proveedor to Administrador
Grant update on Detalles_Proveedor to Administrador
Grant update on Tipo_Comprobante to Administrador
Grant update on FormasPago to Administrador
Grant update on Flujo_Pedido to Administrador
Grant update on Flujo_Orden to Administrador
Grant update on Compras to Administrador
Grant update on Detalle_Compra to Administrador
Grant update on Ventas to Administrador
Grant update on Detalle_Venta to Administrador
Grant update on Ubicacion_Inventario to Administrador
Grant update on Inventario to Administrador
Grant update on Tipo_Movimiento to Administrador
Grant update on Movimiento_Inventario to Administrador
Grant update on Estado_Devolucion to Administrador
Grant update on Tipo_Devolucion to Administrador
Grant update on DevolucionCompra to Administrador
Grant update on Detalle_devolucionCompra to Administrador
Grant update on DevolucionVenta to Administrador
Grant update on Detalle_devolucionVenta to Administrador
Grant update on Transacciones_Caja to Administrador

Grant insert on Compañias_Telefonica to Administrador
Grant insert on Pais to Administrador
Grant insert on Departamento to Administrador
Grant insert on Municipio to Administrador
Grant insert on Barrio_Municipio to Administrador
Grant insert on Clientes to Administrador
Grant insert on Telefono_Cliente to Administrador
Grant insert on Correo_Cliente to Administrador
Grant insert on Direccion_Cliente to Administrador
Grant insert on Usuarios_Clientes to Administrador
Grant insert on Empleado to Administrador
Grant insert on Cargo_Personal to Administrador
Grant insert on Telefono_Empleado to Administrador
Grant insert on Correo_Empleado to Administrador
Grant insert on Direccion_Empleado to Administrador
Grant insert on Historial_Cargo to Administrador
Grant insert on Usuarios_Empleado to Administrador
Grant insert on Detalle_Color to Administrador
Grant insert on Colores_Productos to Administrador
Grant insert on Tallas_Producto to Administrador
Grant insert on Genero to Administrador
Grant insert on Telas_Producto to Administrador
Grant insert on SubCategorias to Administrador
Grant insert on Categorias to Administrador
Grant insert on Marcas to Administrador
Grant insert on Modelo_Marca to Administrador
Grant insert on Producto to Administrador
Grant insert on Proveedor to Administrador
Grant insert on Direccion_Proveedor to Administrador
Grant insert on Telefono_Proveedor to Administrador
Grant insert on Correo_Proveedor to Administrador
Grant insert on Horarios_Proveedor to Administrador
Grant insert on Detalles_Proveedor to Administrador
Grant insert on Tipo_Comprobante to Administrador
Grant insert on FormasPago to Administrador
Grant insert on Flujo_Pedido to Administrador
Grant insert on Flujo_Orden to Administrador
Grant insert on Compras to Administrador
Grant insert on Detalle_Compra to Administrador
Grant insert on Ventas to Administrador
Grant insert on Detalle_Venta to Administrador
Grant insert on Ubicacion_Inventario to Administrador
Grant insert on Inventario to Administrador
Grant insert on Tipo_Movimiento to Administrador
Grant insert on Movimiento_Inventario to Administrador
Grant insert on Estado_Devolucion to Administrador
Grant insert on Tipo_Devolucion to Administrador
Grant insert on DevolucionCompra to Administrador
Grant insert on Detalle_devolucionCompra to Administrador
Grant insert on DevolucionVenta to Administrador
Grant insert on Detalle_devolucionVenta to Administrador
Grant insert on Transacciones_Caja to Administrador

Grant delete on Compañias_Telefonica to Administrador
Grant delete on Pais to Administrador
Grant delete on Departamento to Administrador
Grant delete on Municipio to Administrador
Grant delete on Barrio_Municipio to Administrador
Grant delete on Clientes to Administrador
Grant delete on Telefono_Cliente to Administrador
Grant delete on Correo_Cliente to Administrador
Grant delete on Direccion_Cliente to Administrador
Grant delete on Usuarios_Clientes to Administrador
Grant delete on Empleado to Administrador
Grant delete on Cargo_Personal to Administrador
Grant delete on Telefono_Empleado to Administrador
Grant delete on Correo_Empleado to Administrador
Grant delete on Direccion_Empleado to Administrador
Grant delete on Historial_Cargo to Administrador
Grant delete on Usuarios_Empleado to Administrador
Grant delete on Detalle_Color to Administrador
Grant delete on Colores_Productos to Administrador
Grant delete on Tallas_Producto to Administrador
Grant delete on Genero to Administrador
Grant delete on Telas_Producto to Administrador
Grant delete on SubCategorias to Administrador
Grant delete on Categorias to Administrador
Grant delete on Marcas to Administrador
Grant delete on Modelo_Marca to Administrador
Grant delete on Producto to Administrador
Grant delete on Proveedor to Administrador
Grant delete on Direccion_Proveedor to Administrador
Grant delete on Telefono_Proveedor to Administrador
Grant delete on Correo_Proveedor to Administrador
Grant delete on Horarios_Proveedor to Administrador
Grant delete on Detalles_Proveedor to Administrador
Grant delete on Tipo_Comprobante to Administrador
Grant delete on FormasPago to Administrador
Grant delete on Flujo_Pedido to Administrador
Grant delete on Flujo_Orden to Administrador
Grant delete on Compras to Administrador
Grant delete on Detalle_Compra to Administrador
Grant delete on Ventas to Administrador
Grant delete on Detalle_Venta to Administrador
Grant delete on Ubicacion_Inventario to Administrador
Grant delete on Inventario to Administrador
Grant delete on Tipo_Movimiento to Administrador
Grant delete on Movimiento_Inventario to Administrador
Grant delete on Estado_Devolucion to Administrador
Grant delete on Tipo_Devolucion to Administrador
Grant delete on DevolucionCompra to Administrador
Grant delete on Detalle_devolucionCompra to Administrador
Grant delete on DevolucionVenta to Administrador
Grant delete on Detalle_devolucionVenta to Administrador
Grant delete on Transacciones_Caja to Administrador

--Emp_Caja

Grant select on Clientes to Emp_Caja
Grant select on Telefono_Cliente to Emp_Caja
Grant select on Correo_Cliente to Emp_Caja
Grant select on Direccion_Cliente to Emp_Caja
Grant select on Producto to Emp_Caja
Grant select on Ventas to Emp_Caja
Grant select on Detalle_Venta to Emp_Caja
Grant select on Transacciones_Caja to Emp_Caja
Grant select on FormasPago to Emp_Caja
Grant select on DevolucionVenta to Emp_Caja
Grant select on Detalle_devolucionVenta to Emp_Caja

Grant insert on Clientes to Emp_Caja
Grant insert on Telefono_Cliente to Emp_Caja
Grant insert on Correo_Cliente to Emp_Caja
Grant insert on Direccion_Cliente to Emp_Caja
Grant insert on Producto to Emp_Caja
Grant insert on Ventas to Emp_Caja
Grant insert on Detalle_Venta to Emp_Caja
Grant insert on Transacciones_Caja to Emp_Caja
Grant insert on FormasPago to Emp_Caja
Grant insert on DevolucionVenta to Emp_Caja
Grant insert on Detalle_devolucionVenta to Emp_Caja

Grant delete on Clientes to Emp_Caja
Grant delete on Telefono_Cliente to Emp_Caja
Grant delete on Correo_Cliente to Emp_Caja
Grant delete on Direccion_Cliente to Emp_Caja
Grant delete on Producto to Emp_Caja
Grant delete on Ventas to Emp_Caja
Grant delete on Detalle_Venta to Emp_Caja
Grant delete on Transacciones_Caja to Emp_Caja
Grant delete on FormasPago to Emp_Caja
Grant delete on DevolucionVenta to Emp_Caja
Grant delete on Detalle_devolucionVenta to Emp_Caja

--- Usuarios

Create user UsuarioCliente for LOGIN LoginCliente
Exec sp_addrolemember 'Cliente', 'UsuarioCliente'

Create user UsuarioVentas for LOGIN LoginEmpVenta
Exec sp_addrolemember 'Emp_Ventas', 'UsuarioVentas'

Create user UsuarioCompras for LOGIN LoginEmpCompra
Exec sp_addrolemember 'Emp_Compras', 'UsuarioCompras'

Create user UserAdmin for LOGIN LoginAdmin
Exec sp_addrolemember 'Administrador', 'UserAdmin'

Use Tienda_Online_EB
Alter Role db_owner add member UserAdmin
