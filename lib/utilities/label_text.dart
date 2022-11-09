import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String? data;
  final double fontSize;
  const Label(String this.data, {this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, fontFamily: 'Roboto Slab'),
    );
  }
}
