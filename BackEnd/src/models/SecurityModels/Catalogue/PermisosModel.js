import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../../GeneralTables/StatusModel.js";

const Permisos = connectionDB.define('Permisos', {
    ID_Permiso: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_Permiso"
    },
    Nombre_Permiso: {
        type: DataTypes.STRING(250),
        allowNull: false,
        field: "Nombre_Permiso"
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
}, {
    tableName: "Permisos",
    timestamps: false
})

Estados.hasMany(Permisos, {foreignKey: "fk_Id_Estado"})
Permisos.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'})

export default Permisos