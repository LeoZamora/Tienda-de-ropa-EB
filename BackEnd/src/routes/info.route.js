import { Router } from "express";
import { methods } from "../controllers/dynamic.cont.js";

const router = Router();

router.get('/info/options', methods.getInfo);
router.get('/info/name', methods.getNamePage);

export default router;