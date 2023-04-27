import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    centerTitle: true,
    leading: const Icon(
      Icons.calculate_outlined,
      size: 40,
    ),
    actions: const [
      Icon(
        Icons.app_registration_rounded,
        size: 40,
      )
    ],
    title: const Text(
      "CALCULATOR",
      style: TextStyle(fontSize: 30),
    ),
    elevation: 0,
    backgroundColor: Colors.cyan[500],
  );
}
