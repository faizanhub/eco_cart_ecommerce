import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        physics: const ScrollPhysics(),
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 8.0 / 12.0,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Container(
            color: Colors.white,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: AppColors.greyColor,
                          size: 20,
                        )),
                  ],
                ),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: const AssetImage(
                    AppStrings.backgroundImage,
                  ),
                ),
                const SizedBox(height: 12),
                Text('8.00', style: smallGreenTextStyle),
                const SizedBox(height: 3),
                Text('Fresh Peach', style: mediumSemiBoldBlackTextStyle),
                const SizedBox(height: 3),
                Text('Dozen', style: smallGreyTextStyle),
                const Spacer(),
                const Divider(
                  color: AppColors.lightGreyColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.greenColor,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppStrings.addToCart,
                        style: smallBlackTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
