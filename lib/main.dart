import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubits/cart_cubit.dart';
import 'package:online_shop/cubits/order_cubit.dart';
import 'package:online_shop/cubits/product_cubit.dart';
import 'package:online_shop/views/screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => OrderCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}
