import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EcoCustomRow extends StatelessWidget {
  final String startText;
  final String endText;
  final VoidCallback onTap;

  EcoCustomRow(
      {required this.startText, required this.endText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startText,
          style: greyRegularTextStyle,
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            endText,
            style: blackRegularTextStyle,
          ),
        ),
      ],
    );
  }
}
