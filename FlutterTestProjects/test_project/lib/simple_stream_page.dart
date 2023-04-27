import 'dart:async';

import 'package:flutter/material.dart';

class NumberCreator {
  final _controller = StreamController<int>();
  var _count = 1;
  NumberCreator() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      _controller.sink.add(_count);

      _count++;
      if (_count > 11) {
        t.cancel();
        _controller.close();
      }
    });
  }

  Stream<int> get stream => _controller.stream;
}

class SimpleStream extends StatelessWidget {
  const SimpleStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test Project'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blueAccent,
              child: Center(
                child: StreamBuilder(
                  stream: NumberCreator()
                      .stream
                      .map((event) => 'Counter :- $event'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        'No Data For Now',
                        style: textStyle(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      return Text(snapshot.data.toString(), style: textStyle());
                    } else {
                      return Text(
                        'Done For Now',
                        style: textStyle(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle textStyle() => const TextStyle(color: Colors.white, fontSize: 30);
}
