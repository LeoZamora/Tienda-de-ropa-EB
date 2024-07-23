import Usuarios_Clientes from "../models/UserModels/UsuarioModels.js";
import bcrypt from 'bcrypt'

export const login = async (userFind, passFind) => {
    try {
        const user = await Usuarios_Clientes.findOne({where: {Users: userFind} });
        if (!user) {
            return {
                status: "false",
                msg: "Usuario no encontrado"
            }
        }

        const isPassValid = await bcrypt.compare(passFind, user.Contraseña)
        
        if (isPassValid === true) {
            return user;
        } else {
            return {
                status: "false",
                msg: "Contraseña no valida"
            }
        }
    } catch (error) {
        console.log('Error: '+ error);
    }
}