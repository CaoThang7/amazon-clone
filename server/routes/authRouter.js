const router = require('express').Router()
const authCtrl = require('../controllers/authCtrl')
const auth = require("../middlewares/auth")

router.post('/register', authCtrl.register)

router.post('/login', authCtrl.login)

router.post('/tokenIsValid', authCtrl.validToken)

router.get('/', auth, authCtrl.getUser)

module.exports = router