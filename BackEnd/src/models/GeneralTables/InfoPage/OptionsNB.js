import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../StatusModel.js";

const OptionsNB = connectionDB.define('Options', {
    ID_Option: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: 'ID_Option'
    },
    OptionNav: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: 'OptionNav'
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
    tableName: 'OptionsInNavbar',
    timestamps: false
});

Estados.hasMany(OptionsNB, {foreignKey: 'fk_Id_Estado'});
OptionsNB.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'});

export default OptionsNB;