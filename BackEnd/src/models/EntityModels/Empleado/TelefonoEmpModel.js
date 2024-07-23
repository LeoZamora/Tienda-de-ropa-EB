import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../../GeneralTables/StatusModel.js";
import Empleado from "../Empleado/Empleado.Model.js"
import Company_Tel from "../../GeneralTables/Com_Tel.js";

const Telefono_Empleado = connectionDB.define('Telefono_Empleado', {
    ID_telefonoEmpleado: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_telefonoEmpleado"
    },
    Telefono: {
        type:  DataTypes.STRING(15),
        allowNull: false,
        field: "Telefono"
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
    fk_Id_Empleado: {
        type: DataTypes.INTEGER,
        references: {
            model: Empleado,
            key: "ID_Empleado"
        },
        allowNull: false,
        field: "fk_Id_Empleado"
    },
    fk_Id_Compañia: {
        type: DataTypes.INTEGER,
        references: {
            model: Company_Tel,
            key: "ID_Compañia"
        },
        allowNull: false,
        field: "fk_Id_Compañia"
    },
}, {
    tableName: "Telefono_Empleado",
    timestamps: false
})

Estados.hasMany(Telefono_Empleado, {foreignKey: "fk_Id_Estado"})
Telefono_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Empleado.hasMany(Telefono_Empleado, {foreignKey: "fk_Id_Empleado"})
Telefono_Empleado.belongsTo(Empleado, {foreignKey: "fk_Id_Empleado"})
Company_Tel.hasMany(Telefono_Empleado, {foreignKey: "fk_Id_Compañia"})
Telefono_Empleado.belongsTo(Company_Tel, {foreignKey: "fk_Id_Compañia"})

export default Telefono_Empleado