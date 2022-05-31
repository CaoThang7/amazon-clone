// IMPORTS FROM PACKAGES
const express = require('express')
const mongoose = require("mongoose");
require('dotenv').config()
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/authRouter");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = process.env.MONGODB_URL;

// middleware
app.use(express.json())
app.use('/api', authRouter)

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