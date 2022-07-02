import 'package:amazon_clone/providers/order_provier.dart';
import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/purchase_detail.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/tracking.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/view_order_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final order = context.watch<OrderProvider>().order;
    return Scaffold(
      appBar: AppBarOrderSuccess(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewOrderDetail(orderItems: widget.orderItem),
            PurchaseDetail(orderItems: widget.orderItem),
            TracKing(status: order.status)
          ],
        ),
      ),
    );
  }
}
