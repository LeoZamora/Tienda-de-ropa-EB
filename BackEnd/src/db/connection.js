import config from "../config.js";
import { Sequelize } from "sequelize";

export const connectionDB = new Sequelize(config.dbDatabase, config.dbUser, config.dbPass, {
    host: config.dbServer,
    dialect: "mssql",
    port: config.dbPort
})
 
const getSqlConnection = () => {
    return connectionDB;
}

export {getSqlConnection}