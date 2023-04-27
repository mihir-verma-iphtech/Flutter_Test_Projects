import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/src/controllers/todos_provider.dart';
import 'package:todo_app/src/models/todos.dart';

import 'components/todos_list.dart';

class TodosCompletedPage extends ConsumerWidget {
  const TodosCompletedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todos> todoList =
        ref.read(todosProvider.notifier).completedOrNot(true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Completed To Do's"),
        ),
        body: todosListView(ctx: context, list: todoList));
  }
}
