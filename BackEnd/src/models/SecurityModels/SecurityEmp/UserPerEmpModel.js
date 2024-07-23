import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Usuario_Roll_Empleado from "./UserRolEmpModel";
import Permisos from "../Catalogue/PermisosModel.js"

const Usuario_Permisos_Empleado = connectionDB.define('Usuario_Permisos_Empleado', {
    ID_usuarioPermiso: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_usuarioPermiso"
    },
    fk_Id_UsuarioRollEmp: {
        type: DataTypes.INTEGER,
        references: {
            model: Usuario_Roll_Empleado,
            key: "ID_UsuarioRollEmp"
        },
        allowNull: false,
        field: "fk_Id_UsuarioRollEmp"
    },
    fk_Id_Permisos: {
        type: DataTypes.INTEGER,
        references: {
            model: Permisos,
            key: "ID_UsuID_PermisoarioRollEmp"
        },
        allowNull: false,
        field: "fk_Id_Permisos"
    },
    fk_Id_Estado: {
        type: DataTypes.INTEGER,
        references: {
            model: Estados,
            key: "Id_Estado"
        },
        allowNull: false,
        field: "fk_Id_Estado"
    }
}, {
    tableName: "Usuario_Permisos_Empleado",
    timestamps: false
}) 

Estados.hasMany(Usuario_Permisos_Empleado, {foreignKey: "fk_Id_Estado"})
Usuario_Permisos_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Usuario_Roll_Empleado.hasMany(Usuario_Permisos_Empleado, {foreignKey: "fk_Id_UsuarioRollEmp"})
Usuario_Permisos_Empleado.belongsTo(Usuario_Roll_Empleado, {foreignKey: "fk_Id_UsuarioRollEmp"})
Permisos.hasMany(Usuario_Permisos_Empleado, {foreignKey: "fk_Id_Permisos"})
Usuario_Permisos_Empleado.belongsTo(Permisos, {foreignKey: "fk_Id_Permisos"})

export default Usuario_Permisos_Empleado