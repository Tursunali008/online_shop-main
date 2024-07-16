import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubits/order_cubit.dart';
import 'package:online_shop/models/order.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: BlocBuilder<OrderCubit, List<Order>>(
        builder: (context, orders) {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                title: Text('Order ${index + 1}'),
                subtitle: Text('Date: ${order.date}'),
              );
            },
          );
        },
      ),
    );
  }
}
