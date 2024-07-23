import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Det_RollPerfil_Empleado from "../SecurityEmp/RolPerEmpModel.js"
import Usuarios_Empleado from "../../UserModels/UsuariosEmpModel.js"

const Usuario_Roll_Empleado = connectionDB.define('Usuario_Roll_Empleado', {
    ID_UsuarioRollEmp: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false, 
        allowNull: false,
        field: "ID_UsuarioRollEmp"
    },
    fk_Id_RollPerfil: {
        type: DataTypes.INTEGER,
        references: {
            model: Det_RollPerfil_Empleado,
            key: "ID_Det_RollPerfil"
        },
        allowNull: false,
        field: "fk_Id_RollPerfil"
    },
    fk_Id_Usuario: {
        type: DataTypes.INTEGER,
        references: {
            model: Usuarios_Empleado,
            key: "ID_Users"
        },
        allowNull: false,
        field: "fk_Id_Usuario"
    },
    fk_Id_Estado: {
        type: DataTypes.INTEGER,
        references: {
            model: Estados,
            key: "Id_Estado"
        },
        allowNull: false,
        field: "fk_Id_Estado"
    },
}, {
    tableName: "Usuario_Roll_Empleado",
    timestamps: false
})

Estados.hasMany(Usuario_Roll_Empleado, {foreignKey: "fk_Id_Estado"})
Usuario_Roll_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Det_RollPerfil_Empleado.hasMany(Usuario_Roll_Empleado, {foreignKey: "ID_Det_RollPerfil"})
Usuario_Roll_Empleado.belongsTo(Det_RollPerfil_Empleado, {foreignKey: "ID_Det_RollPerfil"})
Usuarios_Empleado.hasMany(Usuario_Roll_Empleado, {foreignKey: "fk_Id_Usuario"})
Usuario_Roll_Empleado.belongsTo(Usuarios_Empleado, {foreignKey: "fk_Id_Usuario"})

export default Usuario_Roll_Empleado