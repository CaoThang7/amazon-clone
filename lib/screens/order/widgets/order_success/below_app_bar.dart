import 'package:flutter/material.dart';

class BelowAppBarOrderSuccess extends StatefulWidget {
  const BelowAppBarOrderSuccess({ Key? key }) : super(key: key);

  @override
  State<BelowAppBarOrderSuccess> createState() => _BelowAppBarOrderSuccessState();
}

class _BelowAppBarOrderSuccessState extends State<BelowAppBarOrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(10),
      child: Container(
        child: Text(
          "Thank you, your order has been placed.",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}