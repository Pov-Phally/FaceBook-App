import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  const CustomTF({
    super.key,
    required this.labelText,
    this.validator,
    this.controller,
    this.obscureText, this.suffixIcon,
  });
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon; // Uncomment if you want to use a suffix icon

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
    );
  }
}