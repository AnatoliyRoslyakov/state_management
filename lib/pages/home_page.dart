import 'package:flutter/material.dart';
import '../widgets/list_products.dart';
import '../widgets/shopping_button.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      );
    
  }
}
