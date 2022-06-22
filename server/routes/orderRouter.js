const router = require('express').Router()
const auth = require("../middlewares/auth");
const orderCtrl = require('../controllers/orderCtrl')

router.post('/order', auth, orderCtrl.orderProduct);

router.get('/order/:userid', auth, orderCtrl.orderUserId);

module.exports = router