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

class CartServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'user_id': userProvider.user.id,
          'cartItems': {
            'product_id': product.id!,
            'quantity': 1,
          }
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "add to cart success");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //fetch all data cart with id user
  void fetchAllCart({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/cart/${userProvider.user.id}'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var cartlist = json.decode(res.body);
            for (int i = 0; i < cartlist.length; i++) {
              var cartItems = cartlist[i]['cartItems'];
              var userId = cartlist[i]['user_id'];
              var idCart = cartlist[i]['_id'];
              Cart cart = cartProvider.cart
                  .copyWith(id: idCart, user_id: userId, cartItems: cartItems);
              cartProvider.setCartFromModel(cart);
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  //increaseQuantity (update cart)
  void increaseQuantity({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/cart/update'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'idProduct': product.id!,
          'idCart': cartProvider.cart.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/cart/delete/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'idProduct': product.id!,
          'idCart': cartProvider.cart.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "success");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
