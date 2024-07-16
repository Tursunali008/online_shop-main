import 'package:online_shop/models/cart_item.dart';

class Order {
  final List<CartItem> items;
  final DateTime date;

  Order({required this.items, required this.date});
}