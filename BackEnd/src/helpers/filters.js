import Usuarios_Clientes from "../models/UserModels/UsuarioModels.js";

const getUsers = async (limit, page) =>{
    const offset = (page-1)*limit;
    const options = {
        limit: limit,
        offset: offset
    }

    const result = await Usuarios_Clientes.findAndCountAll(options)
    const pages = Math.ceil(result.count/limit);

    return {
        page: page,
        limit: limit,
        totalPages: pages,
        totalUsers: result.count,
        result: result.rows
    }
}

export const filters = {
    getUsers
}