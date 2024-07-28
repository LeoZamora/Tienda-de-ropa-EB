import { filters } from '../helpers/filters.js';
import OptionsNB from '../models/GeneralTables/InfoPage/OptionsNB.js'
import NamePage from '../models/GeneralTables/InfoPage/NamesPage.js'

export const getInfo = async (req, res) => {
    const limit = 10;
    const page = 1;
    const table = OptionsNB

    try {
        const info = await filters.getData(limit, page, OptionsNB)
        res.json({
            ok: true,
            info: info
        })
    } catch (error) {
        console.log(error);
        res.status(500).json({
            error: 'Error al solicitar la peticion: ' + error
        })
    }
}

export const getNamePage = async (req, res) => {
    const limit = 10;
    const page = 1;
    const table = NamePage

    try {
        const name = await filters.getData(limit, page, table)
        res.json({
            ok: true,
            info: name
        })
    } catch (error) {
        res.status(500).json({
            error: 'Error al solicitar la peticion: ' + error 
        })
    }
}

export const methods = {
    getInfo,
    getNamePage
}