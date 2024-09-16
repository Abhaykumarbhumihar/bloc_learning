import '../entities/product.dart';
import '../repositery/product_repositery.dart';

class ProductUseCase{
  final ProductRepositery  _productRepositery;

  ProductUseCase(this._productRepositery);
  Future<Product?>getProduct(){
    return _productRepositery.getProduct();
  }
}