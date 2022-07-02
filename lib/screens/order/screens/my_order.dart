import 'package:amazon_clone/providers/order_provier.dart';
import 'package:amazon_clone/screens/order/screens/order_detail.dart';
import 'package:amazon_clone/screens/order/services/order_services.dart';
import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/screens/order/widgets/my_order/order_empty.dart';
import 'package:amazon_clone/screens/order/widgets/order_detail/order_card.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  static const String routeName = '/my-order';
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final OrderServices orderService = OrderServices();
  @override
  void initState() {
    super.initState();
    fetchMyOrder();
  }

  fetchMyOrder() async {
    orderService.fetchMyOrder(context: context);
    setState(() {});
  }

  void navigatorOrderDetail(var orderItem) {
    Navigator.pushNamed(
      context,
      OrderDetail.routeName,
      arguments: orderItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    final order = context.watch<OrderProvider>().order;
    return Scaffold(
        appBar: AppBarOrderSuccess(context),
        body: order.id == ''
            ? OrderEmpty()
            : SingleChildScrollView(
                child: Container(
                  child: ListView.builder(
                    itemCount: order.cartItems!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var dataProduct = order.cartItems![index];
                      return GestureDetector(
                        onTap: () {
                          navigatorOrderDetail(dataProduct);
                        },
                        child: OrderCard(orderItem:dataProduct)
                      );
                    },
                  ),
                ),
              ));
  }
}
