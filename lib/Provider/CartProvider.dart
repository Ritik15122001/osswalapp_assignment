import 'package:flutter/foundation.dart';

import '../Model/CartModel.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItemToCart(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
