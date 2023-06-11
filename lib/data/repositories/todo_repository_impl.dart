import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/todo_model.dart';
import '../../domain/repositories/todo_repository.dart';
import '../providers/todo_datasource_provider.dart';

class TodoRepositoryImpl extends TodoRepository {
  final Ref _ref;
  TodoRepositoryImpl(this._ref);

  @override
  Future<List<TodoModel>> getTodos(int userId) async {
    final List<Map<String, dynamic>> result =
        await _ref.read(todoDatasourceProvider).getTodos(userId);
    return TodoModel.fromListMap(result);
  }

  @override
  Future<TodoModel> postTodo(TodoModel todo) async {
    final Map<String, dynamic> result =
        await _ref.read(todoDatasourceProvider).postTodo(todo.toMap());
    return todo.copyWith(id: result['id'] as int);
  }
}
