import { DataTypes } from "sequelize";
import {connectionDB} from "../../../db/connection.js"
import Estados from "../StatusModel.js";
import Municipio from "../Ubications/Municipio.js"

const Barrio_Municpio = connectionDB.define('Barrio_Municipio', {
    ID_Barrio: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Barrio"
    },
    Nombre: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: "Nombre"
    },
    fk_Id_Mun: {
        type: DataTypes.INTEGER,
        references: {
            model: Municipio,
            key: "ID_Mun"
        },
        allowNull: false,
        field: "fk_Id_Mun"
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
    tableName: "Barrio_Municipio",
    timestamps: false
})

Estados.hasMany(Barrio_Municpio, {foreignKey: "fk_Id_Estado"})
Barrio_Municpio.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Municipio.hasMany(Barrio_Municpio, {foreignKey: "fk_Id_Mun"})
Barrio_Municpio.belongsTo(Municipio, {foreignKey: "fk_Id_Mun"})

export default Barrio_Municpio