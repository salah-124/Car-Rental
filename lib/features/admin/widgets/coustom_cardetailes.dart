import 'package:car_rental/shared/coustom_text.dart';
import 'package:car_rental/shared/coustom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoustomCardetailes extends StatelessWidget {
  const CoustomCardetailes({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.controller5,
  });
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  final TextEditingController controller5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
          text: 'Car Details : ',
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        Gap(10),
        CoustomTextFeild(hintText: 'Car Model :', controller: controller1),
        Gap(15),
        CoustomTextFeild(hintText: 'Car Price :', controller: controller2),
        Gap(15),
        CoustomTextFeild(hintText: 'Car Engine :', controller: controller3),
        Gap(15),
        CoustomTextFeild(hintText: 'Car Speed :', controller: controller4),
        Gap(15),
        CoustomTextFeild(hintText: 'Car Seats :', controller: controller5),
        Gap(15),

      ],
    );
  }
}
