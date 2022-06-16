const Cart = require("../models/cart");
const Product = require("../models/product");
const User = require("../models/user");
const mongoose = require("mongoose");
const cartCtrl = {
    addCart: async (req, res) => {
        try {
            Cart.findOne({ user_id: req.body.user_id }).exec((error, cart) => {
                if (error) return res.status(400).json({ error });
                if (cart) {
                    //if cart already exists then update cart by quantity
                    const product_id = req.body.cartItems.product_id;
                    const item = cart.cartItems.find((c) => c.product_id == product_id);
                    let condition, update;
                    if (item) {
                        condition = { "user_id": req.body.user_id, "cartItems.product_id": product_id };
                        update = {
                            "$set": {
                                "cartItems.$": {
                                    ...req.body.cartItems,
                                    quantity: item.quantity + req.body.cartItems.quantity
                                }
                            },
                        }
                    } else {
                        condition = { user_id: req.body.user_id };
                        update = {
                            "$push": {
                                "cartItems": req.body.cartItems,
                            },
                        }
                    }
                    Cart.findOneAndUpdate(condition, update)
                        .exec((error, _cart) => {
                            if (error) return res.status(400).json({ error });
                            if (_cart) {
                                // return res.status(201).json({ cart: _cart });
                                return res.status(201).json("add to cart success!");
                            }
                        })
                } else {
                    //if cart not exist then create a new cart
                    const cart = new Cart({
                        user_id: req.body.user_id,
                        cartItems: [req.body.cartItems],
                    });
                    cart.save((error, cart) => {
                        if (error) return res.status(400).json({ error });
                        if (cart) {
                            // return res.status(201).json({ cart });
                            return res.status(201).json("add to cart success!");
                        }
                    });
                }
            });
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
                "cartItems.product_id"
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
    },

    //Update Cart
    updateCart: async (req, res) => {
        try {
            const { idProduct, idCart } = req.body;
            const product = await Product.findById(idProduct);
            const cart = await Cart.findById(idCart);

            if (cart.cartItems == null) {
                res.json({
                    msg: 'no item in cart!',
                })
            }

            if (cart.cartItems.length != 0) {
                for (let i = 0; i < cart.cartItems.length; i++) {
                    if (cart.cartItems[i].product_id.equals(product._id)) {
                        isProductFound = true;
                    }
                }
                if (isProductFound) {
                    let producttt = cart.cartItems.find((productt) =>
                        productt.product_id.equals(product._id)
                    );
                    producttt.quantity += 1; // update quantity 
                } else {
                    console.log("nope")
                }
            }
            cart = await cart.save();
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },

    //Delete Cart
    deleteCart: async (req, res) => {
        try {
            const { idProduct, idCart } = req.body;
            const product = await Product.findById(idProduct);
            const cart = await Cart.findById(idCart);

            for (let i = 0; i < cart.cartItems.length; i++) {
                if (cart.cartItems[i].product_id.equals(product._id)) {
                    if (cart.cartItems[i].quantity == 1) {
                        cart.cartItems.splice(i, 1);
                    } else {
                        cart.cartItems[i].quantity -= 1;
                    }
                }
            }
            cart = await cart.save();
            res.json(cart);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    }
}

module.exports = cartCtrl