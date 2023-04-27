import 'package:flutter/material.dart';
import 'package:rest_api_project/models/products.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'components/product_details_page_components.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Opacity(
            opacity: 0.6,
            child: Column(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              sliderProductImages(controller, product),
              Expanded(
                flex: 3,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(45),
                    ),
                    color: Colors.purple[400],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        productBrandAndTitle(product),
                        divider(),
                        productDescription(product),
                        divider(),
                        productCategory(product),
                        divider(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              productRating(product),
                              productPrice(product),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Divider divider() {
    return const Divider(
      thickness: 1,
      color: Colors.white,
      indent: 20,
      endIndent: 20,
    );
  }
}
