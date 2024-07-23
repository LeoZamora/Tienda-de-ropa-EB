import { DataTypes } from "sequelize";
import {connectionDB} from "../../../db/connection.js"
import Estados from "../StatusModel.js";
import Pais from "../Ubications/Pais.js"

const Departamento = connectionDB.define('Departamento', {
    ID_Depto: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false, 
        allowNull: false,
        field: "ID_Depto"
    },
    Departamento: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: "Departamento"
    },
    CodDepto: {
        type: DataTypes.STRING(25),
        allowNull: false,
        field: "CodDepto"
    },
    fk_Id_Pais: {
        type: DataTypes.INTEGER,
        references: {
            model: Pais,
            key: "ID_Pais"
        },
        allowNull: false,
        field: "CodDepto"
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
    tableName: "Departamento",
    timestamps: false
})

Estados.hasMany(Departamento, {foreignKey: "fk_Id_Estado"})
Departamento.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Pais.hasMany(Departamento, {foreignKey: "fk_Id_Pais"})
Departamento.belongsTo(Pais, {foreignKey: "fk_Id_Pais"})

export default Departamento