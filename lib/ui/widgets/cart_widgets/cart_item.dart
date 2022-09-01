import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:eco_cart_ecommerce/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onAddPress;
  final VoidCallback onSubtractPress;

  const CartItem(
      {Key? key,
      required this.product,
      required this.onAddPress,
      required this.onSubtractPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.14,
        child: Card(
          elevation: 0.0,
          color: AppColors.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 30,
                backgroundColor:
                    Color('${product.color}'.getHexValue()).withOpacity(0.5),
                child: ClipRRect(
                  child: Image.network(
                    '${product.image}',
                  ),
                ),
              ),
              // CircleAvatar(
              //   radius: 30,
              //   backgroundImage: NetworkImage(
              //     '${product.image}',
              //   ),
              // ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price}',
                    style: smallBlackTextStyle.copyWith(
                      color: AppColors.greenColor,
                    ),
                  ),
                  Text('${product.title}',
                      style: semiBoldWhiteTextStyle.copyWith(
                        color: AppColors.blackColor,
                      )),
                  Text('${product.unit}', style: smallestGreyTextStyle),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: onAddPress, child: const Icon(Icons.add)),
                  const SizedBox(height: 8),
                  Text('${product.qty}'),
                  const SizedBox(height: 8),
                  GestureDetector(
                      onTap: onSubtractPress,
                      child: Icon(Icons.remove_outlined)),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
        ));
  }
}
