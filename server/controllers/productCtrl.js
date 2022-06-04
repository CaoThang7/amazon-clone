const Product = require("../models/product");
const productCtrl = {
    // if(query.category) get all product 
    // if(not found category) no get all product
    getProduct: async (req, res) => {
        try {
            const products = await Product.find({ category: req.query.category });
            res.json(products);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    },
}

module.exports = productCtrl