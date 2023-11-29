const TodoModel = require("../model/todo.model");
const UserModel = require("../model/user.model");
const { Types } = require("mongoose");
class TodoService {
  static async createTodo(UserId, title, description, image, price) {
    const createTodo = new TodoModel({ UserId, title, description, image, price });
    console.log("dfsdfsf", createTodo);

    return await createTodo.save();
  }
  static async getTodoData(UserId) {
    console.log(UserId);
    const todoData = await TodoModel.findOne({ UserId: new Types.ObjectId(UserId) });
    console.log(todoData);
    return todoData;
  }
}

module.exports = TodoService;
