import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Det_Perfil_Empleado from "./PerfilEmpModel";
import Roles from "../../SecurityModels/Catalogue/RolesModel.js"

const Det_RollPerfil_Empleado = connectionDB.define('Det_RollPerfil_Empleado', {
    ID_Det_RollPerfil: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Det_RollPerfil"
    },
    fk_Id_DetPerfil: {
        type: DataTypes.INTEGER,
        references: {
            model: Det_Perfil_Empleado,
            key: "ID_DetPerfil"
        }, 
        allowNull: false,
        field: "fk_Id_DetPerfil"
    }, 
    fk_Id_Roll: {
        type: DataTypes.INTEGER,
        references: {
            model: Roles,
            key: "ID_Roll"
        },
        allowNull: false,
        field: "fk_Id_Roll"
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
    tableName: "Det_RollPerfil_Empleado",
    timestamps: false
})

Estados.hasMany(Det_RollPerfil_Empleado, {foreignKey: "fk_Id_Estado"})
Det_RollPerfil_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Det_Perfil_Empleado.hasMany(Det_RollPerfil_Empleado, {foreignKey: "ID_DetPerfil"})
Det_RollPerfil_Empleado.belongsTo(Det_Perfil_Empleado, {foreignKey: "ID_DetPerfil"})
Roles.hasMany(Det_RollPerfil_Empleado, {foreignKey: "fk_Id_Roll"})
Det_RollPerfil_Empleado.belongsTo(Roles, {foreignKey: "fk_Id_Roll"})

export default Det_RollPerfil_Empleado