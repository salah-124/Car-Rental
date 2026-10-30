import 'dart:io';

import 'package:car_rental/features/admin/widgets/coustom_cardetailes.dart';
import 'package:car_rental/features/admin/widgets/coustom_dropdown.dart';
import 'package:car_rental/services/supa_service.dart';
import 'package:car_rental/shared/coustom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final model = TextEditingController();
  final price = TextEditingController();
  final engine = TextEditingController();
  final speed = TextEditingController();
  final seats = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SupaService supaService = SupaService();

  File? image;
  String? selectedBrand;

  final brand = ['Toyota', 'Honda', 'Ford', 'Chevrolet', 'Nissan'];

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => image = File(picked.path));
  }
  // Add Car

  Future<void> addcar() async {
    if (formKey.currentState!.validate()) {
      try {
        final data = await supaService.addCar(
          model: model.text,
          price: price.text,
          engine: engine.text,
          speed: speed.text,
          seats: seats.text,
          brand: selectedBrand.toString(),
          image: image!,
        );
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(70),

                const CoustomText(
                  text: 'Admin Page',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),

                const Gap(30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: image == null
                            ? null
                            : DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover,
                              ),
                        color: Colors.pink,
                      ),
                    ),

                    IconButton(
                      onPressed: pickImage,
                      icon: const Icon(
                        CupertinoIcons.cloud_upload,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const Gap(20),

                CoustomCardetailes(
                  controller1: model,
                  controller2: price,
                  controller3: engine,
                  controller4: speed,
                  controller5: seats,
                ),

                const Gap(15),

                CoustomDropdown(
                  valid: 'Please Select At Least One Item',
                  hint: 'Car Brand',
                  value: selectedBrand,
                  items: brand
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    setState(() => selectedBrand = value);
                  },
                ),

                const Gap(30),

                GestureDetector(
                  onTap: addcar,
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: CoustomText(
                        text: 'Add Car',
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
