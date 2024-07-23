import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../../GeneralTables/StatusModel.js";

const Perfiles = connectionDB.define('Perfiles', {
    ID_Perfil: {
        type: DataTypes.INTEGER,
        autoIncrement: false,
        primaryKey: true,
        allowNull: false,
        field: "ID_Perfil"
    },
    Nombre_Perfil: {
        type: DataTypes.STRING(50),
        field: "Nombre_Perfil",
        allowNull: false
    },
    Descripcion: {
        type: DataTypes.STRING(300),
        field: "Descripcion",
        allowNull: false
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
    Fecha_Registro: {
        type: DataTypes.DATE,
        defaultValue: connectionDB.NOW,
        field: "Fecha_Registro",
        allowNull: false
    } 
},{
    tableName: "Perfiles",
    timestamps: false
});

Estados.hasMany(Perfiles, {foreignKey: 'fk_Id_Estado'})
Perfiles.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'})


export default Perfiles