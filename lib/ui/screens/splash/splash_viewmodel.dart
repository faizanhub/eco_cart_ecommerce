import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/sharedpreference_service.dart';
import 'package:eco_cart_ecommerce/ui/screens/home/home_screen.dart';
import 'package:eco_cart_ecommerce/ui/screens/login/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  void checkIsUserLoggedIn(BuildContext context) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await MySharedPreference().getUserData();

      Navigator.pushNamed(context, HomeScreen.routeName);
    } catch (e) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushNamed(context, LoginScreen.routeName);
    }
  }
}
