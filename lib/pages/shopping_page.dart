import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/bloc/counter_bloc.dart';
import '../business/bloc/product_bloc.dart';
import '../business/bloc/product_state.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
    //   var cartList = BlocProvider.of<CartBloc>(context).items;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Container(child: Text('fgfg'));
            }))
        // });
        );
  }
}
