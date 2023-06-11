import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../datasources/todo_datasource.dart';

final todoDatasourceProvider = Provider(
  (ref) {
    final client = http.Client();
    ref.onDispose(() => client.close());
    return TodoDatasource(client);
  },
);
