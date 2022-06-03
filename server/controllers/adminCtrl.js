const Product = require("../models/product");

const adminCtrl = {
    addProduct: async (req, res) => {
        try {
            const { name, description, images, quantity, price, category } = req.body;
            let product = new Product({
                name,
                description,
                images,
                quantity,
                price,
                category,
            });
            product = await product.save();
            res.json(product);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },
}

module.exports = adminCtrl