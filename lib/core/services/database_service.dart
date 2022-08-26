import 'package:eco_cart_ecommerce/constants/configs.dart';
import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/core/services/network_service.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  NetworkService _networkService = NetworkService();

  Future<AllCategoriesResponse> getAllCategories(String token) async {
    String allCategoriesUrl =
        '${AppConfigs.baseUrl}${AppConfigs.getAllCategories}';

    try {
      var response =
          await _networkService.getGetApiResponse(allCategoriesUrl, token);
      var allCategoriesResponse = AllCategoriesResponse.fromJson(response);

      return allCategoriesResponse;
    } catch (e) {
      debugPrint('Error occurred while getting all categories $e');
      rethrow;
    }
  }
}
