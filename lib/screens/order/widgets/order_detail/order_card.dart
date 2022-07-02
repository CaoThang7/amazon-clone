import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final orderItem;
  const OrderCard({Key? key, required this.orderItem}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(widget.orderItem['product_id']['name'],
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.orderItem['product_id']['category']),
        leading: Hero(
          tag: widget.orderItem,
          child: Image.network(
            widget.orderItem['product_id']['images'][0],
            fit: BoxFit.contain,
            height: 150,
            width: 100,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
