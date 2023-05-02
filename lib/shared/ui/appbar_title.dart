import 'package:flutter/material.dart';

// a function that returns dynamic appbar title
Widget appBarTitle(String title) {
  return Text(
    title.toUpperCase(),
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
      fontSize: 18,
    ),
  );
}
