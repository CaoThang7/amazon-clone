import 'package:amazon_clone/providers/cart_provider.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/screens/cart/widgets/cart_card.dart';
import 'package:amazon_clone/screens/order/services/order_services.dart';
import 'package:amazon_clone/screens/order/widgets/app_bars.dart';
import 'package:amazon_clone/screens/order/widgets/estimated_delivery.dart';
import 'package:amazon_clone/screens/order/widgets/total_price.dart';
import 'package:amazon_clone/widgets/custom_button.dart';
import 'package:amazon_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/radio_button_group_widget.dart';
import 'package:amazon_clone/constants/global_variables.dart';

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
  final OrderServices orderServices = OrderServices();
  int paymentValue = 0;
  Color titleColor = Colors.white;
  String? payment_methods = "COD";

  void setPayment(value) {
    setState(() {
      paymentValue = int.parse(value.toString());
      if (value == 0) {
        payment_methods = "COD";
      }
      if (value == 1) {
        payment_methods = "Offline payments";
      }
    });
  }

  void addToOrder(String address) {
    orderServices.addToOrder(
      context: context,
      totalPrice: widget.totalAmount,
      address: address,
      payment_methods: payment_methods!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    final user = context.watch<UserProvider>().user;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarOrder(context)),
        body: cart.cartItems == null
            ? const Loader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    BelowAppBarOrder(),
                    const SizedBox(height: 5),
                    RadioButtonGroup(
                      valueRaido: 0,
                      paymentValue: paymentValue,
                      payment_methods: payment_methods,
                      title: "COD",
                      subtitle: GlobalVariables.subTitleRaidoCOD,
                      onchange: setPayment,
                      titleColor: titleColor,
                    ),
                    RadioButtonGroup(
                      valueRaido: 1,
                      paymentValue: paymentValue,
                      payment_methods: payment_methods,
                      title: "Offline payments",
                      subtitle: GlobalVariables.subTitleRaidoPayments,
                      onchange: setPayment,
                      titleColor: titleColor,
                    ),
                    EstimatedDelivery(),
                    cart.cartItems == null
                        ? const Loader()
                        : Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              child: ListView.builder(
                                itemCount: cart.cartItems!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var dataProduct = cart.cartItems![index];
                                  return CartCard(
                                      dataProduct: dataProduct, index: index);
                                },
                              ),
                            ),
                          ),
                    TotalPrice(totalAmount: widget.totalAmount),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomButton(
                        text: 'Place your order',
                        onTap: () {
                          addToOrder(user.address);
                        },
                        color: Colors.yellow[600],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
