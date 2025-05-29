import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key, required this.labelText, this.validator, this.controller,
  });
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
      ),
      validator:validator ,
      controller: controller,
    );
  }
}