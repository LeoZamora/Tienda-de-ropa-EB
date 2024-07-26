import register from './register.route.js'
import actionUser from './auth.route.js'
import infoDynamic from './info.route.js'

const indexRouter = [
    ('/register', register),
    ('/users', actionUser),
    ('/info', infoDynamic)
];

export default indexRouter