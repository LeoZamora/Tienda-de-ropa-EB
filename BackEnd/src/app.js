import express from 'express'
import config from './config.js';
import cors from 'cors'
import indexRouter from './routes/app.route.js';
import router from './routes/info.route.js';

const app = express();

// Settigns
app.set('port', config.port);

// Cors
app.use(cors({
    origin: 'http://localhost:3002',
    methods: ['GET, PUT, DELETE, POST'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

//R Routes
app.use('/api/v1', indexRouter);

export default app;