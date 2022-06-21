import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  static const String routeName = '/order';
  final String totalAmount;
  const OrderScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarOrder(context)),
        body: cart.cartItems == null
            ? const Loader()
            : SingleChildScrollView(
                child: Column(
                  children: [Text("Order")],
                ),
              ));
  }
}
