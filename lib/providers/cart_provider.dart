import 'package:amazon_clone/models/cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(
    id: '',
    product_id: {},
    user_id: {},
    quantity: 0,
  );
  int _sum = 0;

  Cart get cart => _cart;
  get sum => _sum;

  void setCart(String cart) {
    _cart = Cart.fromJson(cart);
    notifyListeners();
  }

  void setCartFromModel(Cart cart) {
    _cart = cart;
    notifyListeners();
  }

  void setTotalPrice(int value) {
    _sum = value;
    notifyListeners();
  }
}
