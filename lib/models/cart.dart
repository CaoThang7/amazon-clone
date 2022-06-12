import 'dart:convert';
import 'dart:ffi';

import 'package:amazon_clone/models/product.dart';

class Cart {
  final String? id;
  var product_id;
  var user_id;
  final double quantity;

  Cart({
    this.id,
    required this.product_id,
    required this.user_id,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': product_id,
      'user_id': user_id,
      'quantity': quantity,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['_id'],
      product_id: map['product_id'] ?? '',
      user_id: map['user_id'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  Cart copyWith({
    String? id,
    var product_id,
    var user_id,
    Double? quantity,
  }) {
    return Cart(
      id: id ?? this.id,
      product_id: product_id ?? this.product_id,
      user_id: user_id ?? this.user_id,
      quantity: this.quantity,
    );
  }
}
