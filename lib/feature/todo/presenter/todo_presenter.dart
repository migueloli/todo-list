import '../../../domain/models/todo_model.dart';

class TodoPresenter {
  final int userId;
  final int id;

  String title;
  set updateTitle(String? newTitle) => title = newTitle ?? title;

  bool completed;
  set updateCompleted(bool? newCompleted) =>
      completed = newCompleted ?? completed;

  TodoPresenter({
    required this.userId,
    required this.id,
    this.title = '',
    this.completed = false,
  });

  factory TodoPresenter.fromModel(TodoModel model) => TodoPresenter(
        userId: model.userId,
        id: model.id,
        title: model.title,
        completed: model.completed,
      );

  static List<TodoPresenter> fromListModel(List<TodoModel> todos) =>
      todos.map((e) => TodoPresenter.fromModel(e)).toList();

  TodoModel toModel() => TodoModel(userId, id, title, completed);
}
