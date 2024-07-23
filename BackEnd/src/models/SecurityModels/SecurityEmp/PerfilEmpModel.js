import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js"
import Estados from "../../GeneralTables/StatusModel.js"
import Perfiles from "../Catalogue/Perfiles.js"
import Historial_Cargo from "../../EntityModels/Empleado/HisEmpModel.js"

const Det_Perfil_Empleado = connectionDB.define('Det_Perfil_Empleado', {
    ID_DetPerfil: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false, 
        allowNull: false,
        field: "ID_DetPerfil"
    },
    fk_Id_Perfil: {
        type: DataTypes.INTEGER,
        references: {
            model: Perfiles,
            key: "ID_Perfil"
        },
        allowNull: false, 
        field: "fk_Id_Perfil" 
    },
    fk_Id_HistorialCargo: {
        type: DataTypes.INTEGER,
        references: {
            model: Historial_Cargo,
            key: "ID_HistorialCargo"
        },
        allowNull: false, 
        field: "fk_Id_HistorialCargo" 
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
    tableName: "Det_Perfil_Empleado",
    timestamps: false
})

Estados.hasMany(Det_Perfil_Empleado, {foreignKey: "fk_Id_Estado"})
Det_Perfil_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Perfiles.hasMany(Det_Perfil_Empleado, {foreignKey: "fk_Id_Perfil"})
Det_Perfil_Empleado.belongsTo(Perfiles, {foreignKey: "fk_Id_Perfil"})
Historial_Cargo.hasMany(Det_Perfil_Empleado, {foreignKey: "fk_Id_HistorialCargo"})
Det_Perfil_Empleado.belongsTo(Historial_Cargo, {foreignKey: "fk_Id_HistorialCargo"})

export default Det_Perfil_Empleado