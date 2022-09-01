import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:eco_cart_ecommerce/core/utils/extensions.dart';
import 'package:eco_cart_ecommerce/ui/screens/cart/cart_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail/categories_detail_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_viewmodel.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_screen.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_homescreen_row.dart';
import 'package:eco_cart_ecommerce/ui/widgets/eco_textfield.dart';
import 'package:eco_cart_ecommerce/ui/widgets/home_widgets/featured_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (_, model, __) => SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffF4F5F9),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                Navigator.pushNamed(context, CartScreen.routeName);

                // await MySharedPreference().removeUserData();
                // Navigator.pushNamed(context, LoginScreen.routeName);
              },
              backgroundColor: AppColors.greenColor,
              child: const Icon(Icons.shopping_bag_outlined),
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
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xff868889)),
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
                          child: model.allCategoriesList.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.greenColor,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: model.allCategoriesList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            CategoriesDetailScreen.routeName,
                                            arguments:
                                                model.allCategoriesList[index],
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Color(model
                                                      .allCategoriesList[index]
                                                      .color!
                                                      .getHexValue())
                                                  .withOpacity(0.2),
                                              child: Image.network(
                                                model.allCategoriesList[index]
                                                        .icon ??
                                                    '',
                                                height: 22,
                                                width: 22,
                                                errorBuilder: (context,
                                                        exception,
                                                        stackTrack) =>
                                                    const Icon(
                                                  Icons.error,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              model.allCategoriesList[index]
                                                      .title ??
                                                  '',
                                              style: mediumGreyTextStyle,
                                            )
                                          ],
                                        ),
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

                      model.allProductsList.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.greenColor,
                              ),
                            )
                          : FeaturedProducts(
                              allProductsList: model.allProductsList),

                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
