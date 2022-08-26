import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/auth_service.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:eco_cart_ecommerce/core/utils/utils.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  bool isShowPassword = true;

  bool isLoading = false;

  final _sharedPreference = MySharedPreference();

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  toggleIsShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  Future<void> signUp(Map<String, dynamic> data, BuildContext context) async {
    setIsLoading(true);

    try {
      LoginData userData = await AuthService().signUp(data);

      _sharedPreference.saveUserData(userData);

      Navigator.pushNamed(context, HomeScreen.routeName);

      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
      Utils.showFlushBar(context, 'Error', e.toString());
    }
  }
}
