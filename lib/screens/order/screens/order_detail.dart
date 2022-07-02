import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/purchase_detail.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/view_order_detail.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  static const String routeName = '/order-detail';
  final orderItem;
  const OrderDetail({Key? key, required this.orderItem}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOrderSuccess(context),
      // body: Hero(
      //   tag: widget.orderItem,
      //   child: Image.network(
      //     widget.orderItem['product_id']['images'][0],
      //     fit: BoxFit.contain,
      //     height: 100,
      //     width: 135,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewOrderDetail(orderItems:widget.orderItem),
            PurchaseDetail(orderItems:widget.orderItem)
          ],
        ),
      ),
    );
  }
}
