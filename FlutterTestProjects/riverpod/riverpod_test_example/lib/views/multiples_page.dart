import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_example/providers/counter_provider.dart';

//This is the class where we used provider therefore we extends it with with Consumer Widget instead of stateless
class MultiplesPage extends ConsumerWidget {
  const MultiplesPage({super.key});

  // It then gives 2 parameters BuildContext and WidgetRef
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //This is for reading current value of The provider and to use it somewhere
    var num = ref.watch(CounterProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              //This Statement Changes states in our App
              ref.watch(CounterProvider.notifier).state++;
              // ref.watch(nam.notifier).state = '';
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              //This Statement Changes states in our App
              ref.watch(CounterProvider.notifier).state--;
              // ref.watch(nam.notifier).state = '';
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: List.generate(
                20,
                (index) => Text(
                  ' $num * ${index + 1} = ${num * (index + 1)}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
