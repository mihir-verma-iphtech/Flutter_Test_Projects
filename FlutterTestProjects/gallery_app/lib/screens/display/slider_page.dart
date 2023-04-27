import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/images_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderImagesDisplay extends ConsumerWidget {
  const SliderImagesDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List listImages = ref.read(imagesProvider.notifier).getImages();
    CarouselController controller = CarouselController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                autoPlayInterval: const Duration(seconds: 4),
                height: MediaQuery.of(context).size.height / 1.5,
              ),
              itemCount: listImages.length,
              itemBuilder: (context, index, _) =>
                  _imagesTiles(listImages, index),
            ),
          ),
        ),
      ),
    );
  }

  Container _imagesTiles(List<dynamic> listImages, int index) {
    return Container(
      color: Colors.orange.shade200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Image.file(
        listImages[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
