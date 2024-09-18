part of 'product_bloc.dart';

class ProductState {
  final bool isLoading;
  final List<Product>?  product;
  final String? errorMessage;

  ProductState({
    required this.isLoading,
    this.product,
    this.errorMessage,
  });

  // Factory constructor for initial state
  factory ProductState.initial() {
    return ProductState(isLoading: false);
  }

  // Factory constructor for loading state
  factory ProductState.loading() {
    return ProductState(isLoading: true);
  }

  // Factory constructor for loaded state
  factory ProductState.loaded(  List<Product>? product) {
    return ProductState(
      isLoading: false,
      product: product,
    );
  }

  // Factory constructor for error state
  factory ProductState.error(String message) {
    return ProductState(
      isLoading: false,
      errorMessage: message,
    );
  }

  // copyWith method for creating modified copies of the state
  ProductState copyWith({
    bool? isLoading,
    List<Product>?  product,
    String? errorMessage,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      product: product ?? this.product,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}


/*import 'package:bloc_learning/pages/product/domain/entities/product.dart';
import 'package:bloc_learning/pages/product/domain/entities/category.dart'; // Example import

class ProductState {
  final bool isProductLoading;
  final bool isCategoryLoading;
  final Product? product;
  final Category? category; // Additional model
  final String? errorMessage;

  ProductState({
    required this.isProductLoading,
    required this.isCategoryLoading,
    this.product,
    this.category,
    this.errorMessage,
  });

  // Factory constructor for initial state
  factory ProductState.initial() {
    return ProductState(
      isProductLoading: false,
      isCategoryLoading: false,
    );
  }

  // Factory constructor for loading state
  factory ProductState.productLoading() {
    return ProductState(
      isProductLoading: true,
      isCategoryLoading: false,
    );
  }

  factory ProductState.categoryLoading() {
    return ProductState(
      isProductLoading: false,
      isCategoryLoading: true,
    );
  }

  // Factory constructor for loaded state with Product
  factory ProductState.productLoaded(Product product) {
    return ProductState(
      isProductLoading: false,
      isCategoryLoading: false,
      product: product,
    );
  }

  // Factory constructor for loaded state with Category
  factory ProductState.categoryLoaded(Category category) {
    return ProductState(
      isProductLoading: false,
      isCategoryLoading: false,
      category: category,
    );
  }

  // Factory constructor for error state
  factory ProductState.error(String message) {
    return ProductState(
      isProductLoading: false,
      isCategoryLoading: false,
      errorMessage: message,
    );
  }

  // copyWith method for creating modified copies of the state
  ProductState copyWith({
    bool? isProductLoading,
    bool? isCategoryLoading,
    Product? product,
    Category? category,
    String? errorMessage,
  }) {
    return ProductState(
      isProductLoading: isProductLoading ?? this.isProductLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      product: product ?? this.product,
      category: category ?? this.category,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
*/