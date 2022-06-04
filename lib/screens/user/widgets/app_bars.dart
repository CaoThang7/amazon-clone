import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

AppBar AppBarAccount(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/amazon_in.png',
            width: 120,
            height: 45,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.notifications_outlined),
              ),
              Icon(
                Icons.search,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
