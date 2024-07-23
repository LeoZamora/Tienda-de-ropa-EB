import app from './src/app.js'
import { getSqlConnection } from './src/db/connection.js';

const connection = getSqlConnection()

connection.authenticate()
    .then(() => {
        console.log('Conexión a la base de datos exitosa');
        app.listen(app.get('port'), () => {
            console.log('Servidor iniciado en el puerto: ', app.get('port'));
        });
    })
    .catch(err => {
        console.error('Error al conectar a la base de datos:', err);
});