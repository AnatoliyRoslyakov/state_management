import 'package:equatable/equatable.dart';

import 'package:state_management/model/product.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<Product> isLoaded;
  final String errorMessage;
  ProductState(
      {this.isLoading = false,
      this.isLoaded = const [],
      this.errorMessage = ''});

  @override
  List<Object> get props => [isLoading, isLoaded, errorMessage];

  ProductState copyWith({
    bool? isLoading,
    List<Product>? isLoaded,
    String? errorMessage,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
