import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../business/bloc/counter_bloc.dart';

class ShoppingButton extends StatelessWidget {
  const ShoppingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 54, 33, 243),
      onPressed: () => context.go('/details'),
      child: Stack(children: [
        Icon(
          Icons.shopping_bag,
          size: 45,
        ),
        BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              radius: 12,
              child: Text('$count'),
              backgroundColor: Colors.red,
            ),
          );
        })
      ]),
    );
  }
}
