// IMPORTS FROM PACKAGES
const express = require('express')
const mongoose = require("mongoose");
require('dotenv').config()
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/authRouter");
const adminRouter = require("./routes/adminRouter");
const productRouter = require("./routes/productRouter");
const cartRouter = require("./routes/cartRouter");
const orderRouter = require("./routes/orderRouter");
// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = process.env.MONGODB_URL;

// middleware
app.use(express.json())
app.use('/api', authRouter)
app.use('/api', adminRouter)
app.use('/api', productRouter)
app.use('/api', cartRouter)
app.use('/api', orderRouter)

// Connections
mongoose
    .connect(DB)
    .then(() => {
        console.log("Connected to MongoDB!!!");
    })
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connect ${PORT}`);
})