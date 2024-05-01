import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  deleteProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
