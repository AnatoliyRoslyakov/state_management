import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/cubit/product_state.dart';

import 'package:state_management/model/product.dart';
import 'package:state_management/services/repositiry_product.dart';

class ProductCubit extends Cubit<ProductState> {
  final RepositoryProduct productRepositiry;
  ProductCubit({required this.productRepositiry}) : super(ProductState());
  Future<void> getProducts() async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: '',
    ));
    try {
      List<Product> loadedProductList =
          await productRepositiry.getAllProducts();
      emit(state.copyWith(
          isLoading: false, isLoaded: loadedProductList, errorMessage: ''));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
