import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  void initState() {
    super.initState();
  }

  List list = [
    {
      "name": "Macbook M1 Chip, 13' Retina Display, 8GB RAM, 256GB SSD",
      "image":
          'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327119/macbook/lbx63wlzlfp7d2cpzrn5.jpg',
      "price": "7000"
    },
    {
      "name": "Sweater Casual Basic Fall Pullover",
      "image":
          'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327237/women%20fashion/ez4yyuy4y5mulirq4ut2.jpg',
      "price": "7000"
    },
    {
      "name": "Macbook M2, 14-inch with 8-core CPU and 14-core GPU",
      "image":
          'https://res.cloudinary.com/du9e4pxxu/image/upload/v1654327178/macbook/cgbvxb7rkr8dupaaqnlo.jpg',
      "price": "7000"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          child: Container(
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = list[index];
                return Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(product['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("price: \$${product['price']}"),
                    leading: Image.network(
                      product['image'],
                      fit: BoxFit.contain,
                      height: 150,
                      width: 70,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}
