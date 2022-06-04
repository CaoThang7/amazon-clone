const router = require('express').Router()
const productCtrl = require('../controllers/productCtrl')
const auth = require("../middlewares/auth");

router.get('/user/products-category', auth, productCtrl.getProduct)

router.get('/user/products/search/:name', auth, productCtrl.searchProduct)

module.exports = router