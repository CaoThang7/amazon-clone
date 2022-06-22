const Order = require("../models/order");
const orderCtrl = {
    orderProduct: async (req, res) => {
        try {
            const { user_id, cartItems, totalPrice, address, payment_methods } = req.body;
            let order = new Order({
                user_id: user_id,
                cartItems: [cartItems],
                totalPrice: totalPrice,
                address: address,
                payment_methods: payment_methods,
                orderedAt: new Date().getTime(),
            });
            order = await order.save();
            res.json(order);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    }
}

module.exports = orderCtrl