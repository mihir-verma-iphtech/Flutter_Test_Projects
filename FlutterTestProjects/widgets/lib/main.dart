import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        color: Colors.green,
        home: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.purple,
              Colors.pink,
              Colors.orange,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: HomePage(),
        ),
      ),
    );
  }
}
