const Order = require("../models/order");
const mongoose = require("mongoose");
const orderCtrl = {
    orderProduct: async (req, res) => {
        try {
            Order.findOne({ user_id: req.body.user_id }).exec((error, order) => {
                if (error) return res.status(400).json({ error });
                if (order) {
                    res.json({ msg: "you have ordered" })
                } else {
                    const { user_id, cartItems, totalPrice, address, payment_methods } = req.body;
                    let order = new Order({
                        user_id: user_id,
                        cartItems: cartItems,
                        totalPrice: totalPrice,
                        address: address,
                        payment_methods: payment_methods,
                        orderedAt: new Date().getTime(),
                    });
                    order.save((error, order) => {
                        if (error) return res.status(400).json({ error });
                        if (order) {
                            // return res.status(201).json("order success!");
                            res.json({ msg: "order success!" })
                        }
                    });
                }
            });
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },

    orderUserId: async (req, res) => {
        try {
            if (!mongoose.isValidObjectId(req.params.userid)) {
                return res.status(400).send("Invalid order");
            }
            const order = await Order.find({ user_id: req.params.userid }).populate([
                "cartItems"
            ]);
            if (!order) {
                res.status(500).json({
                    success: false,
                    message: "not found",
                });
            }
            res.send(order);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },
}

module.exports = orderCtrl