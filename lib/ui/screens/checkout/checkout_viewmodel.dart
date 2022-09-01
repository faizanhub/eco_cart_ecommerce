import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/database_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:eco_cart_ecommerce/core/utils/utils.dart';
import 'package:eco_cart_ecommerce/ui/screens/order_placed/order_placed_screen.dart';
import 'package:flutter/material.dart';

class CheckOutViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  createOrder(Map<String, dynamic> data, BuildContext context) async {
    setIsLoading(true);

    LoginData userData = await MySharedPreference().getUserData();

    DatabaseService()
        .createOrder(data, userData.accessToken ?? '')
        .then((jsonResponse) {
      debugPrint('the id is ${jsonResponse['data']['id']}');

      int id = jsonResponse['data']['id'] as int;
      setIsLoading(false);
      Navigator.pushNamed(context, OrderPlacedScreen.routeName, arguments: id);
    }).onError((error, stackTrace) {
      setIsLoading(false);
      Utils.showFlushBar(context, 'Error', error.toString());
    });
  }
}
