import 'package:amazon_clone/providers/order_provier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';

class ViewOrderDetail extends StatefulWidget {
  final orderItems;
  const ViewOrderDetail({Key? key, required this.orderItems}) : super(key: key);

  @override
  State<ViewOrderDetail> createState() => _ViewOrderDetailState();
}

class _ViewOrderDetailState extends State<ViewOrderDetail> {
  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderProvider>().order;
    MoneyFormatter price = MoneyFormatter(
        amount: widget.orderItems['product_id']['price'].toDouble());
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "View order details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 197, 192, 192))),
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order Date: ${DateFormat().format(
                          DateTime.fromMillisecondsSinceEpoch(order.orderedAt!),
                        )}'),
                        Text("Order ID: ${order.id}"),
                        Text("Order Total: ${price.output.symbolOnLeft}"),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
