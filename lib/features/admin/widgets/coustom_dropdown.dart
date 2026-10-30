import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoustomDropdown extends StatelessWidget {
  const CoustomDropdown({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    required this.valid,
    required this.hint,
  });
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String? value;
  final String valid, hint;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        value == null ? valid : null;
      },
      items: items,
      onChanged: onChanged,
      hint: Text(hint),
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
