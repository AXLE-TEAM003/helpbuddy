import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 224, 15, 15),
    content: Text(message),
    duration: const Duration(seconds: 4), // Optional: Control the duration
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Color.fromARGB(255, 0, 105, 0),
    content: Text(message),
    duration: const Duration(seconds: 2), // Optional: Control the duration
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
