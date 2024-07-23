import { Router } from "express";
import { methods } from "../controllers/auth.cont.js";
import { validations } from "../validations/validation.js";

const router = Router()

router.get('/users', methods.getUser);
router.post('/users/auth', validations.authUser ,methods.authUser)

export default router;