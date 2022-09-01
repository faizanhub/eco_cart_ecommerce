import 'package:eco_cart_ecommerce/constants/app_strings.dart';
import 'package:eco_cart_ecommerce/constants/colors.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/ui/screens/categories_detail/categories_detail_viewmodel.dart';
import 'package:eco_cart_ecommerce/ui/widgets/categories_detail_widgets/categories_detail_products.dart';
import 'package:flutter/material.dart';
import 'package:eco_cart_ecommerce/constants/text_styles.dart';
import 'package:provider/provider.dart';

class CategoriesDetailScreen extends StatelessWidget {
  static const String routeName = '/categories_detail_screen';

  CategoriesData categoriesData;

  CategoriesDetailScreen({Key? key, required this.categoriesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoriesDetailViewModel(categoriesData.id ?? 0),
      child: Consumer<CategoriesDetailViewModel>(
        builder: (_, model, __) => Scaffold(
          backgroundColor: AppColors.greyBackgroundColor,
          appBar: AppBar(
            title: Text(
              '${categoriesData.title}',
              style: smallSemiBoldBlackTextStyle,
            ),
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 17.0, right: 17, top: 20),
            child: model.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greenColor,
                    ),
                  )
                : CategoriesDetailProducts(
                    allProductsList: model.categoryByIdList,
                  ),
          ),
        ),
      ),
    );
  }
}
