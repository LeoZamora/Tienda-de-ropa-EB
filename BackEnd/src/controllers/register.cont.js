import Cliente from '../models/EntityModels/Cliente/ClienteModels.js'
import { connectionDB } from '../db/connection.js'
import bcrypt from 'bcrypt'

export const getCliente = async (req, res) => {
    try {
        const result = await Cliente.findAll()

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
    const { Nombre1, Nombre2, Apellido1, Apellido2, Genero, Users, Contraseña } = req.body;

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