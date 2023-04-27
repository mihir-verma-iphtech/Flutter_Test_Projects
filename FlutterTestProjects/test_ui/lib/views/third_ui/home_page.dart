import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _firstX = 20;
  double _firstY = 20;
  double _secondX = 20;
  double _secondY = 20;

  BorderRadius _borderRadiusFirst = BorderRadius.circular(20);
  BorderRadius _borderRadiusSecond = BorderRadius.circular(20);

  Color _colorFirst = const Color.fromARGB(255, 66, 165, 245);
  Color _colorSecond = const Color.fromARGB(198, 255, 152, 61);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: _firstX,
            left: _firstY,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: _borderRadiusFirst,
                color: _colorFirst,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            bottom: _secondX,
            right: _secondY,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: _borderRadiusSecond,
                color: _colorSecond,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: func,
      ),
    );
  }

  func() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _firstX = Random().nextInt(360).toDouble() + 20;
        _firstY = Random().nextInt(360).toDouble() + 20;
        _secondX = Random().nextInt(360).toDouble() - 20;
        _secondY = Random().nextInt(360).toDouble() - 20;
        _borderRadiusFirst =
            BorderRadius.circular(Random().nextInt(60).toDouble());
        _borderRadiusSecond =
            BorderRadius.circular(Random().nextInt(60).toDouble());
        _colorFirst = Color.fromRGBO(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255).toDouble());
        _colorSecond = Color.fromRGBO(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255).toDouble());
      });
    });
  }
}
//----------------Geeks For Geeks Example---------------------

// class _HomePageState extends State<HomePage> {
//   double _width = 70;
//   double _height = 70;
//   Color _color = Colors.green;
//   BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);
//   @override
//   Widget build(BuildContext context) {
//     double? h = 60;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GeeksForGeeks'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: AnimatedContainer(
//           width: _width,
//           height: _height,
//           decoration: BoxDecoration(
//             color: _color,
//             borderRadius: _borderRadius,
//           ),
//           duration: Duration(seconds: 1),
//           curve: Curves.fastOutSlowIn,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.play_arrow),
//         backgroundColor: Colors.green,
//         onPressed: () {
//           setState(() {
//             // random generator
//             final random = Random();

//             // random dimension generator
//             _width = random.nextInt(500).toDouble();
//             _height = random.nextInt(500).toDouble();

//             // random color generator
//             _color = Color.fromRGBO(
//               random.nextInt(300),
//               random.nextInt(300),
//               random.nextInt(300),
//               1,
//             );

//             // random radius generator
//             _borderRadius =
//                 BorderRadius.circular(random.nextInt(100).toDouble());
//           });
//         },
//       ),
//     );
//   }
// }
