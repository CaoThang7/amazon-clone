import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BelowAppBarOrder extends StatefulWidget {
  const BelowAppBarOrder({Key? key}) : super(key: key);

  @override
  State<BelowAppBarOrder> createState() => _BelowAppBarOrderState();
}

class _BelowAppBarOrderState extends State<BelowAppBarOrder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(
                    color: GlobalVariables.importantmessageColor, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Text(
                    GlobalVariables.importantTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10, right: 25),
                  child: Text(
                    GlobalVariables.importantMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 800),
            height: 320,
            width: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: GlobalVariables.importantmessageColor,
            ),
          ),
        ),
      ],
    );
  }
}
