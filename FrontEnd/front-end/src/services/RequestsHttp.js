import axios from "axios";
import { BASE_URL } from "./URL.js";

export const getUser = async () =>{
    try {
        const result = await axios.get(`${BASE_URL}/users`)
        return result.data
    } catch (error) {
        console.log(error);
    }
}

export const loginUser = async (user, pass) =>{
    try {
        const result = await axios.post(`${BASE_URL}/users/auth`, {
            Users: user,
            Contraseña: pass
        })
        return result.data.token
    } catch (error) {
        console.log("Error "+ error);
    }
}

export const postCliente = async (user) => {
    let data = {
        Nombre1: user.Nombre,
        Apellido1: user.Apellido,
        Genero: user.Genero,
        Users: user.Users,
        Contraseña: user.Contraseña
    }
        
    return new Promise((resolve, reject) => {
        axios.post(`${BASE_URL}/register`, data).then((response) => {
            resolve(response);
        }).catch(err => {
            reject(err.response ? err.response: {
                data: {
                    code: 404,
                    msg: 'Error de conexion'
                }
            })
        })
    })
}
