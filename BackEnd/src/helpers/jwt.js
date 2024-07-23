import jwt from 'jsonwebtoken'
import config from '../config.js'

export const generateJWT = (uid, name) => {
    return new Promise((resolve, reject) => {
        const payload = {uid, name};

        jwt.sign(payload, config.jwtKey, {
            expiresIn: '5h'
        }, (err, token) => {
            if (err) {
                reject('Error on generated JWT');
            } else {
                resolve(token)
            }
        });
    });
}