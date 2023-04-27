import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Provider Example'),
      ),
      body: Container(
        color: Colors.cyan[600],
        child: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) => _mainPageCardTile(index),
        ),
      ),
    );
  }

  ListTile _mainPageCardTile(int index) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(
        'Task ${index + 1}',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.heart_fill,
          color: !true ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
