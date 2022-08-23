import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EcoHomeScreenRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onIconPress;

  const EcoHomeScreenRow({
    Key? key,
    required this.text,
    required this.icon,
    this.onIconPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: smallSemiBoldBlackTextStyle,
          ),
          IconButton(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: Icon(
              icon,
              color: const Color(0xff868889),
            ),
          )
        ],
      ),
    );
  }
}
