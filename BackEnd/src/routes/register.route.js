import { Router } from "express";
import { methods } from "../controllers/register.cont.js";
import { validations } from "../validations/validation.js";

const router = Router();

// router.get('/register', methods.getCliente),
router.get('/register', methods.getCliente)
router.post('/register', validations.postCliente, methods.postClienteSql)

export default router;