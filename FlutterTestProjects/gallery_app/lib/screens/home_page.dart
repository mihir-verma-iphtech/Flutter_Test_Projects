import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/images_provider.dart';

List<String> viewImageFunction = [
  'Gridview',
  'Slider',
  'Listview',
  'Other\nListView',
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await ref.read(imagesProvider.notifier).pickImages();
                  if (ref.watch(imagesProvider).isEmpty) {
                    const snackBar = SnackBar(
                      content: Text(
                        'No Images Selected ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      backgroundColor: Colors.black12,
                      elevation: 0,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text(
                  'Pick Images',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
              viewButtonGridView()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox viewButtonGridView() {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => viewImageOptions(
          title: viewImageFunction[index],
          fun: () =>
              Navigator.of(context).pushNamed('/${viewImageFunction[index]}'),
        ),
      ),
    );
  }

  Widget viewImageOptions({String? title, Function()? fun}) => GestureDetector(
        onTap: fun,
        child: Card(
          child: Center(
            child: Text(
              title.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      );
}
