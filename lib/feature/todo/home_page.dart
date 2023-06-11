import 'package:flutter/material.dart';

import 'widgets/todo_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => index < Colors.primaries.length
                    ? TodoListTile(
                        title: 'Test',
                        completed: false,
                        onChanged: (value) {},
                      )
                    : null,
              ),
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
}
