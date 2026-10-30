import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  const CoustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color = Colors.white,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
