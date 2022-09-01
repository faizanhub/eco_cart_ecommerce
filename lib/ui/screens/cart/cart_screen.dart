import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/providers/cart_provider.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/cart_widgets/cart_item.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.greyBackgroundColor,
        appBar: AppBar(
          title: Text(
            AppStrings.shoppingCart,
            style: smallSemiBoldBlackTextStyle,
          ),
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cartProvider.productList.isEmpty
                ? const Expanded(
                    flex: 2,
                    child: Center(child: Text('No items in cart yet...')),
                  )
                : Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 17.0, right: 17, top: 20),
                      child: ListView.builder(
                          itemCount: cartProvider.productList.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: ValueKey(cartProvider.productList[index].id),
                              onDismissed: (direction) {
                                cartProvider.removeProduct(
                                    cartProvider.productList[index]);
                              },
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.delete_outlined,
                                    color: AppColors.whiteColor,
                                    size: 40,
                                  ),
                                ),
                              ),
                              child: CartItem(
                                product: cartProvider.productList[index],
                                onAddPress: () {
                                  cartProvider.incrementCart(
                                      cartProvider.productList[index]);
                                },
                                onSubtractPress: () {
                                  cartProvider.decrementCart(
                                      cartProvider.productList[index]);
                                },
                              ),
                            );
                          }),
                    ),
                  ),

            ///bottom widget
            if (cartProvider.productList.isNotEmpty)
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * .30,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal'),
                            Text('\$${cartProvider.getSubTotal()}'),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Shipping Charges'),
                            Text('\$1.6'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: AppColors.greyColor),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                                '\$ ${(cartProvider.getSubTotal() + 1.6).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        const Spacer(),
                        EcoButton(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CheckoutScreen.routeName);
                          },
                          text: AppStrings.checkOut,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
