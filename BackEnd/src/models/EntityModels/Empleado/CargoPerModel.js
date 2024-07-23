import { DataTypes } from "sequelize";
import {connectionDB} from "../../../db/connection.js"
import Estados from "../../GeneralTables/StatusModel.js"

const Cargo_Personal = connectionDB.define("Cargo_Personal", {
    ID_Cargo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Cargo"
    },
    Nombre_Cargo: {
        type: DataTypes.STRING(30),
        allowNull: false,
        field: "Nombre_Cargo"
    },
    Descripcion: {
        type: DataTypes.STRING(30),
        allowNull: false,
        field: "Descripcion"
    },
    Salario: {
        type: DataTypes.FLOAT,
        allowNull: false,
        field: "Salario"
    },
    Area_Cargo: {
        type: DataTypes.STRING(30),
        allowNull: false,
        field: "Area_Cargo"
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
    tableName: "Cargo_Personal",
    timestamps: false
})

Estados.hasMany(Cargo_Personal, {foreignKey: "fk_Id_Estado"})
Cargo_Personal.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})

export default Cargo_Personal