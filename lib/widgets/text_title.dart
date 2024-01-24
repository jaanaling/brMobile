import 'package:flutter/material.dart';

Widget textTitle({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    child: Text(
      title,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}
