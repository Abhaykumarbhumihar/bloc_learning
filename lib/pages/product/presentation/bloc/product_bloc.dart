import 'package:bloc/bloc.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecase/prduct_usecase.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase _productUseCase;

  ProductBloc(this._productUseCase) : super(ProductState.initial()) {
    on<FetchProduct>(getProduct);
  }

  Future<void> getProduct(
      FetchProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final product = await _productUseCase.getProduct();
      if (product != null) {
        emit(ProductState.loaded(product));
      } else {
        emit(ProductState.error("Product not found"));
      }
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
