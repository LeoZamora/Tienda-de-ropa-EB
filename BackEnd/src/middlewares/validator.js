import { validationResult } from "express-validator";

export const validation = async (req, res, next) => {
    try {
        validationResult(req).throw()
        return next()
    } catch (error) {
        res.status(403);
        res.send({errors: error.array()})        
    }
}