import { DataTypes } from "sequelize";
import {connectionDB} from "../../../db/connection.js"
import Estados from "../StatusModel.js";
import Departamento from "../Ubications/Departamento.js"

const Municipio = connectionDB.define('Municipio', {
    ID_Mun: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: 'ID_Mun'
    },
    Municipio: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: "Municipio"
    },
    Distrito: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: 'Distrito'
    },
    CodMun: {
        type: DataTypes.STRING(25),
        allowNull: false,
        field: "CodMun"
    },
    fk_Id_Depto: {
        type: DataTypes.INTEGER,
        references:{
            model: Departamento,
            key: "ID_Depto"
        },
        allowNull: false,
        field: "fk_Id_Depto"
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
        tableName: "Municipio",
        timestamps: false
})

Estados.hasMany(Municipio, {foreignKey: "fk_Id_Estado"})
Municipio.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Departamento.hasMany(Municipio, {foreignKey: "fk_Id_Depto"})
Municipio.belongsTo(Departamento, {foreignKey: "fk_Id_Depto"})

export default Municipio