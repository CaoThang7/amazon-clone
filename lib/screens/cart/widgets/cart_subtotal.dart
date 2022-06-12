import 'package:amazon_clone/models/cart.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_formatter/money_formatter.dart';

class CartSubtotal extends StatefulWidget {
  CartSubtotal({Key? key}) : super(key: key);

  @override
  State<CartSubtotal> createState() => _CartSubtotalState();
}

class _CartSubtotalState extends State<CartSubtotal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MoneyFormatter totalPrice = MoneyFormatter(
       amount: context.watch<CartProvider>().sum.toDouble()
    );
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Subtotal ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '${totalPrice.output.symbolOnLeft}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
