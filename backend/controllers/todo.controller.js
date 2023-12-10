const TodoService = require("../services/todo.service");
// muốn goijcais api nào
// là răng hè, có 1 api chơ mấy
// ý
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
    console.log("------", req.params);
    const UserId = req.params;
    let todo = await TodoService.getTodoData(UserId);
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
exports.postUserTodoList = async (req, res, next) => {
  try {
    const { UserId } = req.body;

    let todo = await TodoService.getTodoData(UserId);
    res.json({ status: true, success: todo });
  } catch (error) {
    next(error);
  }
};
exports.deleteTodo = async (req, res, next) => {
  try {
    const { id } = req.body;

    let deleted = await TodoService.deleteTodo(id);
    res.json({ status: true, success: deleted });
  } catch (error) {
    next(error);
  }
};
