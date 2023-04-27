import 'package:flutter/material.dart';

import 'components/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  double answer = 0;
  int lastOperandIndex = -1;
  double temp = 0;
  bool checkBodmas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: appBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: boxDecorationCustom(
                  start: Colors.pink, end: Colors.deepPurple),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: FittedBox(
                        child: Text(
                          'Result:- ',
                          style: textStyle(),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          answer.toStringAsFixed(5),
                          style: textStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: boxDecorationCustom(
                  start: Colors.blue, end: Colors.deepPurple),
              child: TextField(
                controller: _textController,
                enabled: true,
                keyboardType: TextInputType.none,
                textAlign: TextAlign.right,
                style: textStyle(),
                decoration: InputDecoration(
                  disabledBorder: borderDecoration(),
                  enabledBorder: borderDecoration(),
                  focusedBorder: borderDecoration(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: boxDecorationCustom(
                  start: Colors.indigo, end: Colors.deepPurple),
              child: GridView.builder(
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) {
                  if (index < 5) {
                    return operatorTiles(index + 10);
                  } else {
                    return numberTiles(index - 5);
                  }
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration boxDecorationCustom(
      {required Color start, required Color end, BorderRadius? borderRadius}) {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            start,
            end,
          ]),
      borderRadius: borderRadius,
    );
  }

  TextStyle textStyle() => const TextStyle(fontSize: 40, color: Colors.white);

  OutlineInputBorder borderDecoration() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
      gapPadding: 5,
    );
  }

  Widget numberTiles(int index) {
    return GestureDetector(
      onTap: () {
        _textController.text += index.toString();
        setState(
          () {
            if (true) {
              if (_textController.text.startsWith('-') &&
                  _textController.text.length == 2) {
                answer = double.parse(_textController.text);
              } else if (answer == 0 &&
                  _textController.text.endsWith('-$index')) {
                answer = -(index.toDouble());
              } else if (answer == 0) {
                answer = index.toDouble();
              } else {
                if (_textController.text.endsWith('+$index')) {
                  temp = answer;
                  answer += index;
                } else if (_textController.text.endsWith('-$index')) {
                  temp = answer;
                  answer -= index;
                } else if (_textController.text.endsWith('/$index')) {
                  temp = answer;
                  answer /= index;
                } else if (_textController.text.endsWith('*$index')) {
                  temp = answer;
                  answer *= index;
                } else if (checkConditon()) {
                } else if (_textController.text.contains(RegExp(r'[0-9]')) &&
                    lastOperandIndex == -1) {
                  answer = double.parse(
                      answer.toInt().toString() + index.toString());
                } else {
                  int num = int.parse(
                      _textController.text.substring(lastOperandIndex + 1));
                  // answer = answer * 10 + index;
                  if (_textController.text.endsWith('+$num')) {
                    answer = temp + num;
                  } else if (_textController.text.endsWith('-$num')) {
                    answer = temp - num;
                  } else if (_textController.text.endsWith('/$num')) {
                    answer = temp / num;
                  } else if (_textController.text.endsWith('*$num')) {
                    answer = temp * num;
                  }
                }
              }
            } else {
              // answer = evaluateBodmas();
              // checkBodmas = false;
            }
          },
        );
      },
      child: numbersTileStyle(index),
    );
  }

  Container numbersTileStyle(int index) {
    return Container(
      decoration: boxDecorationCustom(
        start: Colors.pink,
        end: Colors.purple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget operatorTiles(int index) {
    if (index == 10) {
      return operatorTileStyle(
          title: 'C',
          func: () {
            _textController.text = '';
            setState(() {
              answer = 0;
              lastOperandIndex = _textController.text.length - 1;
            });
          });
    } else if (index == 11) {
      return operatorTileStyle(
          title: '+',
          func: () {
            if (checkConditon()) {
            } else {
              _textController.text += '+';
            }
            lastOperandIndex = _textController.text.length - 1;
          });
    } else if (index == 12) {
      return operatorTileStyle(
          title: '-',
          func: () {
            if (checkConditon()) {
            } else {
              _textController.text += '-';
            }
            lastOperandIndex = _textController.text.length - 1;
          });
    } else if (index == 13) {
      return operatorTileStyle(
          title: '/',
          func: () {
            if (checkConditon()) {
            } else {
              checkBodmas = true;
              _textController.text += '/';
            }
            lastOperandIndex = _textController.text.length - 1;
          });
    } else if (index == 14) {
      return operatorTileStyle(
          title: '*',
          func: () {
            if (checkConditon()) {
            } else {
              checkBodmas = true;
              _textController.text += '*';
            }
            lastOperandIndex = _textController.text.length - 1;
          });
    } else {
      return Container();
    }
  }

  Widget operatorTileStyle({String? title, Function()? func}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: boxDecorationCustom(
          start: Colors.orange,
          end: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  bool checkConditon() => (_textController.text.endsWith('+') ||
      _textController.text.endsWith('-') ||
      _textController.text.endsWith('/') ||
      _textController.text.endsWith('*'));

//   double evaluateBodmas() {
//     int mul_div_index;
//     String evaluateString = _textController.text;
//     print(evaluateString);
//     double result = 0;
//     while (evaluateString.contains('+') ||
//         evaluateString.contains('-') ||
//         evaluateString.contains('*') ||
//         evaluateString.contains('/')) {
//       if (evaluateString.contains('*')) {
//         while (evaluateString.contains('*')) {
//           mul_div_index = evaluateString.indexOf('*');
//           result = double.parse(evaluateString.substring(
//                   evaluateString.substring(0, mul_div_index).lastIndexOf('+') +
//                       1,
//                   mul_div_index)) *
//               double.parse(evaluateString.substring(
//                   mul_div_index + 1,
//                   evaluateString.substring(mul_div_index, null).indexOf('+') ==
//                           -1
//                       ? null
//                       : evaluateString
//                           .substring(mul_div_index, null)
//                           .indexOf('+')));
//           evaluateString = evaluateString.replaceRange(
//               evaluateString.substring(0, mul_div_index).lastIndexOf('+') + 1,
//               evaluateString.substring(mul_div_index, null).indexOf('+') == -1
//                   ? null
//                   : evaluateString.substring(mul_div_index, null).indexOf('+'),
//               result.toString());
//         }
//       } else if (evaluateString.contains('/')) {
//         while (evaluateString.contains('/')) {
//           mul_div_index = evaluateString.indexOf('/');
//           result = double.parse(evaluateString[mul_div_index - 1]) /
//               double.parse(evaluateString[mul_div_index + 1]);
//           evaluateString = evaluateString.replaceRange(
//               mul_div_index - 1, mul_div_index + 2, result.toString());
//         }
//       } else {
//         print(evaluateString);
//         break;
//       }
//     }
//     // print(evaluateString);
//     return 0;
//   }
}



/*
  -3+7*9+2/3
*/