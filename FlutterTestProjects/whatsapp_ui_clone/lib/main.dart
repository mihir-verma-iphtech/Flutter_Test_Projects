import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/src/views/home_page.dart';
import 'package:whatsapp_ui_clone/utils/color_scheme.dart';

import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColorScheme.backgroundColor,
        primarySwatch: Colors.teal,
        appBarTheme: appBarTheme(),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
