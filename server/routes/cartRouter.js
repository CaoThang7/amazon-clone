const router = require('express').Router()
const auth = require("../middlewares/auth");
const cartCtrl = require('../controllers/cartCtrl')

router.post('/add-to-cart', auth, cartCtrl.addCart)

router.get('/cart/:userid', auth, cartCtrl.cartUserId)

module.exports = router