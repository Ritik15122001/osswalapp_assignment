import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/CartProvider.dart';
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            leading: Image.asset(item.imageUrl),
            title: Text(item.name),
            subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                context.read<CartProvider>().removeItemFromCart(index);
              },
            ),
          );
        },
      ),
    );
  }
}
