const Cart = require("../models/cart");
const mongoose = require("mongoose");
const cartCtrl = {
    //add cart
    addCart: async (req, res) => {
        try {
            let cart = new Cart({
                product_id: req.body.product_id,
                user_id: req.body.user_id,
                quantity: req.body.quantity,
            });
            cart = await cart.save();

            if (!cart) return res.status(400).send("the cart cannot be created!");
            res.send(cart);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },
    //find cart = id user
    cartUserId: async (req, res) => {
        try {
            if (!mongoose.isValidObjectId(req.params.userid)) {
                return res.status(400).send("Invalid Cart Id");
            }
            const carts = await Cart.find({ user_id: req.params.userid }).populate([
                "product_id",
                "user_id",
            ]);
            if (!carts) {
                res.status(500).json({
                    success: false,
                    message: "not found",
                });
            }
            res.send(carts);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    }

}

module.exports = cartCtrl