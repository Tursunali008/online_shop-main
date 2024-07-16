import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/models/cart_item.dart';
import 'package:online_shop/models/product.dart';


class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  void addToCart(Product product) {
    final cart = state;
    final index = cart.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      emit([...cart, CartItem(product: product)]);
    } else {
      final updatedItem = cart[index].copyWith(quantity: cart[index].quantity + 1);
      final updatedCart = List<CartItem>.from(cart)..[index] = updatedItem;
      emit(updatedCart);
    }
  }

  void removeFromCart(Product product) {
    final cart = state;
    final index = cart.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      final updatedItem = cart[index].copyWith(quantity: cart[index].quantity - 1);
      if (updatedItem.quantity > 0) {
        final updatedCart = List<CartItem>.from(cart)..[index] = updatedItem;
        emit(updatedCart);
      } else {
        emit(cart.where((item) => item.product.id != product.id).toList());
      }
    }
  }
}