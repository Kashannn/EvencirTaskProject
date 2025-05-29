
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/product_model.dart';
import '../../provider/CategoryProvider.dart';
import '../../provider/ProductsProvider.dart';
import '../const/String.dart';
import 'api-services.dart';


// get all products from API
Future<List<Product>> getProducts(BuildContext context) async {
  // Get products from API
  final response = await CallApi().getData('$productsUrl');

  if (response.statusCode == 200) {
    final List<dynamic> productsData = json.decode(response.body)['products'];
    List<Product> productsList = productsData.map((data) => Product.fromJson(data)).toList();
    Provider.of<ProductsProvider>(context, listen: false).setProducts(productsList);
    return productsList;

  } else {
    throw Exception('Failed to load products');
  }
}



Future<List<String>> getCategories(BuildContext context) async {
  final response = await CallApi().getData('$categoriesUrl');

  if (response.statusCode == 200) {
    final List<dynamic> categoriesData = json.decode(response.body);
    List<String> categoriesList = categoriesData
        .map((category) => category['name'] as String)
        .toList();

    Provider.of<CategoriesProvider>(context, listen: false)
        .setCategories(categoriesList);

    return categoriesList;
  } else {
    throw Exception('Failed to load categories');
  }
}

