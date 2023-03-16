import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/bloc/counter_bloc.dart';
import '../business/bloc/product_state.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Shopping Page"),
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
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              height: 50,
              color: index % 2 == 0 ? Colors.blue[50] : Colors.white,
              child: ListTile(title: Text('1221')),
            );
          }),
        ));
  }
}
