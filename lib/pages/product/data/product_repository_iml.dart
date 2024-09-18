import 'dart:convert';

import 'package:bloc_learning/common/network/api_services.dart';
import 'package:bloc_learning/pages/product/domain/entities/product.dart';
import 'package:bloc_learning/pages/product/domain/repositery/product_repositery.dart';

class ProductRepositeryImpl extends ProductRepositery {
  final ApiServices _apiServices;

  ProductRepositeryImpl(this._apiServices);

  @override
  Future<List<Product>?> getProduct() async {
    try {
      final response = await _apiServices.get('/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body); // Decode as a list
        print(data);

        // Convert the List<dynamic> to List<Product>
        return data.map((productJson) => Product.fromJson(productJson)).toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
