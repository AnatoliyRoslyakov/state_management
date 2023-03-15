import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/bloc/product_bloc.dart';

import '../business/cubit/product_cubit.dart';
import '../business/cubit/product_state.dart';
import '../services/repositiry_product.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<ProductCubit>();
    myCubit.getProducts();
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state.errorMessage.isNotEmpty) {
        return Center(child: Text('Error: ${state.errorMessage}'));
      }
      if (state.isLoaded.isNotEmpty) {
        return ListView.builder(
            itemCount: state.isLoaded.length,
            itemBuilder: ((context, index) {
              return CardProduct(
                state: state,
                index: index,
              );
            }));
      }
      return SizedBox.shrink();
    });
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.state,
    required this.index,
  });
  final ProductState state;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: const Color.fromARGB(255, 244, 54, 70),
      margin: const EdgeInsets.all(10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 244, 54, 70), width: 1)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(state.isLoaded[index].title,
              style: const TextStyle(fontWeight: FontWeight.w700)),
        ),
        Image.network(state.isLoaded[index].image,
            height: 200, fit: BoxFit.cover),
        ElevatedButton(
          onPressed: () {
            final product = state.isLoaded[index].title;
            context.read<CounterBloc>().add(CounterIncrementPressed());
            // BlocProvider.of<ProductListBloc>(context).add()
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 54, 33, 243)),
              overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 244, 54, 70))),
          child: const Text('Add to Cart'),
        ),
      ]),
    );
  }
}