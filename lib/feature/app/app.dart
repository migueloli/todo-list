import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../todo/todo_list_page/todo_list_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) =>
                const TodoListPage(),
          ),
        ],
      ),
    );
  }
}
