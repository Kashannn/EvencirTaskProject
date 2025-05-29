import 'package:flutter/material.dart';

import '../Model/product_model.dart';


class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  // Method to set the products
  void setProducts(List<Product> products) {
    _products = products;
    _filteredProducts =
        products;
    notifyListeners();
  }

  // Getter to access the products
  List<Product> get products => _products;

  // Getter to access the filtered products
  List<Product> get filteredProducts => _filteredProducts;

  // Method to search and filter products by category and search query
  void searchProducts(String query) {
    final lowerQuery = query.toLowerCase();
    _filteredProducts = _products.where((product) {
      return (product.name?.toLowerCase().contains(lowerQuery) ?? false) ||
          (product.description?.toLowerCase().contains(lowerQuery) ?? false) ||
          (product.brand?.toLowerCase().contains(lowerQuery) ?? false) ||
          (product.category?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
    notifyListeners();
  }



}
