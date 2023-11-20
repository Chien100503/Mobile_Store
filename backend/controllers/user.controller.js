const UserService = require("../services/user.service");
const userModel = require("../model/user.model");

exports.register = async (req, res, next) => {
  try {
    console.log("check info::", req.body);
    const { email, password } = req.body;
    // const successRes = await UserService.registerUser(email, password);
    const user = await userModel.findOne({ email: email });
    console.log("---------", user);
    if (user) {
      return res.status(409).json({ message: "Email already exists" });
    }

    const successRes = await userModel.create({ email: email, password: password });
    console.log("check create user", successRes);
    res.status(200).json({
      status: true,
      success: "User Register successfully",
    });
  } catch (error) {
    throw error;
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    const user = await UserService.checkUser(email);

    if (!user) {
      throw new Error("User don't exist");
    }

    const isMatch = await user.comparePassword(password);
    if (isMatch === false) {
      console.log("run at here");
      throw new Error("Incorrect Password");
    }

    let tokenData = { _id: user._id, email: user.email };

    const token = await UserService.generateToken(tokenData, "secretKey", "1h");
    console.log("run at her2e", token);
    res.status(200).json({ status: true, token: token });
  } catch (error) {
    throw error;
  }
};
