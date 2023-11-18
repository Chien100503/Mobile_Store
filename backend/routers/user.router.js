const router = require("express").Router();
const UserController = require("./../controllers/user.controller");

router.post("/register", UserController.register);
router.post("/login", UserController.register);






module.exports = router;
