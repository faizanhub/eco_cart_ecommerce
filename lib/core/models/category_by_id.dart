import 'package:eco_cart_ecommerce/core/models/all_products.dart';

class CategoryByIDResponse {
  String? message;
  int? statusCode;
  List<Product>? data;

  CategoryByIDResponse({this.message, this.statusCode, this.data});

  CategoryByIDResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
