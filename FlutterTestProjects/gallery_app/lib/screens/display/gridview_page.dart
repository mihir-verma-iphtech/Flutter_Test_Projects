import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/images_provider.dart';

class GridViewImagesDisplay extends ConsumerWidget {
  const GridViewImagesDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List listImages = ref.read(imagesProvider.notifier).getImages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: GridView.builder(
          itemCount: listImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => _imagesTiles(listImages, index),
        ),
      ),
    );
  }

  Container _imagesTiles(List<dynamic> listImages, int index) {
    return Container(
      color: Colors.orange.shade200,
      height: 50,
      padding: const EdgeInsets.all(10),
      child: Image.file(
        listImages[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
