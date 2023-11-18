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

    const successRes = await userModel.create({ ...req.body });
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

    const user = UserService.checkUser(email);

    if (!user) {
      throw new Error("User dont exist");
    }
  } catch (error) {
    throw error;
  }
};
