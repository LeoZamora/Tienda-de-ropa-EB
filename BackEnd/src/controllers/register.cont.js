import Cliente from '../models/EntityModels/Cliente/ClienteModels.js'
import { connectionDB } from '../db/connection.js'
import { filters } from '../helpers/filters.js'
import bcrypt from 'bcrypt'

export const getCliente = async (req, res) => {
    const limit = 10;
    const page = 1;
    const table = Cliente

    try {
        const result = await filters.getData(limit, page, table)

        res.json({
            ok: true,
            result: result
        })  
    } catch (error) {
        console.log(error);
        res.status(500).json({error: 'Error al solicitar la peticion'})
    }
}

export const postClienteSql = async (req, res) => {
    const { Nombre1, Nombre2, Apellido1, Apellido2, Genero, Fecha_Nac, Users, Contraseña } = req.body;
    console.log(Fecha_Nac);
    const saltRound = 10;

    try {
        
        const hasPass = await bcrypt.hash(Contraseña, saltRound)

        const result = await connectionDB.query(`
            EXEC RegistrarClienteConUsuario 
            @Nombre1 = '${Nombre1}', 
            @Nombre2 = '${Nombre2}', 
            @Apellido1 = '${Apellido1}', 
            @Apellido2 = '${Apellido2}', 
            @Genero = '${Genero}', 
            @Fecha_Nac = '${Fecha_Nac}',
            @Users = '${Users}', 
            @Contraseña = '${hasPass}'
        `);
         res.json({
            status: "ok",
            result: "Creacion de cliente y usuario correctamente"
         });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
};

export const methods = {
    getCliente,
    postClienteSql
}