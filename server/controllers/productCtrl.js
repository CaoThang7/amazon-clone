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
    
    // create a get request to search products and get them
    // /api/products/search/i
    searchProduct: async (req, res) => {
        try {
            const products = await Product.find({
                name: { $regex: req.params.name, $options: "i" },
            });

            res.json(products);
        } catch (e) {
            res.status(500).json({ error: e.message });
        }
    }
}

module.exports = productCtrl