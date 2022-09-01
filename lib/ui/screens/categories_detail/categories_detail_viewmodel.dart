import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:eco_cart_ecommerce/core/models/category_by_id.dart';
import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/database_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:flutter/foundation.dart';

class CategoriesDetailViewModel with ChangeNotifier {
  CategoriesDetailViewModel(int catId) {
    init(catId);
  }

  final _databaseService = DatabaseService();

  List<Product> _categoryByIdList = [];
  List<Product> get categoryByIdList => _categoryByIdList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  void init(int catId) async {
    try {
      LoginData userData = await MySharedPreference().getUserData();

      setIsLoading(true);
      CategoryByIDResponse categoryByIDResponse = await _databaseService
          .getAllProductsByID(userData.accessToken ?? '', catId);

      for (var data in categoryByIDResponse.data!) {
        _categoryByIdList.add(data);
      }
      setIsLoading(false);

      notifyListeners();
    } catch (e) {
      debugPrint('$e');
    }
  }
}
