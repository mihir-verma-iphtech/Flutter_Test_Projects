import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/images_provider.dart';

class ListViewImagesDisplay extends ConsumerWidget {
  const ListViewImagesDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List listImages = ref.read(imagesProvider.notifier).getImages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: ListView.builder(
          itemCount: listImages.length,
          itemBuilder: (context, index) => _imagesTiles(listImages, index),
        ),
      ),
    );
  }

  Container _imagesTiles(List<dynamic> listImages, int index) {
    return Container(
      color: Colors.orange.shade200,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      child: Image.file(
        listImages[index],
      ),
    );
  }
}
