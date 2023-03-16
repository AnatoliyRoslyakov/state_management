import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/business/cubit/product_cubit.dart';
import 'package:state_management/services/repositiry_product.dart';

import '../business/bloc/counter_bloc.dart';
import '../widgets/list_products.dart';
import '../widgets/shopping_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productRepository = RepositoryProduct();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            productRepositiry: productRepository,
          ),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        // BlocProvider(create: (context) => CartBloc(),)
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Simple State Management"),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(child: ListProducts())],
        ),
        floatingActionButton: ShoppingButton(),
      ),
    );
  }
}
