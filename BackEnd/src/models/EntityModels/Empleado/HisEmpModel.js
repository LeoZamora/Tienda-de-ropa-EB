import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection";
import Estados from "../../GeneralTables/StatusModel";
import Empleado from "./Empleado.Model";
import Cargo_Personal from "./CargoPerModel.js"

const Historial_Cargo = connectionDB.define('Historial_Cargo', {
    ID_HistorialCargo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: false,
        allowNull: false,
        field: "ID_HistorialCargo"
    },
    Motivo_Nuevo_Cargo: {
        type: DataTypes.STRING,
        allowNull: false,
        field: "Motivo_Nuevo_Cargo"
    },
    Fecha_Ingreso: {
        type: DataTypes.DATE, 
        allowNull: false,
        field: "Fecha_Ingreso"
    },
    Autorizado_Por: {
        type: DataTypes.STRING(50),
        allowNull: false,
        field: "Autorizado_Por"
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
    fk_Id_CargoEmp: {
        type: DataTypes.INTEGER,
        references: {
            model: Cargo_Personal,
            key: "ID_Cargo"
        },
        allowNull: false,
        field: "fk_Id_CargoEmp"
    }
}, {
    tableName: "Historial_Cargo",
    timestamps: false
})

Estados.hasMany(Historial_Cargo, {foreignKey: "fk_Id_Estado"})
Historial_Cargo.belongsTo(Estados, {foreignKey: "fk_Id_Estado"})
Empleado.hasMany(Historial_Cargo, {foreignKey: "fk_Id_Empleado"})
Historial_Cargo.belongsTo(Empleado, {foreignKey: "fk_Id_Empleado"})
Cargo_Personal.hasMany(Historial_Cargo, {foreignKey: "fk_Id_CargoEmp"})
Historial_Cargo.belongsTo(Cargo_Personal, {foreignKey: "fk_Id_CargoEmp"})

export default Historial_Cargo