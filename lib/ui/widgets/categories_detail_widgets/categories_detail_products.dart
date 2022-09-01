import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:eco_cart_ecommerce/core/models/category_by_id.dart';
import 'package:eco_cart_ecommerce/core/providers/cart_provider.dart';
import 'package:eco_cart_ecommerce/core/utils/extensions.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_addToCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDetailProducts extends StatelessWidget {
  final List<Product> allProductsList;

  const CategoriesDetailProducts({
    super.key,
    required this.allProductsList,
  });

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return allProductsList.isEmpty
        ? const Center(
            child: Text('No Items yet'),
          )
        : GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: const ScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 8.0 / 13.0,
            children: allProductsList
                .map(
                  (product) => Container(
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
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color('${product.color}'.getHexValue())
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: ClipRRect(
                                child: Image.network(
                                  '${product.image}',
                                  // fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                  errorBuilder:
                                      (context, exception, stackTrack) =>
                                          const Icon(
                                    Icons.error,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text('${product.price}', style: smallGreenTextStyle),
                        const SizedBox(height: 3),
                        Text('${product.title}',
                            style: mediumSemiBoldBlackTextStyle),
                        const SizedBox(height: 3),
                        Text('${product.unit}', style: smallGreyTextStyle),
                        const Spacer(),
                        const Divider(
                          color: AppColors.lightGreyColor,
                        ),
                        cartProvider.isProductAdded(product)
                            ? EcoAddToCart(
                                cartQty: cartProvider.getQty(product),
                                onIncrementTap: () =>
                                    cartProvider.incrementCart(product),
                                onDecrementTap: () =>
                                    cartProvider.decrementCart(product),
                              )
                            : GestureDetector(
                                onTap: () {
                                  cartProvider.incrementCart(product);
                                },
                                child: Padding(
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
                                ),
                              ),
                      ],
                    ),
                  ),
                )
                .toList());
  }
}
