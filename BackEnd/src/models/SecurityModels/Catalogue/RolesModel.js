import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../../GeneralTables/StatusModel.js";

const Roles = connectionDB.define('Roll_Privilegio', {
    ID_Roll: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Roll"
    },
    Nombre_Roll: {
        type: DataTypes.STRING(250),
        allowNull: false,
        field: "Nombre_Roll"
    },
    Descripcion: {
        type: DataTypes.STRING(250),
        allowNull: false,
        field: "Descripcion"
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
},{
    tableName: "Roll_Privilegio",
    timestamps: false
})

Estados.hasMany(Roles, {foreignKey: 'fk_Id_Estado'})
Roles.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'})

export default Roles