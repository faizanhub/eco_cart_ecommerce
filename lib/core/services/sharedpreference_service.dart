import 'dart:convert';

import 'package:eco_cart_ecommerce/constants/configs.dart';
import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  Future<bool> saveUserData(LoginData userData) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        AppConfigs.userDataKey, jsonEncode(userData.toJson()));
    return true;
  }

  Future<LoginData> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(AppConfigs.userDataKey)) {
      LoginData userData = LoginData.fromJson(
          jsonDecode((prefs.getString(AppConfigs.userDataKey) ?? '')));

      return userData;
    } else {
      throw Exception('Some Error occurred while shared preference');
    }

    // return true;
  }

  Future<bool> removeUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(AppConfigs.userDataKey)) {
      await prefs.remove(AppConfigs.userDataKey);
    }

    return true;
  }
}
