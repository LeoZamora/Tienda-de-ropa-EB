import register from './register.route.js'
import actionUser from './auth.route.js'

const indexRouter = [
    ('/register', register),
    ('/users', actionUser)
];

export default indexRouter