import { filters } from "../helpers/filters.js";
import { login } from "../repositories/auth.repository.js"
import { generateJWT } from "../helpers/jwt.js"
import Usuarios_Clientes from "../models/UserModels/UsuarioModels.js";

export const getUser = async(req, res) => {
    const limit = 10;
    const page = 1;
    const table = Usuarios_Clientes;

    try {
        const user = await filters.getData(limit, page, table)

        res.json({
            ok: true,
            user: user
        })
    } catch (error) {
        res.status(500).json({ error: 'Error interno del servidor' + error })
    }
}

export const authUser = async (req, res) => {
    const {Users, Contraseña} = req.body;

    try {
        const result = await login(Users, Contraseña);
        console.log(result);

        if (result.status == 'false') return res.status(400).json({message: 'Invalid User'})
        
        const token = await generateJWT(result.ID_Users, Users)
        console.log(token);

        return res.json({
            ok: true,
            uid: result.ID_Users,
            user: result.Users,
            token: token
        })

    } catch (error) {
        res.status(500).json({
            message: error.message
        })
    }
}

export const methods = {
    getUser,
    authUser
}