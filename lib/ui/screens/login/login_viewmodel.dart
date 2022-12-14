import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/auth_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:eco_cart_ecommerce/core/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool isShowPassword = true;
  bool isLoading = false;

  final _sharedPreference = MySharedPreference();

  toggleIsShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> login(Map<String, dynamic> data, BuildContext context) async {
    setIsLoading(true);

    try {
      LoginData userData = await AuthService().login(data);

      _sharedPreference.saveUserData(userData);

      Navigator.pushNamed(context, HomeScreen.routeName);

      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      Utils.showFlushBar(context, 'Error', e.toString());
    }
  }
}
