import { body } from "express-validator";
import {validation} from '../middlewares/validator.js'

export const postCliente = [
    body('Nombre1', 'Ingrese un nombre valido')
        .exists()
        .isLength({min: 5}),
    body('Apellido1', 'Ingrese un nombre valido')
        .exists()
        .isLength({min: 2}),
    body('Genero', 'Ingrese un genero valido')
        .exists()
        .isLength({max: 1}),
    (req, res, next) => {
        validation(req, res, next);
    }
]

export const postUser = [
    body('Users', 'Ingrese un usuario')
        .exists()
        .isEmail()
        .isLength({min: 8}),
    body('Contraseña', 'Ingrese una contraseña')
        .exists()
        .isLength({min: 5}),
    (req, res, next) => {
        validation(req, res, next);
    }
]

export const authUser = [
    body('Users', 'Ingrese un usuario')
        .exists()
        .isEmail()
        .isLength({min: 10}),
    body('Contraseña', 'Ingrese una contraseña')
        .exists()
        .isLength({min: 5}),
    (req, res, next) => {
        validation(req, res, next);
    }
]

export const validations = {
    postCliente,
    postUser,
    authUser
}