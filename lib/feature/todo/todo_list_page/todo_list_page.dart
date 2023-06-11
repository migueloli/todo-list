import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/todo_provider.dart';
import '../provider/todo_state.dart';
import 'widgets/todo_list_tile.dart';
import 'widgets/todo_list_tile_shimmer.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(todoProvider, (_, next) => _listenForError(context, ref, next));

    final TodoState todoState = ref.watch(todoProvider);
    final list = todoState.list;
    final (isLoading, _) = _isLoadingAndIsError(todoState);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('To Do App'),
            floating: true,
            stretch: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
            ),
            sliver: SliverList.separated(
              itemCount: list.isNotEmpty ? list.length : 5,
              itemBuilder: (context, index) {
                if (isLoading && list.isEmpty) {
                  return const TodoListTileShimmer();
                }

                final todo = list[index];
                return TodoListTile(
                  title: todo.title,
                  completed: todo.completed,
                  onChanged: (value) => ref
                      .read(todoProvider.notifier)
                      .updateTodo(index, completed: value),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void _listenForError(context, ref, state) {
    final (_, isError) = _isLoadingAndIsError(state);
    if (isError) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
              child: const Text('Try again'),
              onPressed: () {
                context.pop();
                ref.read(todoProvider.notifier).fetchTodos();
              },
            ),
          ],
          title: const Text('Something went wrong...'),
        ),
      );
    }
  }

  /// first is loading state and second is error state
  (bool, bool) _isLoadingAndIsError(TodoState state) => switch (state) {
        LoadingTodoState() => (true, false),
        SuccessTodoState() => (false, false),
        ErrorTodoState() => (true, true),
      };
}
