import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/database_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  final _databaseService = DatabaseService();

  bool _isLoading = false;
  List<CategoriesData> _allCategoriesList = [];
  List<Product> _allProductsList = [];

  List<CategoriesData> get allCategoriesList => _allCategoriesList;
  List<Product> get allProductsList => _allProductsList;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    init();
  }

  void setIsLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  init() async {
    try {
      LoginData userData = await MySharedPreference().getUserData();

      AllCategoriesResponse allCategoriesResponse =
          await _databaseService.getAllCategories(userData.accessToken ?? '');

      for (var data in allCategoriesResponse.data!) {
        _allCategoriesList.add(data);
      }

      notifyListeners();

      AllProductsResponse allProductsResponse =
          await _databaseService.getAllProducts(userData.accessToken ?? '');

      for (var data in allProductsResponse.data!) {
        _allProductsList.add(data);
      }

      notifyListeners();
    } catch (e) {
      debugPrint('$e');
    }
  }
}
