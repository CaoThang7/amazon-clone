const User = require('../models/user')
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authCtrl = {
    register: async (req, res) => {
        try {
            const { name, email, password } = req.body;

            const existingUser = await User.findOne({ email });
            if (existingUser) {
                return res
                    .status(400)
                    .json({ msg: "User with same email already exists!" });
            }

            const hashedPassword = await bcryptjs.hash(password, 8);

            let user = new User({
                email,
                password: hashedPassword,
                name,
            });
            user = await user.save();
            res.json(user);
        } catch (err) {
            return res.status(500).json({ msg: err.message })
        }
    },
    login: async (req, res) => {
        try {
            const { email, password } = req.body;

            const user = await User.findOne({ email });
            if (!user) {
                return res
                    .status(400)
                    .json({ msg: "User with this email does not exist!" });
            }

            const isMatch = await bcryptjs.compare(password, user.password);
            if (!isMatch) {
                return res.status(400).json({ msg: "Incorrect password." });
            }

            const token = jwt.sign({ id: user._id }, "passwordKey");
            res.json({
                msg: 'Login Success!',
                token,
                ...user._doc
            });
        } catch (err) {
            return res.status(500).json({ msg: err.message })
        }
    },
}

module.exports = authCtrl