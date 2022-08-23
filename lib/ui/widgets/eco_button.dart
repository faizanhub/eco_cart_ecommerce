import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const EcoButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [
              Color(0xffAEDC81),
              Color(0xff6CC51D),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: semiBoldWhiteTextStyle,
          ),
        ),
      ),
    );
  }
}
