const router = require('express').Router()
const adminCtrl = require('../controllers/adminCtrl')
const admin = require("../middlewares/admin");

router.post('/admin/add-product', admin, adminCtrl.addProduct)

module.exports = router