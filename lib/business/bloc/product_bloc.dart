import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ProductAdded(cartItem: [])){

    on<AddProduct>((event, emit){
      _cartItems.add(event.productIndex);
       emit(ProductAdded(cartItem: _cartItems));
    });

    on<RemoveProduct>((event, emit){
      _cartItems.remove(event.productIndex);
       emit(ProductRemoved(cartItem: _cartItems));
    });
  }

  final List<int> _cartItems = [];
  List<int> get items => _cartItems;

}