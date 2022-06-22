const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
    user_id: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    cartItems: [],
    totalPrice: {
        type: Number,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    payment_methods: {
        type: String,
        required: true
    },
    orderedAt: {
        type: Number,
        required: true,
    },
    status: {
        type: Number,
        default: 0,
    },
});


module.exports = mongoose.model('Order', orderSchema);