import 'package:flutter/material.dart';
import 'package:test_ui/views/infinity_path_animation/infinity_painter.dart';

class InfinityPathAnimation extends StatefulWidget {
  const InfinityPathAnimation({Key? key}) : super(key: key);

  @override
  State<InfinityPathAnimation> createState() => _InfinityPathAnimationState();
}

class _InfinityPathAnimationState extends State<InfinityPathAnimation>
    with SingleTickerProviderStateMixin {
  int infinitiesLength = 9;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFECDAC3),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: BackButton(onPressed: () {
            _controller.dispose();
            Navigator.pop(context);
          }),
        ),
        body: Transform.rotate(
          angle: 3.14 / 2,
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return CustomPaint(
                  size: const Size(500, 500),
                  painter: InfinityPainter(
                    progress: _controller.value,
                    infinitiesLength: infinitiesLength,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
