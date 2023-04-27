import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../product_details_page.dart';

Widget productsTiles(
        {required Product product, required BuildContext context}) =>
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product)));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 1, right: 1, top: 1),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            productImage(product),
            const SizedBox(
              height: 8,
            ),
            productTitle(product),
            const SizedBox(
              height: 5,
            ),
            productRatingAndPrice(product)
          ],
        ),
      ),
    );

Padding productRatingAndPrice(Product product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        productIconAndText(
            title: product.rating.floor().toString(),
            icons: Icons.star,
            color: Colors.amber),
        productIconAndText(
            title: product.price.toString(),
            icons: Icons.currency_rupee,
            color: Colors.green),
      ],
    ),
  );
}

Row productIconAndText({String? title, IconData? icons, Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icons,
        color: color,
        size: 20,
      ),
      Text(
        title.toString(),
        style: textStyle(),
      ),
    ],
  );
}

FittedBox productTitle(Product product) {
  return FittedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        product.title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.pink[800],
        ),
      ),
    ),
  );
}

Expanded productImage(Product product) {
  return Expanded(
    flex: 4,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        product.thumbnail,
        fit: BoxFit.cover,
      ),
    ),
  );
}

TextStyle textStyle() => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
