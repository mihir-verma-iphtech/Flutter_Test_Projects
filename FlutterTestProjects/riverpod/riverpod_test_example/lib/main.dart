/*
---------------This is an Example of RiverPod State Management--------------

    1. First Step is to put Provider Scope around your app in runapp function
    2. Then Create folder structure for Proivders and Views
    3. After That create a provider for your particular purpose
    4. Then call that provider wherever you want to use it and extend that particular class by Consumer Widget in place of stateless widget 
    5. And if there is change in the value using ref.watch(ProviderName.notifier).state and it gives the value which is observable everywhere and changes reflects back to our app in every screens.
    ***------------Also Use ref.watch() as more as possible because it is used for both read and write functionalities-------*** 
*/
import 'package:flutter/material.dart';
import 'package:riverpod_test_example/models/movie.dart';
import 'package:riverpod_test_example/models/movie_model.dart';
import 'package:riverpod_test_example/providers/counter_provider.dart';
import 'package:riverpod_test_example/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(jsonData['data']);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
