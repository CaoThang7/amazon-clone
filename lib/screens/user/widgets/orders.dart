import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/screens/order/screens/my_order.dart';
import 'package:amazon_clone/screens/user/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327119/macbook/lbx63wlzlfp7d2cpzrn5.jpg',
    'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327237/women%20fashion/ez4yyuy4y5mulirq4ut2.jpg',
    'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327178/macbook/cgbvxb7rkr8dupaaqnlo.jpg',
  ];

  void navigateMyOrder() {
    Navigator.pushNamed(context, MyOrder.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: GestureDetector(
                onTap: navigateMyOrder,
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(
                image: list[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
