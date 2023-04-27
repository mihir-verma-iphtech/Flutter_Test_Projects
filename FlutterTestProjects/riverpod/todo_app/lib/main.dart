import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/src/views/todos_completed_page.dart';
import 'package:todo_app/src/views/todos_not_completed_page.dart';
import 'package:todo_app/src/views/todos_page.dart';
import 'package:todo_app/utils/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: appBarTheme(),
        scaffoldBackgroundColor: Colors.cyan[600],
      ),
      routes: {
        '/': (context) => const TodosHomePage(),
        '/home': (context) => const TodosHomePage(),
        '/completed': (context) => const TodosCompletedPage(),
        '/notCompleted': (context) => const TodosNotCompletedPage(),
      },
    );
  }
}
