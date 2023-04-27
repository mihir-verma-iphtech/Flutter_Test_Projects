import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_project/providers/data_api.dart';
import 'components/home_page_components.dart';

class HomePageRiverpod extends ConsumerWidget {
  const HomePageRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productData = ref.watch(dataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          width: double.infinity,
          child: productData.when(
            data: (snapshot) {
              List product = snapshot!.products;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: product.length,
                  itemBuilder: (context, index) =>
                      productsTiles(product: product[index], context: context));
            },
            loading: () => Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: const CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
            error: (error, stackTrace) {},
          ),
        ),
      ),
    );
  }
}
