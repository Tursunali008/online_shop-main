import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/models/cart_item.dart';
import 'package:online_shop/models/order.dart';


class OrderCubit extends Cubit<List<Order>> {
  OrderCubit() : super([]);

  void placeOrder(List<CartItem> items) {
    emit([...state, Order(items: items, date: DateTime.now())]);
  }
}