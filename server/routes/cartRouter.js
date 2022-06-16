const router = require('express').Router()
const auth = require("../middlewares/auth");
const cartCtrl = require('../controllers/cartCtrl')

router.post('/add-to-cart', auth, cartCtrl.addCart)

router.get('/cart/:userid', auth, cartCtrl.cartUserId)

router.post('/cart/update', auth, cartCtrl.updateCart)

router.delete('/cart/delete/:id', auth, cartCtrl.deleteCart)

module.exports = router