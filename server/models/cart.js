const mongoose = require("mongoose");

const cartSchema = mongoose.Schema({
    product_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Product",
        required: true,
    },
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true,
    },
    quantity: {
        type: Number,
        required: true,
    },
});

module.exports = mongoose.model("Cart", cartSchema);