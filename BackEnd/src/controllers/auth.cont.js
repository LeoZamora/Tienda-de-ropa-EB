import { filters } from "../helpers/filters.js";
import { login } from "../repositories/auth.repository.js"
import { generateJWT } from "../helpers/jwt.js"

export const getUser = async(req, res) => {
    const limit = 10;
    const page = 1;

    try {
        const user = await filters.getUsers(limit, page)

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