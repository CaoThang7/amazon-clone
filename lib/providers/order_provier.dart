import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  Order _order = Order(
      id: '',
      user_id: '',
      cartItems: [],
      totalPrice: 0,
      address: '',
      payment_methods: '',
      orderedAt: 0,
      status: 0);

  Order get order => _order;

  void setOrder(String order) {
    _order = Order.fromJson(order);
    notifyListeners();
  }

  void setOrderFromModel(Order order) {
    _order = order;
    notifyListeners();
  }
}
