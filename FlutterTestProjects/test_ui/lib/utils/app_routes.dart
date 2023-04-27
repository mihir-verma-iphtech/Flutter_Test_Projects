import 'package:flutter/material.dart';
import 'package:test_ui/main_home_page.dart';
import 'package:test_ui/views/first_ui/home_page.dart' as first;
import 'package:test_ui/views/infinity_path_animation/infinity_path_animation.dart';
import 'package:test_ui/views/second_ui/home_page.dart' as second;
import 'package:test_ui/views/third_ui/home_page.dart' as third;
import 'package:test_ui/views/fourth_ui/home_page.dart' as fourth;
import 'package:test_ui/views/fifth_ui/home_page.dart' as fifth;
import 'package:test_ui/views/sixth_ui/home_page.dart' as sixth;
import 'package:test_ui/views/seventh_ui/home_page.dart' as seventh;
import 'package:test_ui/views/ninth_ui/home_page.dart' as ninth;

class AppRoute {
  static const String firstUI = '/firstUI';
  static const String secondUI = '/secondUI';
  static const String thirdUI = '/thirdUI';
  static const String fourthUI = '/fourthUI';
  static const String fifthUI = '/fifthUI';
  static const String sixthUI = '/sixthUI';
  static const String seventhUI = '/seventhUI';
  static const String eightUI = '/eightUI';
  static const String ninthUI = '/ninthUI';

  static Map<String, Widget Function(BuildContext)> appRouteMapRoute(
          BuildContext ctx) =>
      {
        '/': (ctx) => const MainHomePage(),
        AppRoute.firstUI: (ctx) => const first.HomePage(),
        AppRoute.secondUI: (ctx) => const second.HomePage(),
        AppRoute.thirdUI: (ctx) => const third.HomePage(),
        AppRoute.fourthUI: (ctx) => const fourth.HomePage(),
        AppRoute.fifthUI: (ctx) => const fifth.HomePage(),
        AppRoute.sixthUI: (ctx) => const sixth.HomePage(),
        AppRoute.seventhUI: (ctx) => const seventh.HomePage(),
        AppRoute.eightUI: (ctx) => const InfinityPathAnimation(),
        AppRoute.ninthUI: (ctx) => const ninth.HomePage(),
      };
}
