import 'package:eco_cart_ecommerce/constants/configs.dart';
import 'package:eco_cart_ecommerce/core/models/login_response.dart';
import 'package:eco_cart_ecommerce/core/services/network_service.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  NetworkService _networkService = NetworkService();

  Future<void> login(Map<String, dynamic> data) async {
    String loginUrl = '${AppConfigs.baseUrl}${AppConfigs.signIn}';

    try {
      var response = await _networkService.getPostApiResponse(loginUrl, data);
      var jsonResponse = LoginResponse.fromJson(response);

      print(jsonResponse.data?.accessToken);
    } catch (e) {
      debugPrint('Error occurred while Login $e');
      rethrow;
    }
  }

  signUp() {}
}
