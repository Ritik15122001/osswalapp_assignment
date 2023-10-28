import 'package:flutter/material.dart';

import '../Model/FavModel.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> favoriteProducts = [];

  void addToFavorites(Product product) {
    product.isFavorite = true;
    favoriteProducts.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    product.isFavorite = false;
    favoriteProducts.remove(product);
    notifyListeners();
  }
}
