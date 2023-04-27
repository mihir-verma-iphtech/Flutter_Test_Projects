import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_ui/utils/app_routes.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Test UI Home Page',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.firstUI);
                  },
                  title: 'First UI'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.secondUI);
                  },
                  title: 'Second UI(Curve Implementation)'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.thirdUI);
                  },
                  title: 'Third UI(Animaion)'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.fourthUI);
                  },
                  title: 'Fourth UI(Day And Night Mode)'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.fifthUI);
                  },
                  title: 'Fifth UI(Tic Tac Toe Game)'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.sixthUI);
                  },
                  title: 'Sixth UI'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.seventhUI);
                  },
                  title: 'Seventh UI'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.eightUI);
                  },
                  title: 'Infinity Path Animation'),
              _uiButtonWidget(
                  func: () {
                    Navigator.of(context).pushNamed(AppRoute.ninthUI);
                  },
                  title: 'Cuppertino Widgets'),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _uiButtonWidget({Function()? func, String? title}) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent[400],
      ),
      child: FittedBox(
        child: Text(
          '$title',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
