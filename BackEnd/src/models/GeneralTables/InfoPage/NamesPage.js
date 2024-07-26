import { DataTypes } from "sequelize";
import { connectionDB } from "../../../db/connection.js";
import Estados from "../StatusModel.js";

const NamePage = connectionDB.define('NamePage', {
    ID_Name: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
        field: 'ID_Name'
    },
    NamePage: {
        type: DataTypes.STRING(100),
        allowNull: false,
        field: 'NamePage'
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
    tableName: 'NamesPage',
    timestamps: false
});

Estados.hasMany(NamePage, {foreignKey: 'fk_Id_Estado'});
NamePage.belongsTo(Estados, {foreignKey: 'fk_Id_Estado'});

export default NamePage;