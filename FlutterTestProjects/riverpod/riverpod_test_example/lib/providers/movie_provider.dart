import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_example/models/movie.dart';
import 'package:riverpod_test_example/models/movie_model.dart';

class MoviesP extends StateNotifier<List<Movie>> {
  final movies = Movie.fromJson(jsonData);
}
