import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/widgets/bottom_bar.dart';
import 'package:amazon_clone/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderEmpty extends StatefulWidget {
  const OrderEmpty({Key? key}) : super(key: key);

  @override
  State<OrderEmpty> createState() => _OrderEmptyState();
}

class _OrderEmptyState extends State<OrderEmpty> {
  void navigateKeepShopping() {
    Navigator.pushNamed(context, BottomBar.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Colors.grey[200],
            ),
            FractionalTranslation(
              translation: Offset(0.0, 0.5),
              child: Container(
                width: MediaQuery.of(context).size.width / 3.0,
                child: Image.asset('assets/images/open-box.jpg'),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
            padding: EdgeInsets.only(left: 50, top: 10, right: 50),
            color: Colors.white,
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  GlobalVariables.orderEmptyTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromRGBO(18, 133, 118, 1)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  GlobalVariables.orderEmptyOne,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  GlobalVariables.orderEmptyTwo,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "or",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    text: 'Continue shopping',
                    onTap: () {
                      navigateKeepShopping();
                    },
                    color: Colors.white),
              ],
            ))
      ],
    ));
  }
}
