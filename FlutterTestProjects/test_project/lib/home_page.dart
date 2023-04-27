import 'package:flutter/material.dart';
import 'package:test_project/explore_stream.dart';
import 'package:test_project/simple_stream_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Project HomePage'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button(
              context,
              title: 'Simple Stream',
              func: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SimpleStream()));
              },
            ),
            button(
              context,
              title: 'Explore Stream',
              func: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ExploreStream()));
              },
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton button(BuildContext context,
      {Function()? func, String? title}) {
    return ElevatedButton(
        onPressed: func,
        child: Text(
          title.toString(),
          style: const TextStyle(fontSize: 20),
        ));
  }
}
