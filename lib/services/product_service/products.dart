import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:products_app/model/product_model.dart';


class ProductProvider with ChangeNotifier {
  List<Productdetails> _products = [];
  bool _isLoading = false;

  List<Productdetails> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _products = data.map((item) => Productdetails.fromJson(item)).toList();
      print(_products);
    } else {
      throw Exception('Failed to load products');
    }
    _isLoading = false;
    notifyListeners();
  }

  void sortProductsByPrice() {
    _products.sort((a, b) => a.price!.compareTo(b.price as num));
    notifyListeners();
  }
}
