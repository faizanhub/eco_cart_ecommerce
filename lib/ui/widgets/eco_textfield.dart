import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:flutter/material.dart';

class EcoTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Color fillColor;

  EcoTextField({
    required this.controller,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.fillColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        border: InputBorder.none,
      ),
      obscureText: obscureText ? true : false,
    );
  }
}
