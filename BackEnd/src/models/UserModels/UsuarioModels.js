import { DataTypes } from "sequelize";
import { connectionDB } from "../../db/connection.js";
import Cliente from "../EntityModels/Cliente/ClienteModels.js";

const Usuarios_Clientes = connectionDB.define('Usuarios_Clientes', {
    ID_Users: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
      field: "ID_Users"
    },
    Users: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: "Users"
    },
    Contraseña: {
      type: DataTypes.STRING(100),
      allowNull: false,
      field: "Contraseña"
    },
    fk_Id_Cliente: {
      type: DataTypes.INTEGER,
      references: {
        model: Cliente,
        key: 'ID_Cliente',
      },
      allowNull: false,
      field: "fk_Id_Cliente"
    },
    Fecha_Registro: {
      type: DataTypes.DATE,
      defaultValue: connectionDB.NOW,
      field: "Fecha_Registro"
    },
  }, {
    tableName: 'Usuarios_Clientes',
    timestamps: false,
});

Cliente.hasMany(Usuarios_Clientes, {foreignKey: 'fk_Id_Cliente'});
Usuarios_Clientes.belongsTo(Cliente, {foreignKey: 'fk_Id_Cliente'})


export default Usuarios_Clientes;