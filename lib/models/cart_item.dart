import 'package:online_shop/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}