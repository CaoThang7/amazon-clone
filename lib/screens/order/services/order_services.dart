import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/cart.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/providers/order_provier.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/screens/order/screens/order_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

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
          if (data['msg'] == 'order success!') {
            Timer(Duration(seconds: 5), () {
              Navigator.pushNamed(context, OrderSuccess.routeName);
            });
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void fetchMyOrder({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/order/${userProvider.user.id}'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var orderlist = json.decode(res.body);
            for (int i = 0; i < orderlist.length; i++) {
              var cartItems = orderlist[i]['cartItems'];
              String userId = orderlist[i]['user_id'];
              String idOrder = orderlist[i]['_id'];
              int orderedAt = orderlist[i]['orderedAt'];
              int status = orderlist[i]['status'];
              Order order = orderProvider.order.copyWith(
                id: idOrder,
                user_id: userId,
                cartItems: cartItems,
                orderedAt: orderedAt,
                status: status
              );
              orderProvider.setOrderFromModel(order);
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
