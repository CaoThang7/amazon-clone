import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/cart.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderServices {
  void addToOrder({
    required BuildContext context,
    required String totalPrice,
    required String address,
    required String payment_methods,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/order'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'user_id': userProvider.user.id,
          'cartItems': cartProvider.cart.cartItems,
          'totalPrice': totalPrice,
          'address': address,
          'payment_methods': payment_methods
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var data = json.decode(res.body);
          showSnackBar(context, data['msg']);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
