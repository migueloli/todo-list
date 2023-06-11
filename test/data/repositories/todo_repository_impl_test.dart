import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/datasources/todo_datasource.dart';
import 'package:todo_list/data/providers/todo_datasource_provider.dart';
import 'package:todo_list/domain/models/todo_model.dart';
import 'package:todo_list/domain/providers/todo_repository_provider.dart';

import 'todo_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoDatasource>()])
void main() {
  final datasource = MockTodoDatasource();
  final container = ProviderContainer(
    overrides: [
      todoDatasourceProvider.overrideWithValue(datasource),
    ],
  );
  tearDownAll(container.dispose);

  group('getTodos', () {
    final body = [
      {
        'userId': 1,
        'id': 1,
        'title': 'Success Test',
        'completed': false,
      },
    ];
    test('Success', () async {
      when(datasource.getTodos(1)).thenAnswer((_) async => body);

      final result = await container.read(todoRepositoryProvider).getTodos(1);

      expect(result.first.id, body.first['id']);
      expect(result.first.userId, body.first['userId']);
      expect(result.first.title, body.first['title']);
      expect(result.first.completed, body.first['completed']);
      verify(datasource.getTodos(1)).called(1);
    });

    test('Failure', () async {
      when(datasource.getTodos(1)).thenThrow(Exception('Failed to load data'));

      expect(() => container.read(todoRepositoryProvider).getTodos(1),
          throwsA(isA<Exception>()));
      verify(datasource.getTodos(1)).called(1);
    });
  });

  group('postTodos', () {
    final body = {
      'userId': 1,
      'id': -1,
      'title': 'Success Test',
      'completed': false,
    };
    final todo = TodoModel.fromMap(body);

    test('Success', () async {
      const newId = 201;
      when(datasource.postTodo(todo.toMap()))
          .thenAnswer((_) async => todo.copyWith(id: newId).toMap());

      final result =
          await container.read(todoRepositoryProvider).postTodo(todo);

      expect(result.id, newId);
      expect(result.userId, body['userId']);
      expect(result.title, body['title']);
      expect(result.completed, body['completed']);
      verify(datasource.postTodo(todo.toMap())).called(1);
    });

    test('Failure', () async {
      when(datasource.postTodo(todo.toMap()))
          .thenThrow(Exception('Failed to load data'));

      expect(() => container.read(todoRepositoryProvider).postTodo(todo),
          throwsA(isA<Exception>()));
      verify(datasource.postTodo(todo.toMap())).called(1);
    });
  });
}
