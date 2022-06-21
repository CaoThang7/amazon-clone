import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

AppBar AppBarOrder(BuildContext context) {
  return AppBar(
    centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Text(
        "Place Your Order",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
