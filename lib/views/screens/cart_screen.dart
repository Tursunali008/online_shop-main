import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubits/cart_cubit.dart';
import 'package:online_shop/cubits/order_cubit.dart';
import 'package:online_shop/models/cart_item.dart';
import 'package:online_shop/views/screens/order_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartItems) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      title: Text(cartItem.product.title),
                      subtitle: Text('Quantity: ${cartItem.quantity}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              context.read<CartCubit>().removeFromCart(cartItem.product);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              context.read<CartCubit>().addToCart(cartItem.product);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<OrderCubit>().placeOrder(cartItems);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen()));
                },
                child: Text('Place Order'),
              ),
            ],
          );
        },
      ),
    );
  }
}
