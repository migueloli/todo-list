import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/providers/todo_repository_provider.dart';
import '../presenter/todo_presenter.dart';
import 'todo_state.dart';

final todoProvider = StateNotifierProvider.autoDispose<TodoProvider, TodoState>(
    (ref) => TodoProvider(ref)..fetchTodos());

class TodoProvider extends StateNotifier<TodoState> {
  final Ref _ref;

  TodoProvider(this._ref) : super(LoadingTodoState([]));

  List<TodoPresenter> get todoList => switch (state) {
        LoadingTodoState() => state.list,
        SuccessTodoState() => state.list,
        ErrorTodoState() => state.list,
      };

  Future<void> fetchTodos() async {
    final localTodoList = todoList;
    state = LoadingTodoState(localTodoList);
    try {
      final result = await _ref.read(todoRepositoryProvider).getTodos(1);
      state = SuccessTodoState(TodoPresenter.fromListModel(result));
    } on Exception {
      state = ErrorTodoState(
        localTodoList,
        'Something went wrong, showing older list.',
      );
    }
  }

  Future<void> updateTodo(int index, {String? title, bool? completed}) async {
    final localTodoList = todoList;
    state = LoadingTodoState(localTodoList);
    localTodoList[index].updateTitle = title;
    localTodoList[index].updateCompleted = completed;
    state = SuccessTodoState(localTodoList);
  }

  Future<void> addTodo(String title) async {
    final localTodoList = todoList;
    final todo = TodoPresenter(
      userId: 1,
      id: -1,
      title: title,
      completed: false,
    );

    state = LoadingTodoState(localTodoList);

    try {
      final result =
          await _ref.read(todoRepositoryProvider).postTodo(todo.toModel());
      localTodoList.add(TodoPresenter.fromModel(result));
      state = SuccessTodoState(localTodoList);
    } on Exception {
      state = ErrorTodoState(
        localTodoList,
        'Something went wrong, showing older list.',
      );
    }
  }
}
