import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';
import 'components/home_page_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Products> fetchData() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    var data = Products.fromJson(jsonDecode(response.body));
    return data;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          width: double.infinity,
          child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var product = snapshot.data!.products;
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: product.length,
                    itemBuilder: (context, index) => productsTiles(
                        product: product[index], context: context));
              } else {
                return Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: const CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
