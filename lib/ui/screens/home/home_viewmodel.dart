import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/database_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  bool isLoading = false;

  List<CategoriesData> allCategoriesList = [];

  final _databaseService = DatabaseService();

  HomeViewModel() {
    init();
  }

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  init() async {
    try {
      LoginData userData = await MySharedPreference().getUserData();

      setIsLoading(true);

      AllCategoriesResponse allCategoriesResponse =
          await _databaseService.getAllCategories(userData.accessToken ?? '');

      for (var data in allCategoriesResponse.data!) {
        allCategoriesList.add(data);
      }
      setIsLoading(false);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
