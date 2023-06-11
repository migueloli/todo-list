import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/todo_repository_impl.dart';
import '../repositories/todo_repository.dart';

final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(ref),
);
