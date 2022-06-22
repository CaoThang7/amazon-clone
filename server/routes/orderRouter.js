const router = require('express').Router()
const auth = require("../middlewares/auth");
const orderCtrl = require('../controllers/orderCtrl')

router.post('/order', auth, orderCtrl.orderProduct);

module.exports = router