import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";

const Empleado = connectionDB.define('Empleado', {
    ID_Empleado: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: "ID_Empleado",
        allowNull: false
    },
    Nombre1_Empleado: {
        type: DataTypes.STRING,
        field: "Nombre1_Empleado",
        allowNull: false
    },
    Nombre2_Empleado: {
        type: DataTypes.STRING,
        field: "Nombre2_Empleado",
        allowNull: false
    },
    Apellido1_Empleado: {
        type: DataTypes.STRING,
        field: "Apellido1_Empleado",
        allowNull: false
    },
    Apellido2_Empleado: {
        type: DataTypes.STRING,
        field: "Apellido2_Empleado",
        allowNull: false
    }, 
    No_INSS: {
        type: DataTypes.STRING(12),
        field: "No_INSS",
        allowNull: false
    },
    No_Cedula: {
        type: DataTypes.STRING(20),
        field: "No_INSS",
        allowNull: false
    }, 
    Fecha_Nac: {
        type: DataTypes.DATE,
        field: "Fecha_Nac",
        allowNull: false
    }, 
    Genero_Empleado: {
        type: DataTypes.CHAR(1),
        field: "Genero_Empleado",
        allowNull: false
    }
},{
    tableName: "Empleado",
    timestamps: false
});

export default Empleado;