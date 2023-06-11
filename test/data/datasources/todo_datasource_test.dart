import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/data/datasources/todo_datasource.dart';

import 'todo_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('getTodos', () {
    final client = MockClient();
    final datasource = TodoDatasource(client);

    test('Success', () async {
      final body = [
        {
          'userId': 1,
          'id': 1,
          'title': 'Success Test',
          'completed': false,
        },
      ];
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(
          json.encode(body),
          200,
        ),
      );

      final result = await datasource.getTodos(1);

      expect(result.first['id'], body.first['id']);
      verify(client.get(any)).called(1);
    });

    test('Failure', () async {
      when(client.get(any)).thenThrow(Exception('Failed with 500'));
      expect(() => datasource.getTodos(1), throwsA(isA<Exception>()));
      verify(client.get(any)).called(1);
    });
  });

  group('postTodos', () {
    final client = MockClient();
    final datasource = TodoDatasource(client);
    final body = {
      'userId': 1,
      'id': 1,
      'title': 'Success Test',
      'completed': false,
    };

    test('Success', () async {
      when(client.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
          json.encode(body),
          201,
        ),
      );

      final result = await datasource.postTodos(body);

      expect(result['id'], body['id']);
      verify(client.post(any, body: anyNamed('body'))).called(1);
    });

    test('Failure', () async {
      when(client.post(any, body: anyNamed('body')))
          .thenThrow(Exception('Failed with 500'));
      expect(() => datasource.postTodos(body), throwsA(isA<Exception>()));
      verify(client.post(any, body: anyNamed('body'))).called(1);
    });
  });
}
