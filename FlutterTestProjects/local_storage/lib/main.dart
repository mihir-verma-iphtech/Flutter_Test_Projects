import 'package:flutter/material.dart';
import 'package:local_storage/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme:
            const AppBarTheme(titleTextStyle: const TextStyle(fontSize: 30)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[700],
            textStyle: const TextStyle(
              fontSize: 28,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 10,
          ),
        ),
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
