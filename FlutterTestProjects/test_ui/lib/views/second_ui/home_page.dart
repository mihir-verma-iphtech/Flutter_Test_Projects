import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              //This Widget is Used to Create Curve in Flutter
              child: ClipPath(
                //We have to pass a clipper to calculate and pass values in it for clipping(Wave Clipper is just a name of the class for that implementation)
                clipper: DemoClipper(),
                child: Container(
                  color: Colors.deepOrangeAccent,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Class for Implementation of Curves in FLutter(It Extends CustomClipper<Path>Class)
class WaveClipper extends CustomClipper<Path> {
  //We have to override 2 functions in it......
  //most important one is this one....
  @override
  //This argument is the Size of the child specified in the clipper widget that is passed in it
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    //Path Object By which all the design is formed
    var path = Path();
    //Starting point for Our Curve Formation using calculations
    path.lineTo(0, size.height);

    //first controlling point specifies using Offset variable
    var firstStart = Offset(size.width / 5, size.height);
    //first end point specifies using Offset variable
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    // Actual function which creates a curve required 3 point starting, controlling and ending.....Controlling point has the main responsibility to control the curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    //second controlling point
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    // second end point
    var secondEnd = Offset(size.width, size.height - 10);

    // Actual function which creates a curve required 3 point starting, controlling and ending.....Controlling point has the main responsibility to control the curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    //Ending Point for Our Curve Formation
    path.lineTo(size.width, 0);
    //Then we close the Path Object and return it
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}

class DemoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    //Path Object By which all the design is formed
    var path = Path();
    //Starting point for Our Curve Formation using calculations
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width * 2 / 9,
        size.height / 2 - size.height * 5 / 14,
        size.width / 2,
        size.height / 2);
    path.quadraticBezierTo(
        size.width * 7 / 9,
        size.height / 2 + size.height * 5 / 14,
        size.width,
        size.height / 2 + size.height / 14);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip

    return true;
  }
}
