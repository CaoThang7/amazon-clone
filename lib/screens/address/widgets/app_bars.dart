import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

AppBar AppBarAddress(BuildContext context) {
  return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Text(
        "Enter a shipping address",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
