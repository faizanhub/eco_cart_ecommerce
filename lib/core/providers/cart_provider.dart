import 'package:eco_cart_ecommerce/core/models/all_products.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get productList => _productList;

  void resetCart() {
    _productList = [];
    notifyListeners();
  }

  removeProduct(Product product) {
    int index = getIndex(product);
    _productList.removeAt(index);
    notifyListeners();
  }

  int getQty(Product product) {
    int index = getIndex(product);
    return _productList[index].qty!;
  }

  isProductAdded(Product product) {
    var index = getIndex(product);
    if (index == -1) {
      return false;
    } else {
      _productList[index].qty ??= 1;
    }
    // notifyListeners();
    return true;
  }

  getIndex(Product p) {
    int index = _productList.indexWhere((element) => element.id == p.id);
    return index;
  }

  incrementCart(Product product) {
    var index = getIndex(product);

    if (index == -1) {
      product.qty = 1;
      _productList.add(product);
    } else {
      _productList[index].qty = _productList[index].qty! + 1;
    }
    notifyListeners();
  }

  decrementCart(Product product) {
    var index = getIndex(product);

    if (index == -1) {
      _productList[index].qty = 1;
    } else {
      if (_productList[index].qty! > 0) {
        _productList[index].qty = _productList[index].qty! - 1;

        if (_productList[index].qty! == 0) {
          _productList.removeAt(index);
        }
      }
    }
    notifyListeners();
  }

  double getSubTotal() {
    var totalPrice = 0.0;
    for (var product in _productList) {
      totalPrice += product.price! * product.qty!;
    }
    return double.parse(totalPrice.toStringAsFixed(2));
  }
}
