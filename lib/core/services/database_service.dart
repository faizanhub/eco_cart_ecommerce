import 'package:eco_cart_ecommerce/constants/configs.dart';
import 'package:eco_cart_ecommerce/core/models/all_categories.dart';
import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:eco_cart_ecommerce/core/models/category_by_id.dart';
import 'package:eco_cart_ecommerce/core/services/network_service.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  final NetworkService _networkService = NetworkService();

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

  Future<AllProductsResponse> getAllProducts(String token) async {
    String allProductsUrl = '${AppConfigs.baseUrl}${AppConfigs.getAllProducts}';

    try {
      var response =
          await _networkService.getGetApiResponse(allProductsUrl, token);
      var allProductsResponse = AllProductsResponse.fromJson(response);

      return allProductsResponse;
    } catch (e) {
      debugPrint('Error occurred while getting all products $e');
      rethrow;
    }
  }

  Future<CategoryByIDResponse> getAllProductsByID(String token, int id) async {
    String getCategoryByIdUrl =
        '${AppConfigs.baseUrl}${AppConfigs.getAllProducts}/$id';

    try {
      var response =
          await _networkService.getGetApiResponse(getCategoryByIdUrl, token);
      var getCategoryByIdResponse = CategoryByIDResponse.fromJson(response);

      return getCategoryByIdResponse;
    } catch (e) {
      debugPrint('Error occurred while getting category by id $e');
      rethrow;
    }
  }

  Future createOrder(Map<String, dynamic> data, String token) async {
    String createOrderUrl = '${AppConfigs.baseUrl}${AppConfigs.order}';

    try {
      var jsonResponse =
          await _networkService.getPostApiResponse(createOrderUrl, data, token);

      return jsonResponse;
    } catch (e) {
      debugPrint('Error occurred while creating order $e');
      rethrow;
    }
  }
}
