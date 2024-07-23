import jwt from 'jsonwebtoken'
import config from '../config.js'

const authMiddleware = async (req, res, next) => {
    const token = req.headers.authorization;

    console.log(req.headers);
    if (!token) {
        return res.status(401).json({message: 'Token de autorizacion no proporcionado'});
    }

    try {
        const {id, user} = jwt.verify(token, config.jwtKey);
        req.Users = user;
        req.Id = id

        next()
    } catch (error) {
        console.error('Error al buscar al usuario', error);
        return res.status(500).json({message: 'Error interno en el servidor'})
    }
}

export {authMiddleware}