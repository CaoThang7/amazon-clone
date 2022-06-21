import 'dart:convert';

import 'package:amazon_clone/models/cart.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/screens/address/address_screen.dart';
import 'package:amazon_clone/screens/cart/services/cart_services.dart';
import 'package:amazon_clone/screens/cart/widgets/app_bars.dart';
import 'package:amazon_clone/screens/cart/widgets/cart_card.dart';
import 'package:amazon_clone/screens/cart/widgets/cart_subtotal.dart';
import 'package:amazon_clone/screens/home/widgets/address_box.dart';
import 'package:amazon_clone/widgets/custom_button.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartServices cartService = CartServices();
  @override
  void initState() {
    super.initState();
    fetchAllCart();
  }

  fetchAllCart() async {
    cartService.fetchAllCart(context: context);
    setState(() {});
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    int sum = 0;
    cart.cartItems
        .map((e) => sum += e['quantity'] * e['product_id']['price'] as int)
        .toList();
    return Scaffold(
        appBar: AppBarCart(context),
        body: cart.cartItems == null
            ? const Loader()
            : SingleChildScrollView(
                child: Column(children: [
                  AddressBox(),
                  CartSubtotal(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text:
                          'Proceed to checkout (${cart.cartItems.length.toString()} items)',
                      onTap: () => navigateToAddress(sum),
                      color: Colors.yellow[600],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(color: Colors.black12.withOpacity(0.08), height: 5),
                  Container(
                    child: ListView.builder(
                      itemCount: cart.cartItems!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var dataProduct = cart.cartItems![index];
                        return CartCard(dataProduct: dataProduct, index: index);
                      },
                    ),
                  ),
                ]),
              ));
  }
}
