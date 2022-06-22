import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:money_formatter/money_formatter.dart';

class TotalPrice extends StatefulWidget {
  final String totalAmount;
  const TotalPrice({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    MoneyFormatter price =
        MoneyFormatter(amount: int.parse(widget.totalAmount).toDouble());
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Shipping to:",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        " ${user.name}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "EstimatedDelivery:",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  Text(
                    "Delivery from 5 to 10 day - June, 2022",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Colors.black12,
                  ),
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                  right: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Totol:",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        '${price.output.symbolOnLeft}',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
