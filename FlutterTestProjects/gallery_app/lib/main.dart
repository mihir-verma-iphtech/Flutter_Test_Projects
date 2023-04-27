import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery_app/screens/display/gridview_page.dart';
import 'package:gallery_app/screens/display/listview_page.dart';
import 'package:gallery_app/screens/display/slider_page.dart';
import 'package:gallery_app/screens/display/stylish_listview.dart';
import 'package:gallery_app/screens/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: appBarTheme(),
        iconTheme: iconTheme(),
        scaffoldBackgroundColor: Colors.orange[100],
        elevatedButtonTheme: buttonTheme(),
        cardTheme: cardTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const HomePage(),
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      '/Gridview': (context) => const GridViewImagesDisplay(),
      '/Slider': (context) => const SliderImagesDisplay(),
      '/Listview': (context) => const ListViewImagesDisplay(),
      '/Other\nListView': (context) => const StylishListViewImagesDisplay(),
    };
  }

  CardTheme cardTheme() {
    return CardTheme(
      color: Colors.purple[600],
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  ElevatedButtonThemeData buttonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        elevation: 12,
        backgroundColor: Colors.orange,
      ),
    );
  }

  IconThemeData iconTheme() => const IconThemeData(size: 30);

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      color: Colors.amber[600],
      titleTextStyle: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
