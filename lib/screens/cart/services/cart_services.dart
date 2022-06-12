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
          'quantity': 1,
          'product_id': product.id!,
          'user_id': userProvider.user.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          print("thanh cong");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //fetch all data cart with id user
  Future<List<Cart>> fetchAllCart({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    List<Cart> cartList = [];
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
            //save list product cart from json data to provider cart
            var cartlist = json.decode(res.body);
            var listproductCart = cartlist.map((e) => e['product_id']);
            Cart cart = cartProvider.cart.copyWith(product_id: listproductCart);
            cartProvider.setCartFromModel(cart);

            //sum total price in cart and save provider cart
            int sum = 0;
            cartlist
                .map((e) =>
                    sum += e['quantity'] * e['product_id']['price'] as int)
                .toList();
            cartProvider.setTotalPrice(sum);

            for (int i = 0; i < cartlist.length; i++) {
              cartList.add(
                Cart.fromJson(
                  jsonEncode(
                    cartlist[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
    return cartList;
  }
}
