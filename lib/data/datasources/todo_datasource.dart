import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoDatasource {
  final http.Client _client;
  static const _base = 'https://jsonplaceholder.typicode.com';

  const TodoDatasource(this._client);

  Future<List<Map<String, dynamic>>> getTodos(int userId) async {
    final path = Uri.parse('$_base/users/$userId/todos/');
    final response = await _client.get(path);
    return (json.decode(response.body) as List).cast();
  }

  Future<Map<String, dynamic>> postTodos(Map<String, dynamic> todo) async {
    final path = Uri.parse('$_base/todos/');
    final response = await _client.post(path, body: json.encode(todo));
    return json.decode(response.body);
  }
}
