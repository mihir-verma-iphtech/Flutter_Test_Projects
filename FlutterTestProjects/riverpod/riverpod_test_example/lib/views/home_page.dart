import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_example/providers/counter_provider.dart';
import 'package:riverpod_test_example/views/multiples_page.dart';

// final StateProvider<int> counter = StateProvider<int>((ref) => 0);
// final StateProvider name = StateProvider((ref) => 'Mihir');
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var count = ref.watch(counter);
    // var n = ref.watch(name);

    var counter = ref.watch(CounterProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MultiplesPage(),
                ),
              );
            },
            icon: Icon(
              Icons.next_plan_outlined,
              size: 40,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //This Statement Changes states in our App
          ref.watch(CounterProvider.notifier).state++;
          // ref.watch(nam.notifier).state = '';
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
