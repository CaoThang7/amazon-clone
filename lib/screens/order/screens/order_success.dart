import 'package:amazon_clone/screens/auth/auth_screen.dart';
import 'package:amazon_clone/screens/order/screens/my_order.dart';
import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/screens/order/widgets/order_success/below_app_bar.dart';
import 'package:amazon_clone/screens/order/widgets/order_success/message.dart';
import 'package:amazon_clone/widgets/bottom_bar.dart';
import 'package:amazon_clone/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderSuccess extends StatefulWidget {
  static const String routeName = '/order-success';
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  void navigateMyOrder() {
    Navigator.pushNamed(context, MyOrder.routeName);
  }

  void navigateKeepShopping() {
    Navigator.pushNamed(context, BottomBar.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarOrderSuccess(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BelowAppBarOrderSuccess(),
              Message(),
              Padding(
                padding: EdgeInsets.all(10),
                child: CustomButton(
                    text: 'Review or edit recent orders',
                    onTap: () {
                      navigateMyOrder();
                    },
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: CustomButton(
                  text: 'Continue shopping',
                  onTap: () {
                    navigateKeepShopping();
                  },
                  color: Colors.yellow[600],
                ),
              ),
            ],
          ),
        ));
  }
}
