import 'package:flutter/material.dart';

class CoustomCarBrand extends StatelessWidget {
  const CoustomCarBrand({
    super.key,
    required this.onTap,
    required this.carBrand,
  });
  final void Function() onTap;
  final String carBrand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.amber.shade600,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            carBrand,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
