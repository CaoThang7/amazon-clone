const router = require('express').Router()
const adminCtrl = require('../controllers/adminCtrl')
const admin = require("../middlewares/admin");

router.post('/admin/add-product', admin, adminCtrl.addProduct)

router.get('/admin/get-products', admin, adminCtrl.getProduct)

router.post('/admin/delete-product', admin, adminCtrl.deleteProduct)

module.exports = router