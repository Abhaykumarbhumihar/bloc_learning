import 'dart:convert';

import 'package:bloc_learning/common/network/api_services.dart';
import 'package:bloc_learning/pages/product/domain/entities/product.dart';
import 'package:bloc_learning/pages/product/domain/repositery/product_repositery.dart';

class ProductRepositeryImpl extends ProductRepositery {
  final ApiServices _apiServices;

  ProductRepositeryImpl(this._apiServices);

  @override
  Future<Product?> getProduct() async {
    try {
      final response = await _apiServices.get('/products');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return Product.fromJson(data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
