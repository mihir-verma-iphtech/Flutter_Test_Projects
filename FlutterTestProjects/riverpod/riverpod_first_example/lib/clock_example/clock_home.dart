import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_first_example/clock_example/clock_provider.dart';

//-------------------------Using Consumer Widget------------------------------

class ClockExample extends ConsumerWidget {
  const ClockExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime time = ref.watch(clockProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Live Clock'),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            width: 200,
            child: FittedBox(
              child: Column(
                children: [
                  Text('${time.hour} : ${time.minute} : ${time.second}'),
                  Text('${time.day} / ${time.month} / ${time.year} '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



//-----------------------Same Example Using Consumer------------------------
// class ClockExample extends StatelessWidget {
//   const ClockExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Live Clock'),
//         ),
//         body: Center(
//           child: SizedBox(
//             height: 300,
//             width: 200,
//             child: FittedBox(
//               child: Consumer(
//                 builder: (context, ref, child) {
//                   final DateTime time = ref.watch(clockProvider);
//                   return Column(
//                     children: [
//                       Text('${time.hour} : ${time.minute} : ${time.second}'),
//                       Text('${time.day} / ${time.month} / ${time.year} '),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



//-----------------------Same Example Using Consumer in StateFul Widget------------------------
// class ClockExample extends StatefulWidget {
//   const ClockExample({super.key});

//   @override
//   State<ClockExample> createState() => _ClockExampleState();
// }

// class _ClockExampleState extends State<ClockExample> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Live Clock'),
//         ),
//         body: Center(
//           child: SizedBox(
//             height: 300,
//             width: 200,
//             child: FittedBox(
//               child: Consumer(
//                 builder: (context, ref, child) {
//                   final DateTime time = ref.watch(clockProvider);
//                   return Column(
//                     children: [
//                       Text('${time.hour} : ${time.minute} : ${time.second}'),
//                       Text('${time.day} / ${time.month} / ${time.year} '),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





//-----------------------Same Example Using ConsumerWidget in StateFul Widget------------------------
// class ClockExample extends ConsumerStatefulWidget {
//   const ClockExample({super.key});

//   @override
//   ConsumerState<ClockExample> createState() => _ClockExampleState();
// }

// class _ClockExampleState extends ConsumerState<ClockExample> {
//   var _change = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Live Clock'),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: SizedBox(
//                 height: 300,
//                 width: 200,
//                 child: FittedBox(
//                   child: Consumer(
//                     builder: (context, ref, child) {
//                       final DateTime time = ref.watch(clockProvider);
//                       _change = time.second;
//                       return Column(
//                         children: [
//                           Text(
//                               '${time.hour} : ${time.minute} : ${time.second}'),
//                           Text('${time.day} / ${time.month} / ${time.year} '),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             Text(_change.toString()),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//             child: const Icon(
//               Icons.change_circle_outlined,
//               size: 50,
//             ),
//             onPressed: () {
//               setState(() {});
//             }),
//       ),
//     );
//   }
// }
