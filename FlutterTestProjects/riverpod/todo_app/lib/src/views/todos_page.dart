import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/src/controllers/todos_provider.dart';
import 'package:todo_app/src/models/todos.dart';
import 'package:todo_app/src/views/components/todos_list.dart';

class TodosHomePage extends ConsumerWidget {
  const TodosHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosList = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do's"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/completed');
          },
          icon: const Icon(
            CupertinoIcons.bookmark_fill,
            color: Colors.orange,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notCompleted');
            },
            icon: const Icon(
              CupertinoIcons.clear_circled_solid,
              color: Colors.yellow,
              size: 25,
            ),
          ),
        ],
      ),
      body: todosListView(ctx: context, list: todosList, toggle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todosProvider.notifier).todoListAdd(
                Todos(taskName: 'Task ${todosList.length}'),
              );
        },
        backgroundColor: Colors.teal,
        child: const Icon(
          CupertinoIcons.add,
          size: 25,
        ),
      ),
    );
  }
}
