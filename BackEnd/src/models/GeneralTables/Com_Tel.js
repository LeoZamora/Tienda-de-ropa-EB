import { DataTypes } from "sequelize";
import { connectionDB } from "../../db/connection";
import Estados from "./StatusModel.js";

const Company_Tel = connectionDB.define("Company_Tel", {
    ID_Compañia: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Compañia"
    },
    Nombre_Compañia: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: "Nombre_Compañia",
    },
    Short_Name: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: "Short_Name"
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
    tableName: "Compañias_Telefonicas",
    timestamps: false
})

Estados.hasMany(Company_Tel, {foreignKey: 'fk_Id_Estado'})
Company_Tel.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'})

export default Company_Tel