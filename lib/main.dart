import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management/pages/shopping_page.dart';
import 'package:state_management/services/repositiry_product.dart';

import 'business/bloc/product_bloc.dart';
import 'business/cubit/product_cubit.dart';
import 'pages/home_page.dart';

void main() async {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const ShoppingPage();
          },
        )
      ])
]);

class MyApp extends StatelessWidget {
 MyApp({super.key});
final productRepository = RepositoryProduct();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ProductCubit(productRepositiry: productRepository)),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    ));
  }
}
