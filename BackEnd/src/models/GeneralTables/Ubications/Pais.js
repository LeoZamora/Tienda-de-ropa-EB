import { DataTypes } from "sequelize";
import {connectionDB} from "../../../db/connection.js"
import Estados from "../StatusModel.js";

const Pais = connectionDB.define('Pais', {
    ID_Pais: {
        type: DataTypes.CHAR(5),
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Pais"
    },
    Nombre_Pais: {
        type: DataTypes.STRING(20),
        allowNull: false,
        field: "Nombre_Pais"
    },
    Codigo_Pais: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: "Codigo_Pais"
    },
    Codigo_Postal: {
        type: DataTypes.INTEGER,
        allowNull: false,
        field: "Codigo_Postal"
    },
    Ubicacion: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: 'Ubicacion'
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
   tableName: "Pais",
    timestamps: false
})

Estados.hasMany(Pais, {foreignKey: "fk_Id_Estado"})
Pais.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'})

export default Pais