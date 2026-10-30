import 'package:car_rental/shared/coustom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoustomCarCard extends StatelessWidget {
  const CoustomCarCard({
    super.key,
    required this.carImage,
    required this.carBrand,
    required this.speed,
    required this.price,
    required this.onPressed,
  });
  final String carImage;
  final String carBrand;
  final String speed;
  final String price;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade600,
      child: Column(
        children: [
          Gap(10),
          Image.network(carImage, height: 100),
          Gap(5),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                CoustomText(
                  text: carBrand,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                Gap(5),
                CoustomText(
                  text: 'Speed : $speed ',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                Gap(5),
                CoustomText(
                  text: 'Price : $price ',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),

                IconButton(
                  onPressed: onPressed,
                  icon: Icon(CupertinoIcons.add_circled),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
