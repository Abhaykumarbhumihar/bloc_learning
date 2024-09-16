import 'package:bloc_learning/pages/product/domain/entities/product.dart';

abstract class ProductRepositery{
  Future<Product?>getProduct();
}