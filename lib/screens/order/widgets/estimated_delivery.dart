import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class EstimatedDelivery extends StatefulWidget {
  const EstimatedDelivery({Key? key}) : super(key: key);

  @override
  State<EstimatedDelivery> createState() => _EstimatedDeliveryState();
}

class _EstimatedDeliveryState extends State<EstimatedDelivery> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.08),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Estimated delivery:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 225, 136, 3)),
            ),
            Text(
              "Delivery from 5 to 10 day - June, 2022",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 225, 136, 3)),
            ),
          ],
        ),
      ),
    );
  }
}
