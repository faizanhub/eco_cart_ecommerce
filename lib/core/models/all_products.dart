class AllProductsResponse {
  String? message;
  int? statusCode;
  List<Product>? data;

  AllProductsResponse({this.message, this.statusCode, this.data});

  AllProductsResponse.fromJson(Map<String, dynamic> json) {
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
    data['message'] = message;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  int? catId;
  String? title;
  String? unit;
  int? stockAvailable;
  String? image;
  String? color;
  double? price;
  int? qty;

  Product(
      {this.id,
      this.catId,
      this.title,
      this.unit,
      this.stockAvailable,
      this.image,
      this.color,
      this.price,
      this.qty});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['catId'];
    title = json['title'];
    unit = json['unit'];
    stockAvailable = json['stockAvailable'];
    image = json['image'];
    color = json['color'];
    price = json['price'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['catId'] = catId;
    data['title'] = title;
    data['unit'] = unit;
    data['stockAvailable'] = stockAvailable;
    data['image'] = image;
    data['color'] = color;
    data['price'] = price;
    data['qty'] = qty;
    return data;
  }
}
