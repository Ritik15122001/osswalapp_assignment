import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/FavModel.dart';
import '../Provider/FavProvider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final favoriteProducts = favoriteProvider.favoriteProducts;
          if (favoriteProducts.isEmpty) {
            return Center(
              child: Text('You have no favorite products.'),
            );
          } else {
            return ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ListTile(
                  // leading: Image.asset(product.imagePath, width: 60, height: 60),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      favoriteProvider?.removeFromFavorites(product);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
