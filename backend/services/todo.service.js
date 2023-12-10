const TodoModel = require("../model/todo.model");
const UserModel = require("../model/user.model");
const { Types } = require("mongoose");
class TodoService {
  static async createTodo(UserId, title, description, image, price) {
    const createTodo = new TodoModel({ UserId, title, description, image, price });
    console.log("check------", createTodo);

    return await createTodo.save();
  }
  static async getTodoData(UserId) {
    console.log("run at hẻe", UserId);
    // const todoData = await TodoModel.find({ UserId: UserId.UserId }).exec();
    const todoData = await TodoModel.find(UserId);
    console.log(todoData);
    return todoData;
  }

  static async deleteTodo(id) {
    console.log("run at hẻe", UserId);
    // const todoData = await TodoModel.find({ UserId: UserId.UserId }).exec();
    const deleted = await TodoModel.findOneAndDelete({ _id: id });
    return deleted;
  }
}

module.exports = TodoService;
