import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/ui/screens/cart_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_homescreen_row.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  final _searchController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F5F9),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          child: Icon(Icons.shopping_bag_outlined),
          backgroundColor: AppColors.greenColor,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),

            ///search area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: EcoTextField(
                controller: _searchController,
                hintText: AppStrings.searchKeywords,
                // labelText: AppStrings.search,
                prefixIcon: const Icon(Icons.search, color: Color(0xff868889)),
                // fillColor: const Color(0xffF4F5F9),
                fillColor: Colors.white,
                suffixIcon:
                    const Icon(Icons.filter_list, color: Color(0xff868889)),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  ///image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Stack(
                      children: [
                        Image.asset(
                          AppStrings.homeImage,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 130,
                          left: 40,
                          child: Text(
                            '20% off on your \nfirst purchase',
                            style: smallSemiBoldBlackTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  ///categories section
                  EcoHomeScreenRow(
                    text: AppStrings.categories,
                    icon: Icons.arrow_forward_ios,
                    onIconPress: () {
                      Navigator.pushNamed(
                          context, CategoriesDetailScreen.routeName);
                    },
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: SizedBox(
                      height: 85,
                      child: ListView.builder(
                        itemCount: 100,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xffE5E5E5),
                                  child: Image.asset(
                                    AppStrings.womanShoppingImage2,
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Vegetables',
                                  style: mediumGreyTextStyle,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  ///featured products
                  EcoHomeScreenRow(
                    text: AppStrings.featuredProducts,
                    icon: Icons.arrow_forward_ios,
                    onIconPress: () {},
                  ),

                  const SizedBox(height: 10),

                  Padding(
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
                              Text('Fresh Peach',
                                  style: mediumSemiBoldBlackTextStyle),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
