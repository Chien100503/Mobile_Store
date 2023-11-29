const TodoService = require("../services/todo.service");

exports.createTodo = async (req, res, next) => {
  try {
    const { UserId, title, description, image, price } = req.body;
    console.log(req.body);
    let todo = await TodoService.createTodo(UserId, title, description, image, price);
    console.log(todo);
    // xoa model
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};

exports.getUserTodoList = async (req, res, next) => {
  try {
    const { UserId } = req.body;

    let todo = await TodoService.getTodoData(UserId);
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
