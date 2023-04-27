import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/images_provider.dart';

class StylishListViewImagesDisplay extends ConsumerWidget {
  const StylishListViewImagesDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List listImages = ref.read(imagesProvider.notifier).getImages();
    CarouselController controller1 = CarouselController();
    CarouselController controller2 = CarouselController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const FittedBox(child: Text('Other List View Display')),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.3,
              child: CarouselSlider.builder(
                carouselController: controller1,
                options: CarouselOptions(
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: const Duration(seconds: 4),
                  height: MediaQuery.of(context).size.height,
                ),
                itemCount: listImages.length,
                disableGesture: true,
                itemBuilder: (context, index, _) =>
                    _imagesTiles(listImages, index),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: CarouselSlider.builder(
                carouselController: controller2,
                options: CarouselOptions(
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: const Duration(seconds: 4),
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                itemCount: listImages.length,
                disableGesture: true,
                itemBuilder: (context, index, _) =>
                    _imagesTiles(listImages, index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _imagesTiles(List<dynamic> listImages, int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.file(
        listImages[index],
        fit: BoxFit.fill,
      ),
    );
  }
}
