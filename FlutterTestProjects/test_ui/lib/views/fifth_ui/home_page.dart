import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _opacity = _opacity == 0.0 ? 1.0 : 0.0;
      });
    });
  }

  List matrixT = List.filled(9, -1);
  bool filled = true;
  int chance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(
          'TIC TAC TOE',
          style: TextStyle(fontSize: 30, color: Colors.yellow.shade400),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.purple[50],
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _opacity,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.purple,
                    ),
                  ),
                  GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          matrixT[index] = filled ? 0 : 1;
                          filled = !filled;
                          chance++;
                        });
                      },
                      child: returningWidget(index),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: _validate(),
            child: const Text(
              'Winner',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Visibility(
            visible: chance >= 9 && !_validate(),
            child: const Text(
              'Game Over',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                matrixT = List.filled(9, -1);

                filled = true;
                chance = 0;
              });
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 40,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.door_back_door_sharp,
              size: 40,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  Widget _cross() {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: (22 / 7) / 4,
            child: Icon(
              CupertinoIcons.add,
              color: Colors.redAccent[100],
              size: 100,
            ),
          ),
          Transform.rotate(
            angle: (22 / 7) / 4,
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.red,
              size: 90,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    return Container(
      color: Colors.black,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: (22 / 7) / 4,
            child: Icon(
              CupertinoIcons.circle,
              color: Colors.greenAccent[100],
              size: 100,
            ),
          ),
          Transform.rotate(
            angle: (22 / 7) / 4,
            child: const Icon(
              CupertinoIcons.circle,
              color: Colors.green,
              size: 90,
            ),
          ),
        ],
      ),
    );
  }

  Widget returningWidget(int index) {
    if (matrixT[index] == 1) {
      return _circle();
    } else if (matrixT[index] == 0) {
      return _cross();
    } else {
      return Container(color: Colors.black);
    }
  }

  bool _validate() {
    if (matrixT[0] == matrixT[1] &&
        matrixT[1] == matrixT[2] &&
        matrixT[0] != -1) {
      return true;
    } else if (matrixT[3] == matrixT[4] &&
        matrixT[4] == matrixT[5] &&
        matrixT[3] != -1) {
      return true;
    } else if (matrixT[6] == matrixT[7] &&
        matrixT[7] == matrixT[8] &&
        matrixT[6] != -1) {
      return true;
    } else if (matrixT[0] == matrixT[3] &&
        matrixT[3] == matrixT[6] &&
        matrixT[0] != -1) {
      return true;
    } else if (matrixT[1] == matrixT[4] &&
        matrixT[4] == matrixT[7] &&
        matrixT[1] != -1) {
      return true;
    } else if (matrixT[2] == matrixT[5] &&
        matrixT[5] == matrixT[8] &&
        matrixT[2] != -1) {
      return true;
    } else if (matrixT[0] == matrixT[4] &&
        matrixT[4] == matrixT[8] &&
        matrixT[0] != -1) {
      return true;
    } else if (matrixT[2] == matrixT[4] &&
        matrixT[4] == matrixT[6] &&
        matrixT[2] != -1) {
      return true;
    } else {
      return false;
    }
  }
}
