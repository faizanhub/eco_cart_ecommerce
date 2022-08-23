import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/screens/checkout_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17, top: 20),
                child: ListView(
                  children: [
                    ///one item in cart (make custom widget)

                    SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0.0,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  AppStrings.backgroundImage,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('2.22 x 4'),
                                  SizedBox(height: 5),
                                  Text('Fresh Broccoli'),
                                  SizedBox(height: 5),
                                  Text('1.50 lbs'),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  const SizedBox(height: 8),
                                  Text('5'),
                                  const SizedBox(height: 8),
                                  Icon(Icons.remove_outlined),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0.0,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  AppStrings.backgroundImage,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('2.22 x 4'),
                                  SizedBox(height: 5),
                                  Text('Fresh Broccoli'),
                                  SizedBox(height: 5),
                                  Text('1.50 lbs'),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  const SizedBox(height: 8),
                                  Text('5'),
                                  const SizedBox(height: 8),
                                  Icon(Icons.remove_outlined),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0.0,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  AppStrings.backgroundImage,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('2.22 x 4'),
                                  SizedBox(height: 5),
                                  Text('Fresh Broccoli'),
                                  SizedBox(height: 5),
                                  Text('1.50 lbs'),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  const SizedBox(height: 8),
                                  Text('5'),
                                  const SizedBox(height: 8),
                                  Icon(Icons.remove_outlined),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0.0,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  AppStrings.backgroundImage,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('2.22 x 4'),
                                  SizedBox(height: 5),
                                  Text('Fresh Broccoli'),
                                  SizedBox(height: 5),
                                  Text('1.50 lbs'),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  const SizedBox(height: 8),
                                  Text('5'),
                                  const SizedBox(height: 8),
                                  Icon(Icons.remove_outlined),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        )),
                    SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 0.0,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8),
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  AppStrings.backgroundImage,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('2.22 x 4'),
                                  SizedBox(height: 5),
                                  Text('Fresh Broccoli'),
                                  SizedBox(height: 5),
                                  Text('1.50 lbs'),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  const SizedBox(height: 8),
                                  Text('5'),
                                  const SizedBox(height: 8),
                                  Icon(Icons.remove_outlined),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),

            ///bottom widget
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * .30,
                decoration: BoxDecoration(
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
                          Text('title'),
                          Text('trailing'),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('title'),
                          Text('trailing'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: AppColors.greyColor),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total'),
                          Text('58.2'),
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
