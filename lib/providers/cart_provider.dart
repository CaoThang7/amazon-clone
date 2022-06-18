import 'package:amazon_clone/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(
    id: '',
    user_id: '',
    cartItems: [],
    createdAt: DateTime.parse('2020-06-16T09:07:41.150+00:00'),
    updatedAt: DateTime.parse('2020-06-16T09:07:41.150+00:00'),
  );

  Cart get cart => _cart;

  void setCart(String cart) {
    _cart = Cart.fromJson(cart);
    notifyListeners();
  }

  void setCartFromModel(Cart cart) {
    _cart = cart;
    notifyListeners();
  }
}
