import { DataTypes } from "sequelize";
import { connectionDB } from "../../db/connection.js";

const Estados = connectionDB.define('Estados', {
    Id_Estado: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "Id_Estado"
    },
    Estado: {
        type: DataTypes.STRING(20),
        allowNull: false,
        field: "Estado"
    }
}, {
    tableName: "Estados",
    timestamps: false
})

export default Estados