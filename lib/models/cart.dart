import 'dart:convert';
import 'dart:ffi';

import 'package:amazon_clone/models/product.dart';

class Cart {
  final String? id;
  final String? user_id;
  var cartItems;
  DateTime createdAt;
  DateTime updatedAt;

  Cart(
      {this.id,
      required this.user_id,
      required this.cartItems,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': user_id,
      'cartItems': cartItems,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['_id'],
      user_id: map['user_id'],
      cartItems: map['cartItems'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  Cart copyWith({
    String? id,
    String? user_id,
    var cartItems,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cart(
        id: id ?? this.id,
        user_id: user_id ?? this.user_id,
        cartItems: cartItems ?? this.cartItems,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}
