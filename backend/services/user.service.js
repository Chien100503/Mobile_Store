const UserModel = require("../model/user.model");

class UserService {
  static async registerUser(email, password) {
    try {
      return await UserModel.create({ email: email, password: password });
    } catch (err) {
      throw err;
    }
  }
  static async checkUser(email) {
    try {
      
    } catch (error) {
      throw err;
    }
  }
}

module.exports = UserService;
