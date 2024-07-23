import { DataTypes, DATE } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Empleado from "./Empleado.Model";
import Barrio_Municipio from "../../GeneralTables/Ubications/Barrio_Mun.js"

const Direccion_Empleado = connectionDB.define('Direccion_Correo', {
    ID_Dir: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Dir"
    },
    Direccion: {
        type: DataTypes.STRING(250),
        allowNull: false,
        field: "Direccion"
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
    fk_Id_Empleado: {
        type: DataTypes.INTEGER,
        references: {
            model: Empleado,
            key: "ID_Empleado"
        },
        allowNull: false,
        field: "fk_Id_Empleado"
    },
    fk_Id_Barrio: {
        type: DataTypes.INTEGER,
        references: {
            model: Barrio_Municipio,
            key: "ID_Barrio"
        },
        allowNull: false,
        field: "fk_Id_Barrio"
    }
}, {
    tableName: "Direccion_Empleado",
    timestamps: false
})

Estados.hasMany(Direccion_Empleado, {foreignKey: "fk_Id_Estado"})
Direccion_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Empleado.hasMany(Direccion_Empleado, {foreignKey: "fk_Id_Empleado"})
Direccion_Empleado.belongsTo(Empleado, {foreignKey: "fk_Id_Empleado"})
Barrio_Municipio.hasMany(Direccion_Empleado, {foreignKey: "fk_Id_Barrio"})
Direccion_Empleado.belongsTo(Barrio_Municipio, {foreignKey: "fk_Id_Barrio"})

export default Direccion_Empleado