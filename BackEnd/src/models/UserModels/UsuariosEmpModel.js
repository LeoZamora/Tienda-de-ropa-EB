import { DataTypes } from "sequelize";
import { connectionDB } from "../../db/connection";
import Empleado from "./Empleado.Model";

const Usuarios_Empleado = connectionDB.define('Usuarios_Empleado', {
    ID_Users: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: "ID_Users" 
    },
    Users: {
        type: DataTypes.STRING,
        field: "Users" 
    },
    Contraseña: {
        type: DataTypes.STRING,
        field: "Contraseña"
    },
    fk_Id_Empleado: {
        type: DataTypes.INTEGER,
        references: {
            model: Empleado,
            key: 'ID_Empleado'
        },
        allowNull: false
    },
    Fecha_Registro: {
        type: DataTypes.DATE,
        defaultValue: connectionDB.NOW
    }
}, {
    tableName: 'Usuarios_Empleado',
    timestamps: false
});

Empleado.hasMany(Usuarios_Empleado, {foreignKey: 'fk_Id_Empleado'});
Usuarios_Empleado.belongsTo(Empleado, {foreignKey: 'fk_Id_Empleado'})

export default Usuarios_Empleado;