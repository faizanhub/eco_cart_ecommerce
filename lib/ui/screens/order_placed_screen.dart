import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  static const String routeName = '/order_placed_screen';

  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 2 - 200),
            Image.asset('assets/images/order.png'),
            const SizedBox(height: 30),
            Text(
              AppStrings.congrats,
              style: semiBoldBlackTextStyle,
            ),
            const SizedBox(height: 15),
            Text(
              AppStrings.orderNumber + '123456' + AppStrings.orderNumber2,
              style: largeGreyTextStyle,
            ),
            const Spacer(),
            EcoButton(onTap: () {}, text: AppStrings.goToHome)
          ],
        ),
      ),
    );
  }
}
