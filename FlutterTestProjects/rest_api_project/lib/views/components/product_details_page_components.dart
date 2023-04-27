import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/products.dart';

Row productPrice(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Price:- ',
        style: textStyle(),
      ),
      const Icon(
        Icons.currency_rupee,
        color: Colors.green,
        size: 30,
      ),
      Text(
        product.price.toString(),
        style: textStyle(),
      ),
    ],
  );
}

Row productRating(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Rating:- ',
        style: textStyle(),
      ),
      const Icon(
        Icons.star,
        color: Colors.amber,
        size: 30,
      ),
      Text(
        '${product.rating.floor()}',
        style: textStyle(),
      ),
    ],
  );
}

Text productCategory(Product product) {
  return Text(
    product.category.toUpperCase(),
    style: const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  );
}

Padding productDescription(Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Text(
      product.description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  );
}

Wrap productBrandAndTitle(Product product) {
  return Wrap(
    spacing: 10,
    alignment: WrapAlignment.center,
    children: [
      FittedBox(
        child: Text(
          product.brand.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      FittedBox(
        child: Text(
          product.title.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Container sliderProductImages(CarouselController controller, Product product) {
  return Container(
    padding: const EdgeInsets.only(bottom: 15, top: 50),
    child: CarouselSlider.builder(
      carouselController: controller,
      itemCount: product.images.length,
      options: CarouselOptions(
        autoPlay: true,
      ),
      itemBuilder: (context, index, realIndex) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            product.images[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

TextStyle textStyle() => const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
