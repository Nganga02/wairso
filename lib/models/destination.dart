import 'package:flutter/material.dart';

class Destination{
  final int index;
  final String text;
  final TextStyle style = const TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: Color.fromARGB(255, 26, 145, 211),
  );

  Destination({required this.index, required this.text});
}