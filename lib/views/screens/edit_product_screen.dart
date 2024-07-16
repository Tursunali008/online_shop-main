import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/cubits/product_cubit.dart';
import 'package:online_shop/models/product.dart';


class EditProductScreen extends StatefulWidget {
  final Product product;

  EditProductScreen({required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late String category;
  late int count;
  late String imageUrl;
  late double price;
  late String title;

  @override
  void initState() {
    super.initState();
    category = widget.product.category;
    count = widget.product.count;
    imageUrl = widget.product.imageUrl;
    price = widget.product.price;
    title = widget.product.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: category,
                decoration: InputDecoration(labelText: 'Category'),
                onSaved: (value) {
                  category = value!;
                },
              ),
              TextFormField(
                initialValue: count.toString(),
                decoration: InputDecoration(labelText: 'Count'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  count = int.parse(value!);
                },
              ),
              TextFormField(
                initialValue: imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) {
                  imageUrl = value!;
                },
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: title,
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
                    final updatedProduct = Product(
                      category: category,
                      count: count,
                      id: widget.product.id,
                      imageUrl: imageUrl,
                      price: price,
                      title: title,
                    );
                    context.read<ProductCubit>().editProduct(updatedProduct);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}