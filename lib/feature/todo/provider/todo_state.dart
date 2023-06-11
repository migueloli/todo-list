import '../presenter/todo_presenter.dart';

sealed class TodoState {
  final List<TodoPresenter> list;

  TodoState(this.list);
}

class SuccessTodoState extends TodoState {
  SuccessTodoState(super.list);
}

class LoadingTodoState extends TodoState {
  LoadingTodoState(super.list);
}

class ErrorTodoState extends TodoState {
  final String message;

  ErrorTodoState(super.list, this.message);
}
