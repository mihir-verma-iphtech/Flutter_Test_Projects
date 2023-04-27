import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_project/providers/repository.dart';

import '../models/products.dart';

class DataApi extends AsyncNotifier {
  @override
  FutureOr build() async {
    return await fetchData();
  }

  FutureOr<Products> fetchData() async {
    final String url = ref.watch(repoProvider);
    var response = await http.get(Uri.parse(url));
    var data = Products.fromJson(jsonDecode(response.body));
    return data;
  }
}

final dataProvider = AsyncNotifierProvider(() => DataApi());
