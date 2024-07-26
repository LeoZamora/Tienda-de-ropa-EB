import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";


const Cliente = connectionDB.define('Clientes',{
    Id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: 'ID_Cliente'
    },
    Nombre1: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: 'Nombre1_Cliente'
    },
    Nombre2: {
        type: DataTypes.STRING(50),
        allowNull: true,
        field: 'Nombre2_Cliente'
    },
    Apellido1: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: 'Apellido1_Cliente'
    },
    Apellido2: {
        type: DataTypes.STRING(50),
        allowNull: true,
        field: 'Apellido2_Cliente'
    },
    Genero: {
        type: DataTypes.CHAR(1),
        allowNull: false,
        field: 'Genero_Cliente'
    },
    Fecha_registroCliente: {
        type: DataTypes.DATE,
        defaultValue: connectionDB.NOW,
        allowNull: false,
        field: "Fecha_registroCliente"
    },
    Fecha_Nac: {
        type: DataTypes.DATE,
        allowNull: true,
        field: 'Fecha_Nac'
    }
},{
    tableName: 'Clientes',
    timestamps: false
});

export default Cliente