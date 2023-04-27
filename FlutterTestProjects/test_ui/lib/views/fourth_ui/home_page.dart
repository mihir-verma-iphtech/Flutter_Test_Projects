import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _morning = true;
  bool _afternoon = false;
  bool _evening = false;
  bool _night = false;

  Color _colorAtmTop = Colors.yellow;
  Color _colorAtmBottom = Colors.orange;
  Color _colorHorizonTop = Colors.orange;
  Color _colorHorizonBottom = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 220,
                  decoration: BoxDecoration(
                    gradient:
                        gradient(color1: _colorAtmTop, color2: _colorAtmBottom),
                  ),
                ),
                _afternoon == true ? _mySun() : Container(),
                _night == true ? _myMoon() : Container(),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 510,
                  decoration: BoxDecoration(
                    gradient: gradient(
                        color1: _colorHorizonTop, color2: _colorHorizonBottom),
                  ),
                ),
                (_afternoon == true || _night == true) ? Container() : _mySun(),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510,
                    color: Colors.blue[200],
                  ),
                ),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510 * 5 / 6,
                    color: Colors.blue[300],
                  ),
                ),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510 * 4 / 6,
                    color: Colors.blue[400],
                  ),
                ),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510 * 3 / 6,
                    color: Colors.blue[500],
                  ),
                ),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510 * 2 / 6,
                    color: Colors.blue[600],
                  ),
                ),
                ClipPath(
                  clipper: WavesClipper(),
                  child: Container(
                    height: 510 / 6,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _morning = true;
                _afternoon = _evening = _night = false;
                _colorAtmTop = Colors.yellow;
                _colorAtmBottom = Colors.orange;
                _colorHorizonTop = Colors.orange;
                _colorHorizonBottom = Colors.deepOrange;
              });
            },
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            child: const Text('M'),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _afternoon = true;
                _morning = _evening = _night = false;
                _colorAtmTop = Colors.yellow.shade800;
                _colorAtmBottom = Colors.yellow;
                _colorHorizonTop = Colors.yellow;
                _colorHorizonBottom = Colors.blue;
              });
            },
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            child: const Text('A'),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _evening = true;
                _afternoon = _morning = _night = false;
                _colorAtmTop = Colors.orange;
                _colorAtmBottom = Colors.deepOrangeAccent;
                _colorHorizonTop = Colors.deepOrangeAccent;
                _colorHorizonBottom = Colors.deepOrange;
              });
            },
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            child: const Text('E'),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _night = true;
                _afternoon = _evening = _morning = false;
                _colorAtmTop = Colors.deepPurple;
                _colorAtmBottom = Colors.blue.shade800;
                _colorHorizonTop = Colors.blue.shade800;
                _colorHorizonBottom = Colors.blue;
              });
            },
            backgroundColor: Colors.white24,
            foregroundColor: Colors.white,
            child: const Text('N'),
          ),
        ],
      ),
    );
  }

  Positioned _myMoon() {
    return Positioned(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.grey.shade100,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 120,
              width: 120,
              color: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }

  Positioned _mySun() {
    return Positioned(
      top: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 150,
              width: 150,
              color: Colors.yellow[400],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 140,
              width: 140,
              color: Colors.yellow[600],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 120,
              width: 120,
              color: Colors.yellow[800],
            ),
          ),
        ],
      ),
    );
  }
}

class WavesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    print(size);
    path.moveTo(0.0, size.height);
    path.lineTo(0.0, size.height - size.height * 0.76);

    var firstControlPoint =
        Offset(size.width * 2 / 7, size.height - size.height * 0.84);
    var firstPoint = Offset(size.width / 2, size.height - size.height * 0.70);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        Offset(size.width * 5 / 7, size.height - size.height * 0.58);
    var secondPoint = Offset(size.width, size.height - size.height * 0.76);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

gradient({required Color color1, required Color color2}) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      color1,
      color2,
    ],
  );
}
