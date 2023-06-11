import '../models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos(int userId);
  Future<TodoModel> postTodo(TodoModel todo);
}
