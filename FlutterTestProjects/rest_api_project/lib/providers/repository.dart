import 'package:flutter_riverpod/flutter_riverpod.dart';

class Repository extends Notifier<String> {
  String endpoints = "https://dummyjson.com";

  String getProducts = "/products";

  late String getProductsUrl;

  @override
  String build() {
    getProductsUrl = "$endpoints$getProducts";
    state = getProductsUrl;
    return state;
  }
}

final repoProvider = NotifierProvider<Repository, String>(
  () => Repository(),
);
