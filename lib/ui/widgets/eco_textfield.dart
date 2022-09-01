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
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  EcoTextField({
    required this.controller,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
      keyboardType: keyboardType,
    );
  }
}
