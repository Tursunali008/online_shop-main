import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubits/product_cubit.dart';
import 'package:online_shop/models/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String category = '';
  int count = 0;
  String imageUrl = '';
  double price = 0.0;
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Category'),
                  onSaved: (value) {
                    category = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Count'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    count = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image URL'),
                  onSaved: (value) {
                    imageUrl = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    price = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final product = Product(
                        category: category,
                        count: count,
                        id: UniqueKey().toString(),
                        imageUrl: imageUrl,
                        price: price,
                        title: title,
                      );
                      context.read<ProductCubit>().addProduct(product);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
