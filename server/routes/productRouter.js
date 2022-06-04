const router = require('express').Router()
const productCtrl = require('../controllers/productCtrl')
const auth = require("../middlewares/auth");

router.get('/user/products-category', auth, productCtrl.getProduct)



module.exports = router