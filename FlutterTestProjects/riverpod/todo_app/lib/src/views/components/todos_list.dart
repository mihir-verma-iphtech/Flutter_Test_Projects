import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/src/controllers/todos_provider.dart';

import '../../models/todos.dart';

Widget todosListView(
    {BuildContext? ctx, required List<Todos> list, bool toggle = false}) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    itemCount: list.length,
    itemBuilder: (context, index) =>
        todoItemTile(item: list[index], toggle: toggle),
    separatorBuilder: (_, __) => const SizedBox(
      height: 20,
    ),
  );
}

Widget todoItemTile({Todos? item, required bool toggle}) {
  return Material(
    borderRadius: BorderRadius.circular(20),
    elevation: 10,
    child: Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.red,
          Colors.deepOrange,
          Colors.orange,
          Colors.yellow
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Consumer(
        builder: (_, ref, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item!.taskName}',
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  (toggle)
                      ? ref.read(todosProvider.notifier).toggle(item)
                      : null;
                },
                icon: Icon(
                  (item.isCompleted)
                      ? CupertinoIcons.bookmark_fill
                      : CupertinoIcons.clear_circled_solid,
                  size: 25,
                  color: (item.isCompleted) ? Colors.green : Colors.red,
                ),
              )
            ],
          );
        },
      ),
    ),
  );
}
