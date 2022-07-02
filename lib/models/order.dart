import 'dart:convert';
import 'dart:ffi';

import 'package:amazon_clone/models/product.dart';

class Order {
  final String? id;
  final String? user_id;
  var cartItems;
  final int? totalPrice;
  final String? address;
  final String? payment_methods;
  final int? orderedAt;
  final int? status;
  Order({
    this.id,
    required this.user_id,
    required this.cartItems,
    required this.totalPrice,
    required this.address,
    required this.payment_methods,
    required this.orderedAt,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'cartItems': cartItems,
      'totalPrice': totalPrice,
      'address': address,
      'payment_methods': payment_methods,
      'orderedAt': orderedAt,
      'status': status,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'],
      user_id: map['user_id'],
      cartItems: map['cartItems'],
      totalPrice: map['totalPrice'],
      address: map['address'],
      payment_methods: map['payment_methods'],
      orderedAt: map['orderedAt'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  Order copyWith({
    String? id,
    String? user_id,
    var cartItems,
    int? totalPrice,
    String? address,
    String? payment_methods,
    int? orderedAt,
    int? status,
  }) {
    return Order(
        id: id ?? this.id,
        user_id: user_id ?? this.user_id,
        cartItems: cartItems ?? this.cartItems,
        totalPrice: totalPrice ?? this.totalPrice,
        address: address ?? this.address,
        payment_methods: payment_methods ?? this.payment_methods,
        orderedAt: orderedAt ?? this.orderedAt,
        status: status ?? this.status);
  }
}
