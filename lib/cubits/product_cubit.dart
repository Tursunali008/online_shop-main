import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/models/product.dart';

class ProductCubit extends Cubit<List<Product>> {
  ProductCubit()
      : super([
          Product(
            category: "Dars",
            count: 48,
            id: UniqueKey().toString(),
            imageUrl: "https://bogatyr.club/uploads/posts/2023-06/1686966590_bogatyr-club-p-volk-na-fone-luni-krasivo-58.jpg",
            price: 123.567,
            title: "Kitob",
          ),
          Product(
            category: "Dars",
            count: 34,
            id: UniqueKey().toString(),
            imageUrl: "https://bogatyr.club/uploads/posts/2023-06/1686966590_bogatyr-club-p-volk-na-fone-luni-krasivo-58.jpg",
            price: 435.5467,
            title: "Qalam",
          ),
          Product(
            category: "Dars",
            count: 45,
            id: UniqueKey().toString(),
            imageUrl: "https://bogatyr.club/uploads/posts/2023-06/1686966590_bogatyr-club-p-volk-na-fone-luni-krasivo-58.jpg",
            price: 1.764,
            title: "Ruchka",
          ),
        ]);

  void addProduct(Product product) {
    emit([...state, product]);
  }

  void editProduct(Product updatedProduct) {
    final products = state;
    final index = products.indexWhere((product) => product.id == updatedProduct.id);
    if (index != -1) {
      final updatedProducts = List<Product>.from(products)..[index] = updatedProduct;
      emit(updatedProducts);
    }
  }

  void deleteProduct(String id) {
    emit(state.where((product) => product.id != id).toList());
  }
}
