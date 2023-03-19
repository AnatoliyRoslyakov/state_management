import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/bloc/product_bloc.dart';
import '../business/bloc/product_state.dart';
import '../widgets/list_products.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
     var cartList = BlocProvider.of<CartBloc>(context).items;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Shopping Cart"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Color.fromARGB(255, 244, 54, 70),
                  Color.fromARGB(255, 54, 33, 243)
                ])),
          ),
        ),
        body: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: ((context, index) {
              return Container(color: index%2==0 ? Colors.white: Colors.blue[50], width: 50,
                child: ListTile(title: Text('ID:${cartList[index]}'), leading: Icon(Icons.numbers_rounded),));
              // return CardProduct(index: cartList[index], state: null,);
            }))
         );});
      
  }
}
