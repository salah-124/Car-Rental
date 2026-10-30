import 'package:car_rental/shared/coustom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({
    super.key,
    required this.image,
    required this.location,
    required this.onPressed,
    required this.name,
  });
  final String image;
  final String location;
  final String name;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amberAccent,
              backgroundImage: AssetImage(image),
            ),
            CoustomText(
              text: location,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                CupertinoIcons.square_grid_4x3_fill,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        Gap(20),
        Row(
          children: [
            CoustomText(
              text: 'Hallo ,',
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            CoustomText(
              text: ' $name',
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ],
        ),
        Gap(10),
        CoustomText(
          text: 'Choose Any Car You Need ',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ],
    );
  }
}
