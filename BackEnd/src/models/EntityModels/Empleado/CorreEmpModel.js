import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Empleado from "./Empleado.Model";

const Correo_Empleado = connectionDB.define("Correo_Empleado", {
    ID_correoEmpleado: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_correoEmpleado"
    },
    Correo_Empleado: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: "Correo_Empleado"
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
    }
}, {
    tableName: "Correo_Empleado",
    timestamps: false
})

Estados.hasMany(Correo_Empleado, {foreignKey: "fk_Id_Estado"})
Correo_Empleado.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Empleado.hasMany(Correo_Empleado, {foreignKey: "fk_Id_Empleado"})
Correo_Empleado.belongsTo(Empleado, {foreignKey: "fk_Id_Empleado"})

export default Correo_Empleado