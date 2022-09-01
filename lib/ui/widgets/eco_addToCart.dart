import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:flutter/material.dart';

class EcoAddToCart extends StatelessWidget {
  final int cartQty;
  final void Function() onIncrementTap;
  final void Function() onDecrementTap;

  const EcoAddToCart({
    Key? key,
    required this.cartQty,
    required this.onIncrementTap,
    required this.onDecrementTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrementTap,
            child: const Icon(
              Icons.remove_outlined,
              color: AppColors.greenColor,
            ),
          ),
          Expanded(
              child: Center(
            child: Text('$cartQty'),
          )),
          GestureDetector(
            onTap: onIncrementTap,
            child: const Icon(
              Icons.add,
              color: AppColors.greenColor,
            ),
          ),
        ],
      ),
    );
  }
}
